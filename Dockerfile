# Build Stage
FROM node:22 as build

WORKDIR /usr/src/my-app

COPY package*.json .

RUN npm install

COPY . .

RUN npm run build

# Production Stage
FROM node:22 as production

WORKDIR /usr/src/my-app

COPY --from=build ./usr/src/my-app/build ./build
COPY --from=build ./usr/src/my-app/package.json ./package.json
COPY --from=build ./usr/src/my-app/package-lock.json ./package-lock.json

RUN npm install --only=production

CMD ["npm", "start"]
