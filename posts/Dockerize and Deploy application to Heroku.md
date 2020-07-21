#Dockerize and Deploy application to Heroku

#linux #docker #deployment #heroku #operating

There are various reasons you want to deploy your application as a Docker container on Heroku, one of the reasonable looking one is you want to mess with a language that doesn't officially supported by Heroku yet.

The steps of doing so is simple:

1. Dockerize your application — build it to a Docker image
2. Push that Docker image to Heroku

For the sake of simplicity, in this article, I'm showing you how to Dockerize a NodeJS application and deploy it to Heroku, ignoring the fact that NodeJS was supported by Heroku from almost its day-1.

## Dockerize your application

Let's say, you have a really complex NodeJS application, like:

```
.
├── index.js
└── package.json
```

What we need to do is create a `Dockerfile` file, to define how should we build our Docker image:

```
FROM node:10
RUN apt-get update
WORKDIR /
COPY package*.json ./
RUN npm install
COPY . .
CMD ["node", "index.js"]
```

We can now build our Docker image:

```
docker build -t <your-name>/<your-app> .
```

And to make sure it work, you can run it locally:

```
docker run --rm -it -e PORT=3000 -p 3000:3000 <your-name>/<your-app>
```

If everything run well, we're now able to proceed to the next step: Push the Docker image to heroku and deploy our application.

## Deploy to Heroku

First, even if you already logged in to Heroku Command Line tool, you also need to make sure you logged in to Heroku **Container Registry**:

```
heroku container:login
```

Create your application and push the Docker image:

```
heroku create <your-app-name>
heroku container:push web --app <your-app-name>
```

Now, it's time to drive to In-N-Out Burger to grab a double-double combo, chocolate shake would be better than coke, don't forget to tell them you don't like onion. You can finish your burger before going back to work because it might take sometimes to push your huge-ass Docker image to Heroku.

By the time you're back, you can now hit the deploy button:

```
heroku container:release web --app <your-app-name>
```

And that's it!