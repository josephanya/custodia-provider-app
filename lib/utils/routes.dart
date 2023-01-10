import 'package:flutter/material.dart';
import 'package:custodia_provider/views/screens/alert_details.dart';
import 'package:custodia_provider/views/screens/appointment_details.dart';
import 'package:custodia_provider/views/screens/chat.dart';
import 'package:custodia_provider/views/screens/chat_list.dart';
import 'package:custodia_provider/views/screens/edit_profile.dart';
import 'package:custodia_provider/views/screens/groups.dart';
import 'package:custodia_provider/views/screens/error.dart';
import 'package:custodia_provider/views/screens/food_entries.dart';
import 'package:custodia_provider/views/screens/meal_planner.dart';
import 'package:custodia_provider/views/screens/patient_information.dart';
import 'package:custodia_provider/views/screens/patients_list.dart';
import 'package:custodia_provider/views/screens/profile.dart';
import 'package:custodia_provider/views/screens/progress_blood_glucose.dart';
import 'package:custodia_provider/views/screens/progress_blood_pressure.dart';
import 'package:custodia_provider/views/screens/progress_weight.dart';
import 'package:custodia_provider/views/screens/readings_blood_glucose.dart';
import 'package:custodia_provider/views/screens/readings_blood_pressure.dart';
import 'package:custodia_provider/views/screens/readings_weight.dart';
import 'package:custodia_provider/views/screens/sign_in.dart';
import 'package:custodia_provider/views/screens/splash.dart';
import 'package:custodia_provider/views/screens/notifications.dart';
import 'package:custodia_provider/views/widgets/bottom_navigation.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => Splash(),
        );

      case '/sign-in':
        return MaterialPageRoute(
          builder: (context) => const SignIn(),
        );

      case '/bottom-navigation':
        return MaterialPageRoute(
          builder: (context) => BottomNavigation(),
        );

      case '/profile':
        return MaterialPageRoute(
          builder: (context) => Profile(),
        );

      case '/edit-profile':
        return MaterialPageRoute(
          builder: (context) => const EditProfile(),
        );

      case '/notifications':
        return MaterialPageRoute(
          builder: (context) => const Notifications(),
        );

      case '/groups':
        return MaterialPageRoute(
          builder: (context) => const Groups(),
        );

      case '/appointment-details':
        return MaterialPageRoute(
          builder: (context) => const AppointmentDetails(),
        );

      case '/patients-list':
        return MaterialPageRoute(
          builder: (context) => PatientsList(),
        );

      case '/chat':
        return MaterialPageRoute(
          builder: (context) => const Chat(),
        );

      case '/chats-list':
        return MaterialPageRoute(
          builder: (context) => ChatsList(),
        );

      case '/patient-information':
        return MaterialPageRoute(
          builder: (context) => const PatientInformation(),
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
          builder: (context) => const Error(),
        );
    }
  }
}
