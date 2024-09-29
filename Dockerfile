# 1. Node.js 18 버전의 Alpine 이미지를 베이스로 설정
FROM node:18-alpine

# 2. 작업 디렉토리 설정
WORKDIR /app

# 3. package.json과 package-lock.json만 복사하여 의존성 설치
# - 이 단계를 별도로 하면 이후 코드 변경 시 캐시가 적용되어 빠르게 실행됩니다.
COPY package*.json ./

# 4. 의존성 설치
RUN npm ci --only=production

# 5. 나머지 애플리케이션 파일 복사
COPY index.js ./

# 6. 애플리케이션 시작
ENTRYPOINT [ "node", "index.js" ]
