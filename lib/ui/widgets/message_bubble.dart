import 'package:cached_network_image/cached_network_image.dart';
import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:custodia_provider/ui/views/photo/full_photo.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    Key? key,
    required this.content,
    required this.isMe,
    required this.time,
    required this.type,
  }) : super(key: key);

  final String content;
  final bool isMe;
  final DateTime time;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
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
            child: (type == 'image')
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
                          child: const Center(
                            child: Loader(),
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
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FullPhoto(
                          path: content,
                        ),
                      ),
                    ),
                  )
                : GestureDetector(
                    onLongPress: () {
                      Clipboard.setData(
                        ClipboardData(
                          text: content,
                        ),
                      ).then((_) {
                        toast('Text copied to clipboard');
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 11,
                      ),
                      child: Linkify(
                        onOpen: (link) async {
                          if (await canLaunchUrl(Uri.parse(link.url))) {
                            await launchUrl(Uri.parse(link.url));
                          } else {
                            throw 'Could not launch $link';
                          }
                        },
                        text: content,
                        style: TextStyle(
                          color: isMe ? white : Colors.black87,
                          fontSize: 13,
                          height: 1.4,
                        ),
                        linkStyle: TextStyle(
                          color: isMe ? white : Colors.black87,
                          fontSize: 13,
                          height: 1.4,
                          decoration: TextDecoration.underline,
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
