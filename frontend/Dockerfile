FROM node:18.12.1-buster-slim AS builder

WORKDIR /app
COPY package.json package-lock.json tsconfig.json tsconfig.node.json vite.config.ts index.html ./
COPY public/ public/
COPY src/ src/
RUN npm ci
RUN npm run build

FROM nginx:1.23.2-alpine
RUN touch /var/run/nginx.pid
RUN chown -R nginx:nginx /var/run/nginx.pid /usr/share/nginx/html /var/cache/nginx /var/log/nginx /etc/nginx/conf.d
COPY --from=builder /app/dist /usr/share/nginx/html
USER nginx
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]