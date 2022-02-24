import 'package:dio/dio.dart';
import 'package:dio_character_test/core/network/NetworkManager.dart';
import 'package:dio_character_test/rickandmorties/model/character_model.dart';
import 'package:dio_character_test/rickandmorties/widgets/rickandmorties.dart';
import 'package:flutter/material.dart';

class RickandmortiesViewModel extends State<RickAndMorties> {
  final Dio dio = NetworkManager.instance.dio;
  List<CharacterModel> models = [];

  Future<void> fetchAllData() async {
    final response = await dio.get(ServicePath.CHARACTER.rawValue);

    if (response.statusCode == 200) {
      final data = response.data;
      if (data is Map<String, dynamic>) {
        final baseChacterModel = BaseResponseCharacter.fromJson(data);
        models = baseChacterModel.results ?? [];
      } else if (data is List) {
        models = data.map((e) => CharacterModel.fromJson(e)).toList();
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

enum ServicePath { CHARACTER }

extension ServicePathExtension on ServicePath {
  String get rawValue {
    switch (this) {
      case ServicePath.CHARACTER:
        return "/character";
    }
  }
}
