<h1>Create a Web Server with Dart and Shelf</h1>

A server app built using [Shelf](https://pub.dev/packages/shelf),

Packages: dart_jsonwebtoken, mysql1

I've created an archive '.env' in the root path to keep all the sensitive information in JSON format.
There you can edit all configuration about database and webserver.

<h1>Examples</h1>

I've created three examples, they're in the path 'api', each class has with differents configurations.
 - The ExampleApi class doesn't have any connection with database or security authentication.
 This class has all the methods : GET, PUT, DELETE, POST.
 - The LoginApi class has a POST method that retrieve an JWT token.
 - The UserApi class will have all the methods with database connection with MySQL. SQL codes are in 'dart_api_example.sql' in the root path.


