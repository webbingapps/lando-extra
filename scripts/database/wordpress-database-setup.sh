#!/bin/bash
set -e

# Init
readonly LANDO_EXTRA_PATH=/lando-extra
readonly APP_PATH=/app
cd $APP_PATH || return

# TODO: Replace with future dedicated toggle-xdebug.sh script
rm -f /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && /etc/init.d/apache2 reload && echo "Xdebug disabled"

#- script remoto con nombre aleatorio (probably in future use with remote management custom script)
#- de remoto se necesitaran:
#   - site url
#   - absolute app path
#   - wp prefix
#   - generated dump sql file and filename
#- generar dump sql en remoto, dump con nombre aleatorio
#- descargar dicho fichero dump sql a local
#- borrar dump sql remoto
#- renombrar dump sql a wp-config.php {database}.sql
#- importar dump sql
echo "Importing database file"
wp db import

#- search-and-replace (dominio remoto con local, remote full app path with local /app, ...)
#- Primero cambiar absolute path,
wp search-replace '/home/silverbo/korometa.com' '/app' --skip-columns=guid
#- ...luego lo demás
wp search-replace '//www.korometa.com' '//korometa.lndo.site' --skip-columns=guid
wp search-replace 'www.korometa.com' 'korometa.lndo.site' --skip-columns=guid
wp search-replace '//korometa.com' '//korometa.lndo.site' --skip-columns=guid
wp search-replace 'korometa.com' 'korometa.lndo.site' --skip-columns=guid --skip-tables=wp_users

#- update algunos ajustes especiales (activar-desactivar plugins/plantillas, clear cache if any, regenerate Elementor assets, ...)
#-