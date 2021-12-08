FROM node:14

ENV NODE_ENV=production

WORKDIR /app
COPY . .

############
# FRONTEND #
############
WORKDIR /app/frontend
RUN npm install -g @vue/cli
RUN NODE_ENV=development npm install --no-optional && npm run build && npm prune --production --no-audit

###########
# BACKEND #
###########
WORKDIR /app/js_server
RUN npm install

EXPOSE 3333
CMD [ "npm", "start" ]

