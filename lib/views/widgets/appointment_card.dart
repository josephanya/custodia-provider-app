import 'package:flutter/material.dart';
import 'package:custodia_provider/theme/theme.dart';
import 'package:custodia_provider/utils/margin.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    Key? key,
    required this.title,
    required this.time,
    this.onPress,
  }) : super(key: key);

  final String title, time;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/appointment-details'),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: .5,
            color: lightGrey,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '6:20 am',
                  ),
                  YMargin(7),
                  Text(
                    '20 mins',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: grey,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Joseph Anya',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                YMargin(7),
                Text(
                  'Follow up',
                  style: TextStyle(
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
