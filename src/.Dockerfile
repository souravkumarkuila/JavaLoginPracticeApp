FROM nginx:alpine-slim
EXPOSE 80
RUN rm -rf /usr/share/nginx/html/
COPY . /usr/share/nginx/html/