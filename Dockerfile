# The source repo ships without a Dockerfile; this is a minimal build/run
# setup for local docker-compose use only.

FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM node:20-alpine
WORKDIR /app
COPY --from=build /app/dist/words ./dist/words
EXPOSE 4000
ENV PORT=4000
CMD ["node", "dist/words/server/server.mjs"]
