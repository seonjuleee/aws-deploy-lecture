FROM node:22

# 컨테이너 안으로 파일 복사해야 함
COPY . .

RUN npm install
RUN npm run build

CMD ["npm", "start"]