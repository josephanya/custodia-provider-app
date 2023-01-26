import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:custodia_provider/ui/views/chats/full_photo.dart';

class MessageBubble extends StatelessWidget {
  final String sender, content;
  final bool isMe;
  final DateTime time;
  final int type;

  const MessageBubble({
    super.key,
    required this.sender,
    required this.content,
    required this.isMe,
    required this.time,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7.5, horizontal: 10),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            constraints: const BoxConstraints(maxWidth: 250),
            decoration: BoxDecoration(
              color: isMe ? blue : offWhite,
              borderRadius: isMe
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(0),
                    )
                  : const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(15),
                    ),
            ),
            child: (type == 1)
                ? GestureDetector(
                    child: Material(
                      borderRadius: isMe
                          ? const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(0),
                            )
                          : const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(15),
                            ),
                      clipBehavior: Clip.hardEdge,
                      child: CachedNetworkImage(
                        placeholder: (context, url) => Container(
                          width: 150,
                          height: 230,
                          color: lightBlue,
                          child: Center(
                            child: Platform.isAndroid
                                ? const CircularProgressIndicator(
                                    color: blue,
                                  )
                                : const CupertinoActivityIndicator(),
                          ),
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          'images/img_not_available.jpeg',
                          width: 150,
                          height: 230,
                          fit: BoxFit.cover,
                        ),
                        imageUrl: content,
                        width: 150,
                        height: 230,
                        fit: BoxFit.cover,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FullPhoto(
                            path: content,
                          ),
                        ),
                      );
                    },
                  )
                : GestureDetector(
                    onLongPress: () {
                      Clipboard.setData(ClipboardData(text: content)).then((_) {
                        toast('Text copied to clipboard');
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 11,
                      ),
                      child: Text(
                        content,
                        style: TextStyle(
                          color: isMe ? Colors.white : Colors.black87,
                          fontSize: 13,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
