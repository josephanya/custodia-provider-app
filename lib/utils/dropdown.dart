import 'package:flutter/material.dart';

List<DropdownMenuItem<String>> get diagnosisDropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
      value: 'Prediabetes',
      child: Text('Prediabetes'),
    ),
    const DropdownMenuItem(
      value: 'Prediabetes + Hypertension',
      child: Text('Prediabetes + Hypertension'),
    ),
    const DropdownMenuItem(
      value: 'Type 2 diabetes',
      child: Text('Type 2 diabetes'),
    ),
    const DropdownMenuItem(
      value: 'Type 2 diabetes + Hypertension',
      child: Text(
        'Type 2 diabetes + Hypertension',
      ),
    ),
    const DropdownMenuItem(
      value: 'Hypertension',
      child: Text('Hypertension'),
    ),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get insurerDropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
      value: 'AVON HMO',
      child: Text('AVON HMO'),
    ),
    const DropdownMenuItem(
      value: 'Reliance HMO',
      child: Text('Reliance HMO'),
    ),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get genderDropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
      value: 'Female',
      child: Text('Female'),
    ),
    const DropdownMenuItem(
      value: 'Male',
      child: Text('Male'),
    ),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get stateDropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(
      value: 'Lagos',
      child: Text('Lagos'),
    ),
    const DropdownMenuItem(
      value: 'Abuja',
      child: Text('Abuja'),
    ),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dayDropdownItems {
  List<DropdownMenuItem<String>> menuItems =
      List<DropdownMenuItem<String>>.generate(
    31,
    (index) => DropdownMenuItem(
      value: (index + 1).toString(),
      child: Text((index + 1).toString()),
    ),
  );

  return menuItems;
}

List<DropdownMenuItem<String>> get monthDropdownItems {
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  List<DropdownMenuItem<String>> menuItems = months
      .map(
        (month) => DropdownMenuItem(
          value: month,
          child: Text(month),
        ),
      )
      .toList();
  return menuItems;
}

List<DropdownMenuItem<String>> get yearDropdownItems {
  final startingYear = DateTime.now().year - 20;
  List<DropdownMenuItem<String>> menuItems =
      List<DropdownMenuItem<String>>.generate(
    80,
    (index) => DropdownMenuItem(
      value: (startingYear - index + 1).toString(),
      child: Text((startingYear - index).toString()),
    ),
  );
  return menuItems;
}
