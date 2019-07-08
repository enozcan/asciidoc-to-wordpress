FROM asciidoctor/docker-asciidoctor:latest

#RUN dnf install -y asciidoc git && dnf clean packages
RUN apk update && apk upgrade && apk add --no-cache git asciidoc
RUN git clone https://github.com/mojavelinux/asciidoc-blogpost.py.git /opt/asciidoc-blogpost.py
RUN asciidoc --backend install /opt/asciidoc-blogpost.py/conf/wordpress.zip
ENV PATH=/opt/asciidoc-blogpost.py:$PATH
ENTRYPOINT ["blogpost.py", "--title", "Post Title","-a","allow-uri-read","-u", "--conf-file", "blogpost", "post"]
CMD ["example.adoc"]
