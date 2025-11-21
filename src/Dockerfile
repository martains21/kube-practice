FROM centos:7

RUN sed -i 's/mirrorlist/#mirrorlist/' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* && \
    yum update -y && \
    yum install -y epel-release && \
    yum install -y nginx gettext && \
    yum clean all

COPY config/nginx.conf /etc/nginx/nginx.conf

COPY html/index.html.template /usr/share/nginx/html/index.html.template

RUN echo "--- Checking content of index.html.template during build ---" && \
    cat /usr/share/nginx/html/index.html.template && \
    echo "--------------------------------------------------------"

COPY scripts/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["/entrypoint.sh"]