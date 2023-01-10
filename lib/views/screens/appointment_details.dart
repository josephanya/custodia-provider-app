import 'package:custodia_provider/utils/margin.dart';
import 'package:custodia_provider/views/widgets/appbar.dart';
import 'package:custodia_provider/views/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:custodia_provider/theme/theme.dart';

class AppointmentDetails extends StatelessWidget {
  const AppointmentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        context,
        'Appointment details',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 35,
                  ),
                  TetiaryButtonFilled(
                    onPress: () {},
                    buttonText: 'Join call',
                  ),
                ],
              ),
              const YMargin(20),
              const Text(
                'Joseph Anya',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const YMargin(25),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 90,
                    child: const Text(
                      'Time:',
                      style: TextStyle(
                        color: grey,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const XMargin(20),
                  const Text(
                    '2:00 PM - 2:20 PM',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  )
                ],
              ),
              const YMargin(18),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 90,
                    child: const Text(
                      'Date:',
                      style: TextStyle(
                        color: grey,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const XMargin(20),
                  const Text(
                    'Tuesday, May 23, 2022',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  )
                ],
              ),
              const YMargin(18),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 90,
                    child: const Text(
                      'Appointment:',
                      style: TextStyle(
                        color: grey,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const XMargin(20),
                  const Text(
                    'Follow up',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        color: white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SecondaryButton(
                buttonText: 'View patient info',
                onPressed: () => Navigator.pushNamed(context, '/sign-in'),
              ),
              const YMargin(15),
              SecondaryButton(
                buttonText: 'Reschedule appointment',
                onPressed: () => Navigator.pushNamed(context, '/sign-in'),
              ),
              const YMargin(15),
            ],
          ),
        ),
      ),
    );
  }
}
