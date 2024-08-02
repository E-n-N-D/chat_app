// {
//     "id": "0",
//     "author": "Alejandro Escamilla",
//     "width": 5000,
//     "height": 3333,
//     "url": "https://unsplash.com/photos/yC-Yzbqy7PY",
//     "download_url": "https://picsum.photos/id/0/5000/3333"
//   },
import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel {
  String id;
  String author;
  int width;
  int height;
  String url;

  @JsonKey(name: 'download_url')
  String downloadUrl;

  ImageModel(
      {required this.id,
      required this.author,
      required this.width,
      required this.height,
      required this.url,
      required this.downloadUrl});

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
