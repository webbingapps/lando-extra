# Project

## Project Requirements
- [Docker Desktop](https://www.docker.com/products/docker-desktop/)
- [Lando](https://lando.dev/)

## Getting Started
1. Install Docker
2. Install Lando
3. Run [`lando start`](#code)
4. Run [`lando db-import /path/to/file.sql`](#code)

## Optional but Recommended post-setup
- Add the following terminal aliases of the lando tooling command to your terminal shell profile config file (~/.bashrc, ~/.zshrc, etc) for a more optimized native-feeling workflow:
    ```shell
    alias las='lando start'
    alias lax='lando stop'
    alias n='lando n'
    alias nvm='lando nvm'
    alias node='lando node'
    alias nodemon='lando nodemon'
    alias npm='lando npm'
    alias npx='lando npx'
    alias pnpm='lando pnpm'
    alias yarn='lando yarn'
    alias next='lando next'
    alias php='lando php'
    alias laravel='lando laravel'
    alias composer='lando composer'
    alias wp='lando wp'
    alias artisan='lando php artisan'
    alias pint='lando pint'
    alias xdebug-on='lando xdebug-on'
    alias xdebug-off='lando xdebug-off'
    ```
  
# TODO: Add drupal aliases