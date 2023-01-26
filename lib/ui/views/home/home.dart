import 'package:cached_network_image/cached_network_image.dart';
import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/widgets/alert_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int segmentedControlValue = 0;

  Widget segmentedControl() {
    return SizedBox(
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
    0: const SizedBox(
      height: 300,
      child: Center(
        child: Text('Review'),
      ),
    ),
    1: const SizedBox(
      height: 300,
      child: Center(
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
              const YMargin(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'images/logo.svg',
                    color: blue,
                    height: 22,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/profile'),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(46),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://pyxis.nymag.com/v1/imgs/361/d5b/c3d6afff0017b0bd01c82eb3e84eb8cd5a-michael-b-jordan.rsquare.w1200.jpg',
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const YMargin(25),
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
