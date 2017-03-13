FROM alpine:3.5
MAINTAINER 	Badreddine Fodha <badjina1408@hotmail.com>

EXPOSE 8080
ENV DB db
CMD ["/bin/ash", "echo hello world"]
HEALTHCHECK --interval=10s CMD wget -qO- localhost:8080

COPY laravel-demo.tar /usr/local/bin/laravel-demo
RUN chmod +x /usr/local/bin/laravel-demo


# docker run -dit -p 8080:8080 --name health_testt health_test /bin/ash

