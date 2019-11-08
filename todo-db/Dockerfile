FROM mysql:5.7

ADD my.cnf etc/mysql/conf.d/my.cnf
RUN chmod 644 /etc/mysql/conf.d/my.cnf

EXPOSE 3306


# $ docker build -t todo-db-mysql .

# initの内容とか変えて反映したければ、
# ../todo-db$ rm -r /volumes
# でvolumeを消す