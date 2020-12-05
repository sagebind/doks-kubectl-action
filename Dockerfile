FROM digitalocean/doctl:1-latest

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
