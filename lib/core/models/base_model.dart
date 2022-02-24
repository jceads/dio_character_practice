// To parse this JSON data, do
//
//     final baseModel = baseModelFromJson(jsonString);

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

BaseModel baseModelFromJson(String str) => BaseModel.fromJson(json.decode(str));

String baseModelToJson(BaseModel data) => json.encode(data.toJson());

@JsonSerializable()
class BaseModel {
  BaseModel({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });

  int? count;
  int? pages;
  String? next;
  String? prev;

  factory BaseModel.fromJson(Map<String, dynamic> json) => BaseModel(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
      };
}

class BaseResponseModel {
  BaseModel? baseModel;
  BaseResponseModel({this.baseModel});
  factory BaseResponseModel.fromJson(Map<String, dynamic> json) {
    return BaseResponseModel(
      baseModel: json["info"] == null
          ? null
          : BaseModel.fromJson(json["info"] as Map<String, dynamic>),
    );
  }
}
