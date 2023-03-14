import 'package:cached_network_image/cached_network_image.dart';
import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:custodia_provider/utils/margin.dart';

class MealPlanCard extends StatelessWidget {
  const MealPlanCard({
    Key? key,
    required this.name,
    required this.mealType,
  }) : super(key: key);

  final String name, mealType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: CachedNetworkImage(
                imageUrl:
                    'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80',
                height: 120,
                width: 165,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.more_horiz,
                    size: 20,
                    color: white,
                  ),
                ),
                onTap: () => CustomBottomSheet(
                  context: context,
                  body: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 25,
                            height: 25,
                            decoration: const BoxDecoration(
                              color: black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                          const XMargin(15),
                          const Text(
                            'Swap meal',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const YMargin(30),
                      Row(
                        children: [
                          Container(
                            width: 25,
                            height: 25,
                            decoration: const BoxDecoration(
                              color: black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                          const XMargin(15),
                          const Text(
                            'Remove from plan',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const YMargin(30),
                      Row(
                        children: [
                          Container(
                            width: 25,
                            height: 25,
                            decoration: const BoxDecoration(
                              color: black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                          const XMargin(15),
                          const Text(
                            'Add to shopping list',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ).modalBottomSheet(),
              ),
            )
          ],
        ),
        const YMargin(11),
        Text(
          name,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.3,
          ),
        ),
        const YMargin(6),
        Text(
          mealType,
          style: const TextStyle(
            fontSize: 12,
            color: grey,
          ),
        ),
      ],
    );
  }
}
