<h1>Backend with Dart and Shelf</h1>

A server app built using [Shelf](https://pub.dev/packages/shelf),
configured to enable running with [Docker](https://www.docker.com/).

I've created an archive '.env' in the root path to keep all the servers' sensitive information database.

In my example, I've created three examples with GET method, and one POST method that returns me a JSON response.

<img src"https://github.com/mattbrevis/dart_backend/blob/main/images/post.png?raw=true">

This project doesn't have any connection to database. I've created this repository to use as a template for some future tests. 

In my tests, I've put the port 33, you can change the port in the '.env' file.

## Running with Docker

If you have [Docker Desktop](https://www.docker.com/get-started) installed, you
can build and run with the `docker` command:

```
$ docker build . -t myserver
$ docker run -it -p 8080:8080 myserver
Server listening on port 8080
```
