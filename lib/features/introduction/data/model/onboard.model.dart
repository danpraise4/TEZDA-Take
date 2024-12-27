

import 'dart:convert';

OnboardModel onboardModelFromMap(String str) => OnboardModel.fromMap(json.decode(str));

String onboardModelToMap(OnboardModel data) => json.encode(data.toMap());

class OnboardModel {
    String title;
    String subTitle;
    String image;

    OnboardModel({
        required this.title,
        required this.subTitle,
        required this.image,
    });

    OnboardModel copyWith({
        String? title,
        String? subTitle,
        String? image,
    }) => 
        OnboardModel(
            title: title ?? this.title,
            subTitle: subTitle ?? this.subTitle,
            image: image ?? this.image,
        );

    factory OnboardModel.fromMap(Map<String, dynamic> json) => OnboardModel(
        title: json["title"],
        subTitle: json["subTitle"],
        image: json["image"],
    );

    Map<String, dynamic> toMap() => {
        "title": title,
        "subTitle": subTitle,
        "image": image,
    };
}
