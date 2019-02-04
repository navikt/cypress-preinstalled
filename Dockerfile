FROM cypress/base:10
RUN mkdir /workdir
RUN chmod +rx /workdir
ENV CYPRESS_CACHE_FOLDER /workdir
WORKDIR /workdir
RUN yarn global add cypress
RUN cypress verify
CMD cypress run