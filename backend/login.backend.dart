import 'dart:convert';

String processLogin(String requestBody) {
  final Map<String, dynamic> data = jsonDecode(requestBody);

  if (data.containsKey('username') && data['username'].isNotEmpty) {
    return jsonEncode({'message': 'Login successful'});
  } else {
    return jsonEncode({'error': 'Username is required'});
  }
}
