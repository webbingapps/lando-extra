# sudo docker build --no-cache --network host -t webbingapps/node:18.17.1-bullseye -t webbingapps/node:latest .
# sudo docker build --network host -t webbingapps/node:18.17.1-bullseye -t webbingapps/node:latest .
# sudo docker push webbingapps/node

FROM buildpack-deps:bullseye

RUN groupadd --gid 1000 node \
  && useradd --uid 1000 --gid node --shell /bin/bash --create-home node

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y --force-yes build-essential curl git gnupg2
RUN apt-get install -y --force-yes zlib1g-dev libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev
RUN apt-get clean -y

ENV NODE_VERSION 18.17.1

RUN ARCH= && dpkgArch="$(dpkg --print-architecture)" \
  && case "${dpkgArch##*-}" in \
    amd64) ARCH='x64';; \
    ppc64el) ARCH='ppc64le';; \
    s390x) ARCH='s390x';; \
    arm64) ARCH='arm64';; \
    armhf) ARCH='armv7l';; \
    i386) ARCH='x86';; \
    *) echo "unsupported architecture"; exit 1 ;; \
  esac \
  # gpg keys listed at https://github.com/nodejs/node#release-keys
  && set -ex \
  && for key in \
    4ED778F539E3634C779C87C6D7062848A1AB005C \
    141F07595B7B3FFE74309A937405533BE57C7D57 \
    74F12602B6F1C4E913FAA37AD3A89613643B6201 \
    DD792F5973C6DE52C432CBDAC77ABFA00DDBF2B7 \
    61FC681DFB92A079F1685E77973F295594EC4689 \
    8FCCA13FEF1D0C2E91008E09770F7A9A5AE15600 \
    C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8 \
    890C08DB8579162FEE0DF9DB8BEAB4DFCF555EF4 \
    C82FA3AE1CBEDC6BE46B9360C43CEC45C17AB93C \
    108F52B48DB57BB0CC439B2997B01419BD92F80A \
  ; do \
      gpg --batch --keyserver hkps://keys.openpgp.org --recv-keys "$key" || \
      gpg --batch --keyserver keyserver.ubuntu.com --recv-keys "$key" ; \
  done \
  && curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-$ARCH.tar.xz" \
  && curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc" \
  && gpg --batch --decrypt --output SHASUMS256.txt SHASUMS256.txt.asc \
  && grep " node-v$NODE_VERSION-linux-$ARCH.tar.xz\$" SHASUMS256.txt | sha256sum -c - \
  && tar -xJf "node-v$NODE_VERSION-linux-$ARCH.tar.xz" -C /usr/local --strip-components=1 --no-same-owner \
  && rm "node-v$NODE_VERSION-linux-$ARCH.tar.xz" SHASUMS256.txt.asc SHASUMS256.txt \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs \
  # smoke tests
  && node --version \
  && npm --version

# Install Ruby 3.2.2 for Shopify Cli
RUN gpg2 --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN \curl -sSL https://get.rvm.io | bash -s -- --version latest
RUN echo 'export PATH="$PATH:/usr/local/rvm/bin"' >> /home/node/.bashrc
RUN echo 'source "/usr/local/rvm/scripts/rvm"' >> /home/node/.bashrc
RUN /bin/bash -l -c ". /etc/profile.d/rvm.sh && rvm install 3.2.2 && rvm --default use 3.2.2"

# Install latest NPM 9.x and Yarn 3.x
SHELL [ "/bin/bash", "-c" ]
WORKDIR /root/
RUN npm install -g --force npm@latest yarn@latest \
  && corepack enable \
  && yarn set version stable \
  && yarn plugin import https://yarn.build/latest \
  && yarn config set nodeLinker node-modules

# Install most used utilities (shopify, deno, next, etc)
RUN npm install -g @shopify/cli @shopify/theme \
  && npm install -g svg-sprite-generator svgo \
  && curl -fsSL https://deno.land/x/install/install.sh | sh

# Install Bun
RUN curl -fsSL https://bun.sh/install | bash
RUN echo 'export PATH="$PATH:/home/node/.bun/bin"' >> /home/node/.bashrc

# Move from root to "node" user to run as non-root
RUN mv /root/.npm /home/node \
  && mv /root/.deno /home/node \
  && mv /root/.yarn /home/node \
  && mv /root/.yarnrc.yml /home/node \
  && mv /root/.bun /home/node \
  && chown -R node:node /home/node /usr/local/lib/node_modules

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT [ "docker-entrypoint.sh" ]

CMD [ "node" ]