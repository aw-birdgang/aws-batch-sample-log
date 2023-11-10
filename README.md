# 도커 이미지 빌드
docker build . -t batch-sample-ecr

# 빌드된 이미지 확인
docker images --filter reference=batch-sample-ecr

# ECR 로그인
aws ecr get-login-password --region <REGION> | docker login --username AWS --password-stdin <AWS_ACCOUNT_ID>.dkr.ecr.ap-northeast-2.amazonaws.com

# 리포지토리 생성
aws ecr create-repository \
--repository-name batch-sample-repository \
--image-scanning-configuration scanOnPush=true \
--region <REGION>

# 푸시할 도커 이미지에 태그 지정
docker tag batch-sample-ecr:latest <AWS_ACCOUNT_ID>.dkr.ecr.<REGION>.amazonaws.com/batch-sample-repository

# 도커 이미지 푸시
docker push <AWS_ACCOUNT_ID>.dkr.ecr.<REGION>.amazonaws.com/batch-sample-repository:latest



## ref
```bash
https://docs.aws.amazon.com/batch/latest/userguide/what-is-batch.html
```


