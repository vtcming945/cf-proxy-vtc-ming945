FROM node:18.12-slim

WORKDIR /app

# 安装 Cloudflare Workers CLI 工具
RUN npm install -g wrangler@2.15.0

ENV WRANGLER_SEND_METRICS=false

ENV DEPLOY_NAME_GPT35="gpt-3.5-turbo"
ENV DEPLOY_NAME_GPT4="gpt-4"
ENV DEPLOY_NAME_DALLE3="dall-e-3"
ENV DEPLOY_NAME_DALLE2="dall-e-2"


# 复制 Workers 脚本到镜像
COPY cf-openai-azure-proxy.js .

# 启动本地开发服务器
CMD wrangler dev cf-openai-azure-proxy.js --local --var RESOURCE_NAME:$RESOURCE_NAME DEPLOY_NAME_GPT35:$DEPLOY_NAME_GPT35 DEPLOY_NAME_GPT4:$DEPLOY_NAME_GPT4 DEPLOY_NAME_DALLE3:$DEPLOY_NAME_DALLE3 DEPLOY_NAME_DALLE2:$DEPLOY_NAME_DALLE2
