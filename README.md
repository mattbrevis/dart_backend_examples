<h1>Create a Web Server with Dart and Shelf</h1>

A server app built using [Shelf](https://pub.dev/packages/shelf),
configured to enable running with [Docker](https://www.docker.com/).

I've created an archive '.env' in the root path to keep all the sensitive information in JSON format.
There you can edit all configuration about database and webserver.

I've created three examples, they're in the path 'api', each class has with differents configurations.
 - The ExampleApi class doesn't have any connection with database or security authentication.
 This class has all the methods : GET, PUT, DELETE, POST.
 - The LoginApi class has a POST method that retrieve an JWT token.
 - The UserApi class will have all the methods with database connection.(not ready)


## Running with Docker

If you have [Docker Desktop](https://www.docker.com/get-started) installed, you
can build and run with the `docker` command:

```
$ docker build . -t myserver
$ docker run -it -p 8080:8080 myserver
Server listening on port 8080
```
