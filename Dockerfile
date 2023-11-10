# 로컬머신(ARM)에서 빌드하기 때문에 플랫폼 지정
FROM --platform=linux/amd64 node:18.15.0-alpine

WORKDIR /user/src/app

COPY . .
RUN npm install
