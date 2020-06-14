# https://hub.docker.com/_/node/
ARG NODE_IMAGE=node:8-onbuild
FROM $NODE_IMAGE

# use debug to troubleshoot
ENV LOG_LEVEL=error
# Required env settings determined by GitHub App
ENV APP_ID=1234
ENV WEBHOOK_SECRET=development
ENV WEBHOOK_PROXY_URL=https://localhost:3000/
# ENV PRIVATE_KEY='-----BEGIN RSA PUBLIC KEY-----\nMIIBCgKCAQEAyAB22Kyin95rQu9JAxs120DzftPaCfnajU0tuALdyuCUVBgTvAia\nAfUIAi7w/LZRtwHaD5ujhLIkPBK60Ljpj7vu7hPPICs1hF1YIYxwp2uYHKihOj6y\nLj6IJ7hKeySD6fa+bBYVDetCwD1lTxaSakYr6WEWx5oaE03SrhQT+/fjC0rP+UCo\n+PBiWChVwNOZNMVKsnSC0Ln2w6hqNz9UD2Z/LxPrbZrWyeUeGk11Nl2j/2Y4aeR+\nkzn75fgcy0TFqn5B46WeOfHPIqlgZEyiKMA0T+SCCuZxJuKnuP4n6TFIGZUlZxj2\nybOAUdFkpAK4RvfJom1nRIGvmfjep5UMIwIDAQAB\n-----END RSA PUBLIC KEY-----'
ENV PRIVATE_KEY_PATH='/home/node/probot-hello/key.pem'

# see https://github.com/nodejs/docker-node/blob/e3ec2111af089e31321e76641697e154b3b6a6c3/docs/BestPractices.md#global-npm-dependencies
ENV NPM_CONFIG_PREFIX=/home/node/.npm-global
ENV PATH=$PATH:/home/node/.npm-global/bin

# Lets install our app into /home/node
COPY . /home/node/probot-hello
RUN chown -R node:node /home/node/probot-hello

# setup our app
# non-root user  https://github.com/nodejs/docker-node/blob/e3ec2111af089e31321e76641697e154b3b6a6c3/docs/BestPractices.md#non-root-user
USER node

WORKDIR /home/node/probot-hello
RUN npm install
