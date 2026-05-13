# Stage 1 - Build
FROM node:12-alpine AS builder
WORKDIR /home/app
COPY package*.json ./
RUN npm install
COPY . .

# Stage 2 - Staging
FROM node:12-alpine
WORKDIR /home/app
COPY --from=builder /home/app .
EXPOSE 3000
CMD ["npm", "start"]
