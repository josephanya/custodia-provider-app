import 'package:custodia_provider/ui/widgets/appbar.dart';
import 'package:flutter/material.dart';

class MyDetails extends StatelessWidget {
  const MyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'My details'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }
}
