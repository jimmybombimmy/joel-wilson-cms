FROM node:20.1.0
# Installing libvips-dev for sharp Compatability
RUN apt-get update && apt-get install libvips-dev -y
ENV NODE_ENV=production
WORKDIR /opt/
COPY ./package.json ./package-lock.json ./
ENV PATH /opt/node_modules/.bin:$PATH
RUN npm install
WORKDIR /opt/app
COPY ./ .
RUN npm run build
EXPOSE 1337
CMD ["npm", "start"]