FROM nginx
COPY registration.html /usr/share/nginx/html/index.html
EXPOSE 3000
CMD ["nginx", "-g", "daemon off;"]