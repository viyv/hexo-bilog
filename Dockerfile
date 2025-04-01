# 使用 Node.js 官方 Alpine 轻量版镜像
FROM node:18-alpine

# 设置工作目录
WORKDIR /usr/src/app

# 复制当前目录所有内容到容器
COPY . .

# 使用国内镜像源并安装 Hexo
RUN npm config set registry https://registry.npmmirror.com \
    && npm install -g hexo-cli --unsafe-perm \
    && npm install --legacy-peer-deps

# 暴露 Hexo 服务端口
EXPOSE 4000

# 启动 Hexo 服务器
CMD ["npx", "hexo", "server", "-p", "4000"]
