FROM alpine
MAINTAINER 	Badreddine Fodha <badjina1408@hotmail.com>

EXPOSE 8080
ENV DB db
CMD ["php artisan"]
HEALTHCHECK --interval=10s CMD wget -qO- localhost:8080

COPY laravel-demo.tar /usr/local/bin/laravel-demo
RUN chmod +x /usr/local/bin/laravel-demo
