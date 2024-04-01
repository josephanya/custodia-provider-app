import 'package:cached_network_image/cached_network_image.dart';
import 'package:custodia_provider/ui/core/constants/colors.dart';
import 'package:custodia_provider/ui/core/constants/component_sizes.dart';
import 'package:custodia_provider/ui/views/photo/full_photo.dart';
import 'package:custodia_provider/ui/widgets/utils/default_card.dart';
import 'package:custodia_provider/ui/widgets/utils/loader.dart';
import 'package:custodia_provider/utils/date.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 15.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              food,
              style: TextStyle(
                fontSize: FontSize.s14,
                fontWeight: FontWeight.w500,
                height: 1.35.h,
              ),
            ),
            imageURL == ''
                ? Container()
                : Column(
                    children: [
                      const YMargin(12),
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
                              width: 70.w,
                              height: 70.h,
                              decoration: BoxDecoration(
                                color: AppColors.lightBlue,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.r),
                                ),
                              ),
                              child: const Center(
                                child: Loader(),
                              ),
                            ),
                            errorWidget: (context, url, error) => Image.asset(
                              'images/img_not_available.jpeg',
                              width: 70.w,
                              height: 70.h,
                              fit: BoxFit.cover,
                            ),
                            imageUrl: imageURL,
                            width: 70.w,
                            height: 70.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const YMargin(4),
                    ],
                  ),
            const YMargin(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  CustomDate().formatDate(date),
                  style: TextStyle(
                    fontSize: FontSize.s12,
                    color: AppColors.grey,
                  ),
                ),
                Text(
                  mealType,
                  style: TextStyle(
                    fontSize: FontSize.s12,
                    color: AppColors.grey,
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
