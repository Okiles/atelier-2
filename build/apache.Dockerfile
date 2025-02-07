# Utilisation de l'image officielle Apache sur Ubuntu
FROM ubuntu:latest

# Installation d'Apache
RUN apt update && apt install -y apache2 && rm -rf /var/lib/apt/lists/*

# Activation du module rewrite pour gérer les routes Vue.js
RUN a2enmod rewrite

# Définition du dossier où Apache servira les fichiers
WORKDIR /var/www/html

# Ajout d'un fichier .htaccess pour rediriger les routes vers index.html
RUN echo '<IfModule mod_rewrite.c>\n\
    RewriteEngine On\n\
    RewriteBase /\n\
    RewriteCond %{REQUEST_FILENAME} !-f\n\
    RewriteCond %{REQUEST_FILENAME} !-d\n\
    RewriteRule . /index.html [L]\n\
</IfModule>' > /var/www/html/.htaccess

# Configuration d'Apache pour autoriser les fichiers .htaccess
RUN sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

# Exposition du port 80
EXPOSE 80

# Commande pour démarrer Apache en mode foreground
CMD ["apachectl", "-D", "FOREGROUND"]
