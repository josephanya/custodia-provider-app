import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:custodia_provider/theme/theme.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:custodia_provider/views/screens/chat.dart';

class ChatsListCard extends StatelessWidget {
  const ChatsListCard({
    Key? key,
    required this.name,
    required this.lastMessage,
  }) : super(key: key);

  final String name, lastMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Chat(),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(46),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://pyxis.nymag.com/v1/imgs/361/d5b/c3d6afff0017b0bd01c82eb3e84eb8cd5a-michael-b-jordan.rsquare.w1200.jpg',
                    height: 46,
                    width: 46,
                    fit: BoxFit.cover,
                  ),
                ),
                const XMargin(13),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const YMargin(5),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Text(
                        lastMessage,
                        style: const TextStyle(
                          fontSize: 12,
                          color: grey,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                YMargin(3),
                Text(
                  '10:40 PM',
                  style: TextStyle(
                    fontSize: 12,
                    color: grey,
                  ),
                ),
                YMargin(6),
              ],
            )
          ],
        ),
      ),
    );
  }
}
