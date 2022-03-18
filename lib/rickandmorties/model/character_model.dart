// To parse this JSON data, do
//
//     final characterModel = characterModelFromJson(jsonString);

import 'dart:convert';

import 'package:dio_character_test/core/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'character_model.g.dart';

CharacterModel characterModelFromJson(String str) =>
    CharacterModel.fromJson(json.decode(str));

String characterModelToJson(CharacterModel data) => json.encode(data.toJson());

@JsonSerializable()
class CharacterModel {
  CharacterModel({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.origin,
    this.location,
    this.image,
    //this.episode,
    this.url,
    this.created,
  });

  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Location? origin;
  Location? location;
  String? image;
  //List<String?>? episode;
  String? url;
  DateTime? created;

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return _$CharacterModelFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$CharacterModelToJson(this);
  }
}

@JsonSerializable()
class Location {
  Location({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory Location.fromJson(Map<String, dynamic> json) {
    return _$LocationFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LocationToJson(this);
  }
}

@JsonSerializable()
class BaseResponseCharacter extends BaseResponseModel {
  List<CharacterModel>? results;
  BaseResponseCharacter({this.results});
  factory BaseResponseCharacter.fromJson(Map<String, dynamic> json) {
    return _$BaseResponseCharacterFromJson(json);
  }
}
