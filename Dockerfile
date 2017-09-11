FROM alpine:latest
MAINTAINER luca@mrevolution.eu

# Install pygments (for syntax highlighting) 
RUN apk add --update --update-cache --no-cache git ca-certificates wget py-pygments

# Download and install hugo
ENV HUGO_VERSION 0.27
ENV HUGO_BINARY hugo_${HUGO_VERSION}_linux-64bit

# Download and Install hugo
ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}.tar.gz /tmp/
RUN tar xzf /tmp/${HUGO_BINARY}.tar.gz -C /usr/local/bin/ \
	&& rm /tmp/${HUGO_BINARY}.tar.gz

# Create working directory
RUN mkdir -p /site
WORKDIR /site

# Exposed hugo port
EXPOSE 80

# Automatically build site
ADD site /site
RUN /usr/local/bin/hugo -d /site

# By default, serve site
ENV HUGO_PORT 80
RUN /usr/local/bin/hugo server -d /site --port ${HUGO_PORT} --bind=0.0.0.0
