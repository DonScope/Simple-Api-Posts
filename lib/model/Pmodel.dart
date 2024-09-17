import 'dart:convert';

class PModel {
    int? userId;
    int? id;
    String? title;
    String? body;

    PModel({
        this.userId,
        this.id,
        this.title,
        this.body,
    });

    factory PModel.fromRawJson(String str) => PModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PModel.fromJson(Map<String, dynamic> json) => PModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
