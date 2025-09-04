import 'package:dio/dio.dart';

import 'cat_model.dart';

final Dio dio = Dio();

Future<CatFact> getCatFact() async {
  final response = await dio.get('https://catfact.ninja/fact');
  final data = response.data as Map<String, dynamic>;

  return CatFact.fromJson(data);
}
