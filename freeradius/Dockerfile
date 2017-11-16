FROM marcelmaatkamp/freeradius
RUN apk update && apk upgrade && \
    apk add --update freeradius-eap freeradius-ldap && \
    rm /var/cache/apk/*
