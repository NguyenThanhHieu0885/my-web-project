FROM node:20

WORKDIR /app

# Nếu chưa có package.json → tự tạo React App
RUN test -f package.json || npx create-react-app .

CMD ["npm", "start"]
