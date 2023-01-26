import 'package:custodia_provider/ui/views/chats/chat.dart';
import 'package:custodia_provider/ui/views/chats/chat_list.dart';
import 'package:custodia_provider/ui/views/patients/patients_list/patients_list.dart';
import 'package:custodia_provider/ui/views/patients/progress/blood_glucose/progress_blood_glucose.dart';
import 'package:custodia_provider/ui/views/patients/progress/blood_glucose/readings_blood_glucose.dart';
import 'package:custodia_provider/ui/views/patients/progress/blood_pressure/progress_blood_pressure.dart';
import 'package:custodia_provider/ui/views/patients/progress/blood_pressure/readings_blood_pressure.dart';
import 'package:custodia_provider/ui/views/patients/progress/weight/progress_weight.dart';
import 'package:custodia_provider/ui/views/patients/progress/weight/readings_weight.dart';
import 'package:custodia_provider/ui/views/profile/edit_profile/edit_profile.dart';
import 'package:custodia_provider/ui/views/profile/my_details/my_details.dart';
import 'package:custodia_provider/ui/views/profile/profile.dart';
import 'package:custodia_provider/ui/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:custodia_provider/ui/views/home/alert_details.dart';
import 'package:custodia_provider/ui/views/patients/progress/food/food_entries.dart';
import 'package:custodia_provider/ui/views/patients/diet/meal_planner.dart';
import 'package:custodia_provider/ui/views/patients/patient_details/patient_details.dart';
import 'package:custodia_provider/ui/views/auth/login/login.dart';
import 'package:custodia_provider/ui/views/startup/splash.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const Splash(),
        );

      case '/sign-in':
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

      case '/my-details':
        return MaterialPageRoute(
          builder: (context) => const MyDetails(),
        );

      case '/edit-profile':
        return MaterialPageRoute(
          builder: (context) => const EditProfile(),
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

      case '/patient-information':
        return MaterialPageRoute(
          builder: (context) => const PatientDetails(),
        );

      case '/meal-planner':
        return MaterialPageRoute(
          builder: (context) => const MealPlanner(),
        );

      case '/food-entries':
        return MaterialPageRoute(
          builder: (context) => const FoodEntries(),
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
          builder: (context) => const ReadingsBloodGlucose(),
        );

      case '/readings-blood-pressure':
        return MaterialPageRoute(
          builder: (context) => const ReadingsBloodPressure(),
        );

      case '/readings-weight':
        return MaterialPageRoute(
          builder: (context) => const ReadingsWeight(),
        );

      case '/alert-details':
        return MaterialPageRoute(
          builder: (context) => const AlertDetails(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const FoodEntries(),
        );
    }
  }
}
