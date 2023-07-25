FROM debian:bullseye

RUN apt-get -y update && \
		apt-get -y upgrade && \
		apt-get -y install nginx openssl

# openssl 공개키 및 개인키 생성
RUN	openssl req -newkey rsa:4096 -days 365 -nodes -x509 \
	-subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Gam/CN=localhost" \
	-keyout /etc/ssl/private/localhost.dev.key \
	-out etc/ssl/certs/localhost.dev.crt && \
	chmod 600 etc/ssl/certs/localhost.dev.crt etc/ssl/private/localhost.dev.key

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

# 포트 443을 노출
# 보통 https 요청에 사용되는 포트로, SSL/TLS 암호화된 웹 서버를 실행할 때 사용
EXPOSE 443

# nginx 웹 서버를 포그라운드로 실행
ENTRYPOINT ["nginx", "-g", "daemon off;"]