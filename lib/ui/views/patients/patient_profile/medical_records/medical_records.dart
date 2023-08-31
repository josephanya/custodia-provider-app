import 'package:custodia_provider/ui/core/theme/custom_icons.dart';
import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/widgets/appbar.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';

class MedicalRecords extends StatelessWidget {
  const MedicalRecords({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Medical records'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 15,
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: lightBlue,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(20),
                          child: Icon(
                            CustomIcon.medical_records,
                            size: 30,
                            color: blue,
                          ),
                        ),
                      ),
                      const YMargin(20),
                      const Text(
                        'Find your patient\'s medical records \n in one place',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const YMargin(15),
                      const Text(
                        'Find your patients medical records here',
                        style: TextStyle(
                          color: grey,
                          height: 1.35,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const YMargin(30),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                  decoration: BoxDecoration(
                    color: offWhite,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      width: .5,
                      color: lightGrey,
                    ),
                  ),
                  child: const Center(
                      child: Text(
                    'Coming soon..',
                    style: TextStyle(
                      color: darkGrey,
                      fontSize: 14,
                    ),
                  )),
                ),
                const YMargin(100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
