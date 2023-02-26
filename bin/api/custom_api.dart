
import 'package:shelf/shelf.dart';

abstract class CustomApi {
  Handler getHandler({
    List<Middleware>? middlewares
  });
}