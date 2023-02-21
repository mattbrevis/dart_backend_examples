import 'dart:convert';
import 'dart:io';
class CustomEnv {
  static Map<String, dynamic> _envVariables = {};

  static Future<T> get<T>({required String key})async{
    if (_envVariables.isEmpty) await _loadVariables();
    return _envVariables[key];
  }
  
  static Future<void> _loadVariables() async {    
    String paramServer = await _readFile();
    _envVariables = jsonDecode(paramServer);
  }

  static Future<String> _readFile() async {    
    return await File('.env').readAsString();
  }
}
