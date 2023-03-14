import 'package:cached_network_image/cached_network_image.dart';
import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/views/chats/full_photo.dart';
import 'package:custodia_provider/ui/widgets/loader.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'default_card.dart';

class FoodLogCard extends StatelessWidget {
  const FoodLogCard({
    Key? key,
    required this.food,
    required this.mealType,
    required this.imageURL,
    required this.date,
  }) : super(key: key);

  final String food, mealType, imageURL;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              food,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                height: 1.35,
              ),
            ),
            imageURL == ''
                ? Container()
                : Column(
                    children: [
                      const YMargin(13),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullPhoto(
                              path: imageURL,
                            ),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          child: CachedNetworkImage(
                            placeholder: (context, url) => Container(
                              width: 70,
                              height: 70,
                              decoration: const BoxDecoration(
                                color: lightBlue,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: const Center(
                                child: Loader(),
                              ),
                            ),
                            errorWidget: (context, url, error) => Image.asset(
                              'images/img_not_available.jpeg',
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                            imageUrl: imageURL,
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
            const YMargin(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('MMM dd, hh:mm aaa').format(date),
                  style: const TextStyle(
                    fontSize: 12,
                    color: grey,
                  ),
                ),
                Text(
                  mealType,
                  style: const TextStyle(
                    fontSize: 12,
                    color: grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
