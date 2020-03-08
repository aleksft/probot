# Setup
```
# Install dependencies
npm install

# Run the bot
npm start
```

# Using docker

## Build locally
```
docker build -t probot .
```

## Test the project
```
docker run -it --rm probot npm run test
```

## Test out running locally
This starts things up locally without connecting to a GitHub App.
```
docker run  -it --rm \
            -e NODE_ENV=dev \
            -e APP_ID=aaa \
            -e WEBHOOK_SECRET=bbb \
            -p 3000:3000 probot npm start
```
```
# docker run  -it --rm \
#             -e NODE_ENV=dev \
#             -e APP_ID=aaa \
#             -e WEBHOOK_SECRET=bbb \
#             -e PRIVATE_KEY=$(echo abcd|base64) \
#             -p 3000:3000 probot npm start
```
Try opening a browser to http://localhost:3000 to see the probot web start.

## Develop locally
Changes to your source code get reflected in the container and node restarts our app with the latest changes.
```
docker run  -it --rm \
            -e APP_ID=abc \
            -e PRIVATE_KEY=none \
            -w /home/node/probot-dev \
            -v "$(pwd)":/home/node/probot-dev \
            -p 3000:3000 probot \
            bash -c 'npm install && npm run dev'
```

## Lint Test
```
docker run -it --rm probot npm run lint
```

## Show Coverage Report
```
docker run -it --rm probot npm run coverage
```
