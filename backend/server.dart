import 'package:shelf/shelf.dart'; // ✅ Correct import
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';
import 'login.backend.dart';  // ✅ Ensure this is the correct path

Middleware enableCors() {
  return (Handler handler) {
    return (Request request) async {
      if (request.method == 'OPTIONS') {
        return Response.ok('', headers: _corsHeaders);
      }
      final response = await handler(request);
      return response.change(headers: _corsHeaders);
    };
  };
}

final Map<String, String> _corsHeaders = {
  'Access-Control-Allow-Origin': '*', // Allow all origins (for testing)
  'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
  'Access-Control-Allow-Headers': 'Origin, Content-Type, Accept',
};

void main() async {
  final router = Router();

  // ✅ Login API Route
  router.post('/login', (Request request) async {
    final payload = await request.readAsString();
    final response = processLogin(payload);  // ✅ Calls function from login.backend.dart
    return Response.ok(response, headers: _corsHeaders);
  });

  final handler = Pipeline()
      .addMiddleware(logRequests()) // ✅ Now logRequests() is available
      .addMiddleware(enableCors())
      .addHandler(router);

  final server = await shelf_io.serve(handler, 'localhost', 5432);
  print('✅ Server running on http://localhost:5432');
}
