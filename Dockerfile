# Build Stage
FROM node:22 as build

COPY package*.json .

RUN npm install

COPY . .

RUN npm run build

# Production Stage
FROM node:22 as production

COPY --from=build ./build ./build
COPY --from=build ./package.json ./package.json
COPY --from=build ./package-lock.json ./package-lock.json

RUN npm install --only=production

CMD ["npm", "start"]
