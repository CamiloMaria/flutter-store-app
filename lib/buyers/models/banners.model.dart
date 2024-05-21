import 'dart:convert';

BannersModel bannersFromJson(String str) =>
    BannersModel.fromJson(json.decode(str));

String bannersToJson(BannersModel data) => json.encode(data.toJson());

class BannersModel {
  String imageUrl;

  BannersModel({
    required this.imageUrl,
  });

  factory BannersModel.fromJson(Map<String, dynamic> json) => BannersModel(
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "image_url": imageUrl,
      };
}
