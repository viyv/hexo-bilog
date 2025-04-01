FROM node:18-alpine

# 设置工作目录
WORKDIR /usr/src/app

# 使用国内 npm 镜像加速安装
RUN npm config set registry https://registry.npmmirror.com

# 安装 Hexo CLI
RUN npm install -g hexo-cli --unsafe-perm

# 在临时目录初始化 Hexo，避免非空目录问题
RUN hexo init /tmp/hexo \
    && cp -r /tmp/hexo/* /usr/src/app/ \
    && rm -rf /tmp/hexo

# 安装 Hexo 依赖
RUN npm install --legacy-peer-deps

# 暴露 Hexo 服务器端口
EXPOSE 4000

# 启动 Hexo 服务器
CMD ["npx", "hexo", "server", "-p", "4000"]
