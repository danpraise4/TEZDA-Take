import 'dart:convert';

class AppConfigModel {
  final String baseUrl;

  AppConfigModel({required this.baseUrl});

  AppConfigModel copyWith({
    required String baseUrl,
  }) =>
      AppConfigModel(
        baseUrl: baseUrl,
      );

  factory AppConfigModel.fromJson(String str) =>
      AppConfigModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AppConfigModel.fromMap(Map<String, String> json) => AppConfigModel(
        baseUrl: json["BASE-URL"]!,
      );

  Map<String, String?> toMap() => {
        "BASE-URL": baseUrl,
      };
}
