FROM registry.fedoraproject.org/fedora:37
RUN dnf install -y httpd
COPY content/* /var/www/html/
EXPOSE 80
CMD ["httpd", "-DFOREGROUND"]
