# Epic-Sport-_Estudiante

Modulo con servicios para la creación y modificación de horarios para los estudiantes de la Escuela. Modulo de estudiantes en servidor LAMP , componente web 

- Asignación de horario de inscripción aleatorio (Nuevos y Antiguos)
- Registro de estudiantes
    - En un día y hora especifico    
    - Número maximo de inscritos
    - Lista de espera 
    - Reasignación de cupos
- Creación y modificación de horarios
    - En un día y hora especifico
    


# Configuración Servidor LAMP (Linux-Apache-Mysql-PHP)

Este documento contiene la guía de instalación y configuración del servidor LAMP para el proyecto en PGR2. Para dar facilidad comprensión y lectura, se usará la siguiente convención de colores: **color verde** para linea de comandos bash, **color rojo** para lineas en consola de mysql y **color gris** para rutas o lineas de archivos.

El software requerido sobre Ubuntu 16 es el siguiente:

- Linux Mint 19/ Ubuntu 16/ Slackware
- Apache2: Servidor WEB
- Mysql: Motor de Base de datos
- PHP: 7.0: Lenguaje de desarrollo
- phpmyadmin: Gestor de base de datos

# Instalación de Apache:

`sudo apt-get install apache2`

## Configuración:

verificar puertos:

`sudo ufw app info &quot;Apache Full&quot;_`

si están cerrados:

`sudo ufw allow in &quot;Apache Full&quot;`

#Instalación de Mysql:

`sudo apt-get install mysql-server`

## Configuración:

*SEGURIDAD ADICIONAL (seleccionar no)*

`sudo mysql\_secure\_installation`

*password: 000*
*eliminar usuarios anónimos: SI*

**Entrar a mysql así:**

`sudo mysql -u root -p`

Para ver tablas:

`show databases;`

# Configuración global:

Aplicar configuraciones

`sudo service apache2 restart`

verificar archivo de **index**

*cat /var/www/html/index.html*

Agregar permisos:

`sudo chown -R $USER:root /var/www`

# Instalación PHP

`sudo apt-get install php7 libapache2-mod-php php-mysql`

## Configuración

`cd /etc/php/7.0/apache2/`
`sudo xed php.ini`

modificar las siguientes lineas:

`short\_open\_tag = On`
`error\_reporting=E\_ALL &amp; ~E\_NOTICE`
`display\_errors=On`

Resumen de **phpinfo**

crear: `echo &quot;\&lt;?php phpinfo(); ?\&gt;&quot; \&gt; /var/www/html/info.php`

_ver:_ [_http://localhost/info.php_](http://localhost/info.php)

Instalación phpmyadmin:

`sudo apt-get install phpmyadmin`

## Configuración:

` usar: apache2`
`uso de dbconfig-ommon: SI`
`contraseña conexión de Mysql para phpmyadmin: 000`

Configurar apache y phpmyadmin, editar **apache2.conf**

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

`UPDATE mysql.user SET authentication_string=password(&#39;admin&#39;) WHERE user=&#39;root&#39;;`

ver modo de autenticación:

`select user, plugin from mysql.user;`

Modificar a &quot;por contraseña&quot;

`UPDATE mysql.user SET plugin=&#39;mysql_native_password&#39; WHERE user = &#39;root&#39;;`

Verificar inicio de sesión: user: **root** , password: **admin**

![phpmyadmin][img1]

Configuración del dominio: Usar proyecto.com

editar hotst

`sudo nano etc/hosts`

agregar:

`127.0.0.1        proyecto.com`

# Bibliografía

[https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-16-04](https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-16-04)

[https://www.youtube.com/watch?v=YggXN\_xJKbs](https://www.youtube.com/watch?v=YggXN_xJKbs)


[img1]: media/php.jpg "Ventana Login phpmyadmin"