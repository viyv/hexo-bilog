# 使用官方 Node.js 镜像作为基础镜像
FROM node:18-alpine

# 设置工作目录
WORKDIR /usr/src/app

# 将 Hexo 博客项目的内容复制到容器中
COPY . .

# 安装 Hexo 和其他项目依赖
RUN npm install hexo-cli -g && npm install

# 暴露 Hexo 服务端口
EXPOSE 4000

# 启动 Hexo 本地服务器
CMD ["npx", "hexo", "server", "-p", "4000"]
