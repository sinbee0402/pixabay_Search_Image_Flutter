import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:search_image3/data/dto/pixabay_result_dto.dart';

class PixabayApi {
  static const apiKey = '37726328-4a2b1a654b17d6bad1ec74dba';
  static const pixabayUrl = 'https://pixabay.com/api/?key=$apiKey';

  Future<PixabayResultDto> getPixabays(String query) async {
    final response =
        await http.get(Uri.parse('$pixabayUrl&q=$query&image_type=all'));

    Map<String, dynamic> jsonString = jsonDecode(response.body);

    return PixabayResultDto.fromJson(jsonString);
  }
}
