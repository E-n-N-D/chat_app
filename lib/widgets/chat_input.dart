import 'package:chat_app/models/message_entity.dart';
import 'package:chat_app/widgets/picker_body.dart';
import 'package:flutter/material.dart';

class ChatInput extends StatefulWidget {
  final Function(MessageEntity) onMessageSubmit;
  ChatInput({super.key, required this.onMessageSubmit});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  String _selectedImageUrl = '';

  final chatMessageController = TextEditingController();

  void onMsgSend() {
    final newMessage = MessageEntity(
        text: chatMessageController.text,
        id: '1',
        createdAt: DateTime.now().microsecondsSinceEpoch,
        author: Author(username: 'Sushant'));

    if (_selectedImageUrl.isNotEmpty) {
      newMessage.imageUrl = _selectedImageUrl;
    }

    widget.onMessageSubmit(newMessage);
    chatMessageController.clear();
    _selectedImageUrl = '';
  }

  void onImageSelected(String selectedImage) {
    setState(() {
      _selectedImageUrl = selectedImage;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(14))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    constraints: BoxConstraints(
                        minWidth: MediaQuery.of(context).size.width),
                    context: context,
                    builder: (BuildContext context) {
                      return NetworkImagePickerBody(
                        onImageSelected: onImageSelected,
                      );
                    });
              },
              icon: const Icon(Icons.add, color: Colors.white)),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                minLines: 1,
                controller: chatMessageController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  hintText: 'Type your text',
                  hintStyle: TextStyle(color: Colors.blueGrey),
                  border: InputBorder.none,
                ),
              ),
              if (_selectedImageUrl.isNotEmpty)
                Image.network(
                  _selectedImageUrl,
                  height: 100,
                ),
            ],
          )),
          IconButton(
              onPressed: onMsgSend,
              icon: const Icon(
                Icons.send,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
