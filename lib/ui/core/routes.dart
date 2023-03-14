import 'package:custodia_provider/models/patient_model.dart';
import 'package:custodia_provider/ui/views/chats/chat.dart';
import 'package:custodia_provider/ui/views/chats/chat_list.dart';
import 'package:custodia_provider/ui/views/patients/patients_list/patients_list.dart';
import 'package:custodia_provider/ui/views/patients/progress/blood_glucose/progress_blood_glucose.dart';
import 'package:custodia_provider/ui/views/patients/progress/blood_glucose/readings_blood_glucose.dart';
import 'package:custodia_provider/ui/views/patients/progress/blood_pressure/progress_blood_pressure.dart';
import 'package:custodia_provider/ui/views/patients/progress/blood_pressure/readings_blood_pressure.dart';
import 'package:custodia_provider/ui/views/patients/progress/weight/progress_weight.dart';
import 'package:custodia_provider/ui/views/patients/progress/weight/readings_weight.dart';
import 'package:custodia_provider/ui/views/profile/personal_details.dart';
import 'package:custodia_provider/ui/views/profile/profile.dart';
import 'package:custodia_provider/ui/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:custodia_provider/ui/views/home/alert_details.dart';
import 'package:custodia_provider/ui/views/patients/progress/food/food_entries.dart';
import 'package:custodia_provider/ui/views/patients/patient_details/patient_details.dart';
import 'package:custodia_provider/ui/views/auth/login/login.dart';
import 'package:custodia_provider/ui/views/startup/startup.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const Startup(),
        );

      case '/login':
        return MaterialPageRoute(
          builder: (context) => const LogIn(),
        );

      case '/bottom-navigation':
        return MaterialPageRoute(
          builder: (context) => const BottomNavigation(),
        );

      case '/profile':
        return MaterialPageRoute(
          builder: (context) => const Profile(),
        );

      case '/personal-details':
        return MaterialPageRoute(
          builder: (context) => const PersonalDetails(),
        );

      case '/patients-list':
        return MaterialPageRoute(
          builder: (context) => const PatientsList(),
        );

      case '/chat':
        return MaterialPageRoute(
          builder: (context) => const Chat(),
        );

      case '/chats-list':
        return MaterialPageRoute(
          builder: (context) => const ChatsList(),
        );

      case '/patient-details':
        return MaterialPageRoute(
          builder: (context) => PatientDetails(patient: args as PatientModel),
        );

      case '/food-entries':
        return MaterialPageRoute(
          builder: (context) => FoodEntries(patientID: args.toString()),
        );

      case '/blood-glucose-progress':
        return MaterialPageRoute(
          builder: (context) => const ProgressBloodGlucose(),
        );

      case '/blood-pressure-progress':
        return MaterialPageRoute(
          builder: (context) => const ProgressBloodPressure(),
        );

      case '/weight-progress':
        return MaterialPageRoute(
          builder: (context) => const ProgressWeight(),
        );

      case '/readings-blood-glucose':
        return MaterialPageRoute(
          builder: (context) =>
              ReadingsBloodGlucose(patientID: args.toString()),
        );

      case '/readings-blood-pressure':
        return MaterialPageRoute(
          builder: (context) =>
              ReadingsBloodPressure(patientID: args.toString()),
        );

      case '/readings-weight':
        return MaterialPageRoute(
          builder: (context) => ReadingsWeight(patientID: args.toString()),
        );

      case '/alert-details':
        return MaterialPageRoute(
          builder: (context) => AlertDetails(alertID: args.toString()),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const LogIn(),
        );
    }
  }
}
