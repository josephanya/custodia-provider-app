import 'package:custodia_provider/theme/theme.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:custodia_provider/views/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:custodia_provider/views/widgets/buttons.dart';

class AlertDetails extends StatelessWidget {
  const AlertDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithAction(
        context,
        '',
        const Text('k'),
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
              const Text(
                'Blood glucose log',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const YMargin(7),
              const Text(
                'Triggered at 09/12/2021, 2:34 am',
                style: TextStyle(
                  fontSize: 13,
                  color: grey,
                ),
              ),
              const YMargin(35),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 90,
                    child: const Text(
                      'Patient name:',
                      style: TextStyle(
                        color: grey,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const XMargin(20),
                  const Text(
                    'Joseph Anya',
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
                      'Patient ID:',
                      style: TextStyle(
                        color: grey,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const XMargin(20),
                  const Text(
                    '1239303',
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
                      'Log value:',
                      style: TextStyle(
                        color: grey,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const XMargin(20),
                  const Text(
                    '126 mg/dL',
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
                buttonText: 'Message patient',
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
