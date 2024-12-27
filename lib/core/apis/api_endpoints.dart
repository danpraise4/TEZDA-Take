import 'api_base.dart';

// Websocket Url
const socketUrl = 'localhost';
const sPort = 5000;

// Authentication Endpoints
final refreshTokenUrl = '$baseUrl/auth/refresh';

final loginUrl = '$baseUrl/auth/login';
final registerUrl = '$baseUrl/auth/login';
final userUrl = '$baseUrl/auth/me';

// Products

final productsUrl = '$baseUrl/products';