import 'package:chat_app/models/image_model.dart';
import 'package:chat_app/repo/image_repository.dart';
import 'package:flutter/material.dart';

class NetworkImagePickerBody extends StatelessWidget {
  final Function onImageSelected;
  NetworkImagePickerBody({super.key, required this.onImageSelected});
  final ImageRepository _imageRepository = ImageRepository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ImageModel>>(
        future: _imageRepository.getNetworkImage(),
        builder:
            (BuildContext context, AsyncSnapshot<List<ImageModel>> snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          onImageSelected(snapshot.data![index].downloadUrl);
                        },
                        child:
                            Image.network(snapshot.data![index].downloadUrl));
                  }),
            );
          } else if (snapshot.hasError) {
            return Text('This is the error: ${snapshot.error}');
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: CircularProgressIndicator()),
          );
        });
  }
}
