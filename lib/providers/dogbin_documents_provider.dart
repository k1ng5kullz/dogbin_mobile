import 'package:dogbin_mobile/api/dogbin_api.dart';
import 'package:dogbin_mobile/models/document.dart';
import 'package:dogbin_mobile/service_locator.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@singleton
class DogbinDocuments {
  DogbinDocuments() {
    api = locator.get<DogbinApi>(param1: Dio());
  }

  DogbinApi api;

  String errorMessage = '';

  Future<List<Document>> getDocuments(String key) async {
    List<Document> documents;

    try {
      documents = await api.documents(key);
    } catch (e) {
      print(e);
    }
    return documents;
  }
}
