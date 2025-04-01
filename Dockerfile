FROM node:18-alpine

WORKDIR /usr/src/app

RUN npm config set registry https://registry.npmmirror.com \
    && npm install -g hexo-cli --unsafe-perm

# 在临时目录初始化 Hexo，然后复制到工作目录
RUN hexo init /tmp/hexo \
    && cp -r /tmp/hexo/* /usr/src/app/ \
    && rm -rf /tmp/hexo \
    && npm install --legacy-peer-deps

EXPOSE 4000

CMD ["npx", "hexo", "server", "-p", "4000"]
