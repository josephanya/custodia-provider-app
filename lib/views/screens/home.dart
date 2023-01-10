import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custodia_provider/theme/theme.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:custodia_provider/services/greeting_service.dart';
import 'package:custodia_provider/views/widgets/alert_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int segmentedControlValue = 0;

  Widget segmentedControl() {
    return Container(
      width: double.infinity,
      child: CupertinoSlidingSegmentedControl(
        groupValue: segmentedControlValue,
        padding: const EdgeInsets.all(2),
        children: const <int, Widget>{
          0: Text(
            'Review',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          1: Text(
            'Completed',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        },
        onValueChanged: (int? value) {
          setState(
            () {
              segmentedControlValue = value!;
            },
          );
        },
      ),
    );
  }

  final Map<int, Widget> graph = <int, Widget>{
    0: Container(
      height: 300,
      child: const Center(
        child: Text('Review'),
      ),
    ),
    1: Container(
      height: 300,
      child: const Center(
        child: Text('Completed'),
      ),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const YMargin(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/profile'),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(46),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://pyxis.nymag.com/v1/imgs/361/d5b/c3d6afff0017b0bd01c82eb3e84eb8cd5a-michael-b-jordan.rsquare.w1200.jpg',
                            height: 46,
                            width: 46,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const XMargin(15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            GreetingService.greet(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: grey,
                            ),
                          ),
                          const YMargin(2),
                          const Text(
                            'Dr. Yetunde',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/notifications'),
                    child: Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.symmetric(
                          vertical: 1, horizontal: 1),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: .5,
                          color: lightGrey,
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.notifications,
                          size: 21,
                          color: blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const YMargin(30),
              segmentedControl(),
              const YMargin(25),
              const AlertCard(
                urgent: true,
              ),
              const YMargin(12),
              const AlertCard(
                urgent: false,
              ),
              const YMargin(12),
              const AlertCard(
                urgent: true,
              ),
              const YMargin(12),
              const AlertCard(
                urgent: true,
              ),
              const YMargin(12),
              const AlertCard(
                urgent: true,
              ),
              const YMargin(12),
              const AlertCard(
                urgent: true,
              ),
              const YMargin(12),
            ],
          ),
        ),
      ),
    );
  }
}
