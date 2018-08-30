# Epic-Sport-_Estudiante

Modulo con servicios para la creación y modificación de horarios para los estudiantes de la Escuela. Modulo de estudiantes en servidor LAMP, componente web 

- Asignación de horario de inscripción aleatorio (Nuevos y Antiguos)
- Registro de estudiantes
    - En un día y hora especifico    
    - Número maximo de inscritos
    - Lista de espera 
    - Reasignación de cupos
- Creación y modificación de horarios
    - En un día y hora especifico
    


# Configuración Servidor LAMP (Linux-Apache-Mysql-PHP)

El software requerido para instalar es el siguiente:

- Linux Mint 19/ Ubuntu 16/ Slackware
- Apache2: Servidor WEB
- Mysql / MariaDB: Motor de Base de datos
- PHP 7.0: Lenguaje de scripting del servidor
- phpmyadmin: Gestor de base de datos

# Instalación de Apache:

`sudo apt-get install apache2`

## Configuración:

Verificar puertos:

`sudo ufw app info "Apache Full"`

Si están cerrados:

`sudo ufw allow in "Apache Full"`

# Instalación de Mysql:

`sudo apt-get install mysql-server`

## Configuración:

SEGURIDAD ADICIONAL (seleccionar no)

`sudo mysql_secure_installation`

- password: 000
- eliminar usuarios anónimos: SI

Entrar a mysql así:

`sudo mysql -u root -p deportes`

Para ver tablas:

`show databases;`

# Configuración global:

Aplicar configuraciones

`sudo service apache2 restart`

verificar archivo de index

cat /var/www/html/index.html

Agregar permisos:

`sudo chown -R $USER:root /var/www`

# Instalación PHP

`sudo apt-get install php7 libapache2-mod-php php-mysql`

## Configuración

`cd /etc/php/7.0/apache2/`  
`sudo xed php.ini`

modificar las siguientes lineas:

`short_open_tag = On`  
`error_reporting=E_ALL & ~E_NOTICE`  
`display_errors=On`

Resumen de phpinfo, crear: 

`echo “<?php phpinfo(); ?>” > /var/www/html/info.php`

ver: [_http://localhost/info.php_](http://localhost/info.php)

Instalación phpmyadmin:

`sudo apt-get install phpmyadmin`

## Configuración:

`usar: apache2`  
`uso de dbconfig-ommon: SI`  
`contraseña conexión de Mysql para phpmyadmin: 000`  

Configurar apache y phpmyadmin, editar apache2.conf

`sudo xed /etc/apache2/apache2.conf`

Agregar al final:

`# Include phpmyadmin file`  
`Include /etc/phpmyadmin/apache.conf`

Aplicar cambios:

`sudo service apache2 restart`

Probar phpmyadmin:

En: __localhost/phpmyadmin__

`usuario: phpmyadmin`  
`contraseña: 000`

Agregar configuración para conexiones a BD con root:

`sudo mysql -u root -p`

`UPDATE mysql.user SET authentication_string=password('admin') WHERE user='root';`

ver modo de autenticación:

`select user, plugin from mysql.user;`

Modificar para pedir "por contraseña"

`UPDATE mysql.user SET plugin='mysql_native_password' WHERE user = 'root';`

Verificar inicio de sesión: user: root , password: admin

![phpmyadmin][img1]

Configuración del dominio: Usar proyecto.com

editar hosts

`sudo nano etc/hosts`

# Configuraciones para el optimo desempeño del servidor

Para **php**:

Agregar la linea:

`sudo xed /etc/phpmyadmin/config.inc.php`

`$cfg['ExecTimeLimit'] = 6000;`

Colocar los valores:

`sudo xed /etc/php/7.0/apache2/php.ini`

`post_max_size = 750M`

`upload_max_filesize = 750M`

`max_execution_time = 5000`

`max_input_time = 5000`

`memory_limit = 1000M`

`short_open_tag = On`

`error_reporting=E_ALL & ~E_NOTICE`
 
 para ver errores:

`display_errors=On`
 
 Para MySQL:
 
aumentar conexiones de mysql a minimo 300:

`set GLOBAL max_connections = 300;`

Aplicar cambios:

`sudo service apache2 restart`

`sudo service mysql restart`

`sudo service php7.0-fpmrestart`

## Para remoto acceso a phpMyAdmin
Como el servidor no permite acceder a phpmyadmin desde internet, fue necesario incluir phpMyAdmin manualmente, para esto se creo public_html en la raiz y se hizo la isntalación manual.

`mkdir public_html`   

`wget -c https://files.phpmyadmin.net/phpMyAdmin/4.8.3/phpMyAdmin-4.8.3-all-languages.zip`

`unzip /phpMyAdmin-4.8.3-all-languages.zip`

`mv phpMyAdmin-4.8.3-all-languages phpmyadmin`

[/deportes/phpmyadmin](http://estudiantes.is.escuelaing.edu.co/deportes/phpmyadmin)  

Configuraciones adicionales en phpmyadmin instalado manualmente, agregar cambiar las lineas:

`nano phpmyadmin/libraries/config.default.php`

`$cfg['blowfish_secret'] = 'a0sfo49nadf89fa3s8f789sf78asb7p1587balz';`

# Bibliografía

[digitalocean.com](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-16-04)

[Apache PHP MYSQL + PHPMyadmin](https://www.youtube.com/watch?v=YggXN_xJKbs)

[img1]: media/php.jpg "Ventana Login phpmyadmin"
