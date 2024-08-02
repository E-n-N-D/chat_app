import 'dart:convert';
import 'dart:io';

import 'package:chat_app/models/image_model.dart';
import 'package:http/http.dart' as http;

class ImageRepository {
  Future<List<ImageModel>> getNetworkImage() async {
    try {
      var endpointUrl = Uri.parse('https://picsum.photos/v2/list');
      final response = await http.get(endpointUrl);

      if (response.statusCode == 200) {
        final List<dynamic> decodedImages = jsonDecode(response.body) as List;

        final List<ImageModel> imageList = decodedImages.map((listItem) {
          return ImageModel.fromJson(listItem);
        }).toList();
        return imageList;
      } else {
        throw Exception('API not successful!');
      }
    } on SocketException {
      // when Internet goes off
      throw Exception('No internet connection :(');
    } on HttpException {
      throw Exception("Couldn\'t retrieve the images");
    } on FormatException {
      throw Exception('Bat response format!!');
    } catch (e) {
      throw Exception('Unknown error');
    }
  }
}
