FROM marcelmaatkamp/freeradius
RUN apk update && apk upgrade && \
    apk add --update freeradius-eap freeradius-ldap freeradius-postgresql && \
    rm /var/cache/apk/*
