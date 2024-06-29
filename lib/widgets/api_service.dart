import 'dart:convert';
import 'package:http/http.dart' as http;

class Language {
  final String name;
  final String code;

  Language({required this.name, required this.code});

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      name: json['name'],
      code: json['code'],
    );
  }
}

Future<List<Language>> fetchLanguages() async {
  final response = await http.get(Uri.parse('https://pub.dev/documentation/translator_plus/latest/'));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    List<Language> languages = data.map((json) => Language.fromJson(json)).toList();
    return languages;
  } else {
    throw Exception('Failed to load languages');
  }
}
