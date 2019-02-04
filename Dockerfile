FROM cypress/base:10
RUN yarn add global cypress
RUN cypress install
RUN cypress verify
CMD ["cypress","run"]