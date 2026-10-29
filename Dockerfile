FROM node:carbon

WORKDIR /usr/src/app

RUN git config --global url."https://github.com/".insteadOf ssh://git@github.com/
RUN mkdir -p /var/log/place

COPY package*.json yarn.lock ./
RUN yarn install --ignore-engines

COPY . .

EXPOSE 3000
CMD [ "yarn", "start" ]