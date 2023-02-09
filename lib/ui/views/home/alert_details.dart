import 'package:custodia_provider/ui/core/theme/theme.dart';
import 'package:custodia_provider/ui/widgets/appbar.dart';
import 'package:custodia_provider/ui/widgets/buttons.dart';
import 'package:custodia_provider/utils/margin.dart';
import 'package:flutter/material.dart';

class AlertDetails extends StatelessWidget {
  const AlertDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithAction(
        context,
        '',
        GestureDetector(
          onTap: () => Navigator.maybePop(context),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              decoration: const BoxDecoration(
                color: lightBlue,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(6.0),
                child: Icon(
                  Icons.check,
                  size: 16,
                  color: blue,
                ),
              ),
            ),
          ),
        ),
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
                children: const [
                  SizedBox(
                    width: 90,
                    child: Text(
                      'Patient name:',
                      style: TextStyle(
                        color: grey,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  XMargin(20),
                  Text(
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
                children: const [
                  SizedBox(
                    width: 90,
                    child: Text(
                      'Patient ID:',
                      style: TextStyle(
                        color: grey,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  XMargin(20),
                  Text(
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
                children: const [
                  SizedBox(
                    width: 90,
                    child: Text(
                      'Log value:',
                      style: TextStyle(
                        color: grey,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  XMargin(20),
                  Text(
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
