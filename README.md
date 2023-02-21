<h1>Create a Web Server with Dart and Shelf</h1>

A server app built using [Shelf](https://pub.dev/packages/shelf),
configured to enable running with [Docker](https://www.docker.com/).

I've created an archive '.env' in the root path to keep all the servers' sensitive information database.

In my example, I've created three examples with GET method, and one POST method that returns me a JSON response.

This project doesn't have connection to database. I've created this repository to use as a template for some future tests. 

In my tests, I've put the port 33, you can change the port in the '.env' file.

## Running with Docker

If you have [Docker Desktop](https://www.docker.com/get-started) installed, you
can build and run with the `docker` command:

```
$ docker build . -t myserver
$ docker run -it -p 8080:8080 myserver
Server listening on port 8080
```

And then from a second terminal:
```
$ curl http://0.0.0.0:8080
Hello, World!
$ curl http://0.0.0.0:8080/echo/I_love_Dart
I_love_Dart
```

You should see the logging printed in the first terminal:
```
2021-05-06T15:47:04.620417  0:00:00.000158 GET     [200] /
2021-05-06T15:47:08.392928  0:00:00.001216 GET     [200] /echo/I_love_Dart
```
