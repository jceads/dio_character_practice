// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) =>
    CharacterModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      status: json['status'] as String?,
      species: json['species'] as String?,
      type: json['type'] as String?,
      gender: json['gender'] as String?,
      origin: json['origin'] == null
          ? null
          : Location.fromJson(json['origin'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      image: json['image'] as String?,
      url: json['url'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
    );

Map<String, dynamic> _$CharacterModelToJson(CharacterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'origin': instance.origin,
      'location': instance.location,
      'image': instance.image,
      'url': instance.url,
      'created': instance.created?.toIso8601String(),
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      name: json['name'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };

BaseResponseCharacter _$BaseResponseCharacterFromJson(
        Map<String, dynamic> json) =>
    BaseResponseCharacter(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => CharacterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..baseModel = json['baseModel'] == null
        ? null
        : BaseModel.fromJson(json['baseModel'] as Map<String, dynamic>);

Map<String, dynamic> _$BaseResponseCharacterToJson(
        BaseResponseCharacter instance) =>
    <String, dynamic>{
      'baseModel': instance.baseModel,
      'results': instance.results,
    };
