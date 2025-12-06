FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
# Cấu hình mirror để cài thư viện nhanh
RUN npm config set registry https://registry.npmmirror.com/ && npm install
COPY . .
CMD ["npm", "start"]