# Base
FROM node:17-alpine

WORKDIR /app

# Dependencies
COPY package*.json ./
RUN npm install

# Build
COPY . .
RUN npm run build

# Application
RUN npm prune --production

ENV PORT=8080
EXPOSE 8080

CMD ["node", "./dist/main.js"]
