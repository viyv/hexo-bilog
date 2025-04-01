# 使用 Node.js 官方轻量版镜像
FROM node:18-alpine

# 设置工作目录
WORKDIR /usr/src/app

# 使用国内 npm 镜像，加速安装
RUN npm config set registry https://registry.npmmirror.com

# 在容器内创建 package.json
RUN echo '{ "name": "hexo-blog", "version": "1.0.0", "description": "Hexo Blog in Docker", "main": "index.js", "scripts": { "start": "hexo server" }, "dependencies": {}, "devDependencies": {} }' > package.json

# 安装 Hexo CLI 及项目依赖
RUN npm install -g hexo-cli --unsafe-perm \
    && npm install hexo --save \
    && hexo init . \
    && npm install --legacy-peer-deps

# 暴露 Hexo 服务器端口
EXPOSE 4000

# 启动 Hexo 服务器
CMD ["npx", "hexo", "server", "-p", "4000"]
