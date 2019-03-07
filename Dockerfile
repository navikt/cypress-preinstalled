FROM node:current-slim

RUN apt-get update && \
  apt-get install -y \
    libgtk2.0-0 \
    libnotify-dev \
    libgconf-2-4 \
    libnss3 \
    libxss1 \
    libasound2 \
    xvfb \
    && apt-get clean

# versions of local tools
RUN node -v
# NPM version should already be pretty new (> 6.4.0)
RUN npm -v

RUN mkdir /workdir
RUN chmod +rx /workdir
ENV CYPRESS_CACHE_FOLDER /workdir
WORKDIR /workdir
RUN npm install cypress --global \
    --unsafe-perm=true \
    --no-progress \
    --no-optional \
     && npm cache clean --force
RUN cypress verify
CMD cypress run
