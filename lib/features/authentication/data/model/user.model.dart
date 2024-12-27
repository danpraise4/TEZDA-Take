
import 'dart:convert';

UserModel userModelFromMap(String str) => UserModel.fromMap(json.decode(str));

String userModelToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
    int id;
    String username;
    String email;
    String firstName;
    String lastName;
    String gender;
    String image;
    String accessToken;
    String refreshToken;

    UserModel({
        required this.id,
        required this.username,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.gender,
        required this.image,
        required this.accessToken,
        required this.refreshToken,
    });

    UserModel copyWith({
        int? id,
        String? username,
        String? email,
        String? firstName,
        String? lastName,
        String? gender,
        String? image,
        String? accessToken,
        String? refreshToken,
    }) => 
        UserModel(
            id: id ?? this.id,
            username: username ?? this.username,
            email: email ?? this.email,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            gender: gender ?? this.gender,
            image: image ?? this.image,
            accessToken: accessToken ?? this.accessToken,
            refreshToken: refreshToken ?? this.refreshToken,
        );

    factory UserModel.fromMap(Map json) => UserModel(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        gender: json["gender"],
        image: json["image"],
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
    );

    Map toMap() => {
        "id": id,
        "username": username,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "image": image,
        "accessToken": accessToken,
        "refreshToken": refreshToken,
    };
}
