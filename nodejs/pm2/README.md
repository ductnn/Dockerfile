# PM2 + node-prune

NodeJS Docker image including the [PM2 runtime](https://pm2.keymetrics.io/) and
tool pruning folder `node_modules` with [node-prune](https://github.com/tj/node-prune).

## Tags available

**Image Name** | **Operating system** | **Dockerfile**
---|---|---
keymetrics/pm2:`16-alpine`|[Alpine](https://www.alpinelinux.org/about/)|[16-alpine](./16/alpine/Dockerfile)
keymetrics/pm2:`15-alpine`|[Alpine](https://www.alpinelinux.org/about/)|[15-alpine](./15/alpine/Dockerfile)
keymetrics/pm2:`14-alpine`|[Alpine](https://www.alpinelinux.org/about/)|[14-alpine](./14/alpine/Dockerfile)
keymetrics/pm2:`12-alpine`|[Alpine](https://www.alpinelinux.org/about/)|[12-alpine](./12/alpine/Dockerfile)
keymetrics/pm2:`10-alpine`|[Alpine](https://www.alpinelinux.org/about/)|[10-alpine](./10/alpine/Dockerfile)

## Usage
Example folder structure in nodejs project:

```bash
`-- node-name/
    |-- src/
        `-- app.js
    |-- package.json
    |-- ecosystem.json     (we will create this in the following steps)
    `-- Dockerfile         (we will create this in the following steps)
```

### Create a pm2 ecosystem file

Example `ecosystem.json`:

```json
{
    "apps": [
        {
            "name": "node-name",
            "script": "src/app.js",
            "merge_logs": true,
            "env": {
                "NODE_ENV": "test"
            }
        }
    ]
}
```

### Create Dockerfile

Example `Dockerfile`:

```dockerfile
FROM ductn4/pm2:15-alpine
LABEL author="ductnn"

RUN mkdir -p home/node
WORKDIR /home/node

COPY package*.json ecosystem.json ./

RUN npm install \
    && node-prune # pruning folder node_modules

COPY . .

EXPOSE 3000

ENTRYPOINT [ "pm2-runtime","start","ecosystem.json" ]
```

`node-prune` is a small tool to prune unnecessary files from `node_modules`,
such as markdown, typescript source files, and so on written by [tj](https://github.com/tj)

```bash
$ node-prune path/to/node_modules

files total 27,330
files removed 3,990
size removed 13 MB
   duration 200ms
```

### Build and run your image

Follow `command` to build your Nodejs application:

```bash
docker build -t your-app-name:tag -f /path/to/Dockerfile .
docker run your-app-name:tag
```

## More Documentation
The documentation of **PM2** can be found [here](https://pm2.keymetrics.io/docs/usage/docker-pm2-nodejs/)

## Reference
- [docker-pm2](https://github.com/keymetrics/docker-pm2)
- [node-prune](https://github.com/tj/node-prune)
