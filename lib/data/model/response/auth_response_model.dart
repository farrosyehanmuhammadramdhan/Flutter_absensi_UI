// ignore_for_file: unused_import, depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'dart:convert';

class AuthResponseModel {
    final String accessToken;
    final User user;

    AuthResponseModel({
        required this.accessToken,
        required this.user,
    });

    factory AuthResponseModel.fromJson(String str) => AuthResponseModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AuthResponseModel.fromMap(Map<String, dynamic> json) => AuthResponseModel(
        accessToken: json["access_token"],
        user: User.fromMap(json["user"]),
    );

    Map<String, dynamic> toMap() => {
        "access_token": accessToken,
        "user": user.toMap(),
    };
}

class User {
    final int id;
    final String name;
    final String position;
    final String department;
    final String faceEmbedded;
    final dynamic imageUrl;
    final String email;
    final DateTime createdAt;
    final DateTime updatedAt;

    User({
        required this.id,
        required this.name,
        required this.position,
        required this.department,
        required this.faceEmbedded,
        required this.imageUrl,
        required this.email,
        required this.createdAt,
        required this.updatedAt,
    });

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        position: json["position"],
        department: json["department"],
        faceEmbedded: json["face_embedded"],
        imageUrl: json["image_url"],
        email: json["email"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "position": position,
        "department": department,
        "face_embedded": faceEmbedded,
        "image_url": imageUrl,
        "email": email,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
