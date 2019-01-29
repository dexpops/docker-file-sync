FROM bash:4.4

COPY files/script.sh /

CMD ["bash", "/script.sh"]