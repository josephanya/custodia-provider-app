import 'package:custodia_provider/views/widgets/appbar.dart';
import 'package:flutter/material.dart';

class WorkingHours extends StatelessWidget {
  const WorkingHours({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, 'Working hours'),
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
