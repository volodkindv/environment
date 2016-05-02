# vim:set ft=dockerfile:
FROM httpd:2.2
MAINTAINER volodkindv@yandex.ru

ENV LANG ru_RU.utf8

ENV SERVER_1C_VERSION 8.3.7-2027
ENV SERVER_1C_ARCH amd64
ENV DIST_SERVER_1C ./dist/

ADD ${DIST_SERVER_1C} /opt/

RUN if [ ! -f /opt/1c-enterprise83-common_${SERVER_1C_VERSION}_${SERVER_1C_ARCH}.deb ]; then \
    echo File 1c-enterprise83-common_${SERVER_1C_VERSION}_${SERVER_1C_ARCH}.deb does not exist.; \
    echo "DIST_SERVER_1C set incorrectly. See README.md file."; \
    exit 1; fi

RUN if [ ! -f /opt/1c-enterprise83-ws_${SERVER_1C_VERSION}_${SERVER_1C_ARCH}.deb ]; then \
    echo File 1c-enterprise83-ws_${SERVER_1C_VERSION}_${SERVER_1C_ARCH}.deb does not exist.; \
    echo "DIST_SERVER_1C set incorrectly. See README.md file."; \
    exit 1; fi

#RUN dpkg -i /opt/1c-enterprise83-common_${SERVER_1C_VERSION}_${SERVER_1C_ARCH}.deb \
#            /opt/1c-enterprise83-ws_${SERVER_1C_VERSION}_${SERVER_1C_ARCH}.deb \
#            /opt/1c-enterprise83-common-nls_${SERVER_1C_VERSION}_${SERVER_1C_ARCH}.deb \
#            /opt/1c-enterprise83-ws-nls_${SERVER_1C_VERSION}_${SERVER_1C_ARCH}.deb 

RUN dpkg -i /opt/1c-enterprise83-*.deb
			
#VOLUME /home/usr1cv8/
#VOLUME /var/log/1c

#немного трэша от старого
#а эта сложность нужна только для того, чтобы автоматом подхватить 32 или 64 битную версию
RUN echo "LoadModule _1cws_module \"$(ls /opt/1C/*/*/wsap22.so)\"" > /usr/local/apache2/conf/one_c_module.conf
#заставим апач подхватывать все conf файлы, которые мы ему скормим
#но лучше вообще взять отдельный conf файл
#ADD ./apache/httpd.conf /usr/local/apache2/conf
RUN echo "LoadModule _1cws_module \"$(ls /opt/1C/*/*/wsap22.so)\"" >> /usr/local/apache2/conf/httpd.conf
RUN echo "\nInclude conf/1c/*.conf" >> /usr/local/apache2/conf/httpd.conf
 
#----



EXPOSE 80 80

CMD ["httpd-foreground"]
