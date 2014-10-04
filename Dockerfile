FROM dockerfile/nodejs

RUN npm install -g gulp
RUN npm install gulp
RUN npm install coffee-script
RUN npm install gulp-jade
RUN npm install gulp-coffee
RUN npm install gulp-connect
RUN npm install gulp-util

ADD gulpfile.js /data/gulpfile.js
ADD gulpfile.coffee /data/gulpfile.coffee

RUN mkdir /data/jade
RUN mkdir /data/dist

EXPOSE 8080

CMD ["gulp"]