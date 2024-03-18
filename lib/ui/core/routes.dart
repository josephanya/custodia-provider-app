import 'dart:io';

import 'package:custodia_provider/models/alert_model.dart';
import 'package:custodia_provider/models/patient_model.dart';
import 'package:custodia_provider/ui/views/404/not_found.dart';
import 'package:custodia_provider/ui/views/bottom_navigation/bottom_navigation.dart';
import 'package:custodia_provider/ui/views/chats/chat.dart';
import 'package:custodia_provider/ui/views/chats/conversations/conversation_list.dart';
import 'package:custodia_provider/ui/views/patients/patient_profile/medical_records/medical_records.dart';
import 'package:custodia_provider/ui/views/patients/patient_profile/patient_profile.dart';
import 'package:custodia_provider/ui/views/patients/patients_list/patients_list.dart';
import 'package:custodia_provider/ui/views/patients/progress/blood_glucose/blood_glucose_chart.dart';
import 'package:custodia_provider/ui/views/patients/progress/blood_glucose/blood_glucose_logs.dart';
import 'package:custodia_provider/ui/views/patients/progress/blood_pressure/blood_pressure_chart.dart';
import 'package:custodia_provider/ui/views/patients/progress/blood_pressure/blood_pressure_logs.dart';
import 'package:custodia_provider/ui/views/patients/progress/weight/weight_chart.dart';
import 'package:custodia_provider/ui/views/patients/progress/weight/weight_logs.dart';
import 'package:custodia_provider/ui/views/profile/personal_details.dart';
import 'package:custodia_provider/ui/views/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custodia_provider/ui/views/home/alert_details/alert_details.dart';
import 'package:custodia_provider/ui/views/patients/progress/food/food_logs.dart';
import 'package:custodia_provider/ui/views/patients/patient_details/patient_details.dart';
import 'package:custodia_provider/ui/views/auth/login/login.dart';
import 'package:custodia_provider/ui/views/startup/startup.dart';

class Routes {
  static const startupView = '/';
  static const loginView = '/login';
  static const bottomNavigationView = '/bottom-navigation';
  static const profileView = '/profile';
  static const personalDetailsView = '/personal-details';
  static const patientsListView = '/patients-list';
  static const chatView = '/chat';
  static const chatsListView = '/chats-list';
  static const patientProfileView = '/patient-profile';
  static const patientDetailsView = '/patient-details';
  static const medicalRecordsView = '/medical-records';
  static const foodLogsView = '/food-logs';
  static const bloodGlucoseLogsView = '/blood-glucose-logs';
  static const bloodPressureLogsView = '/blood-pressure-logs';
  static const weightLogsView = '/weight-logs';
  static const bloodGlucoseChartView = '/blood-glucose-chart';
  static const bloodPressureChartView = '/blood-pressure-chart';
  static const weightChartView = '/weight-chart';
  static const alertDetailsView = '/alert-details';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    if (!Platform.isIOS) {
      switch (settings.name) {
        case startupView:
          return MaterialPageRoute(
            builder: (context) => const Startup(),
          );

        case loginView:
          return MaterialPageRoute(
            builder: (context) => const LogIn(),
          );

        case bottomNavigationView:
          return MaterialPageRoute(
            builder: (context) => const BottomNavigation(),
          );

        case profileView:
          return MaterialPageRoute(
            builder: (context) => const Profile(),
          );

        case personalDetailsView:
          return MaterialPageRoute(
            builder: (context) => const PersonalDetails(),
          );

        case patientsListView:
          return MaterialPageRoute(
            builder: (context) => const PatientsList(),
          );

        case chatView:
          return MaterialPageRoute(
            builder: (context) => Chat(patientID: args.toString()),
          );

        case chatsListView:
          return MaterialPageRoute(
            builder: (context) => const ConversationList(),
          );

        case patientProfileView:
          return MaterialPageRoute(
            builder: (context) => PatientProfile(patientID: args.toString()),
          );

        case patientDetailsView:
          return MaterialPageRoute(
            builder: (context) => PatientDetails(patient: args as PatientModel),
          );

        case medicalRecordsView:
          return MaterialPageRoute(
            builder: (context) => const MedicalRecords(),
          );

        case foodLogsView:
          return MaterialPageRoute(
            builder: (context) => FoodLogs(patientID: args.toString()),
          );

        case bloodGlucoseLogsView:
          return MaterialPageRoute(
            builder: (context) => BloodGlucoseLogs(patientID: args.toString()),
          );

        case bloodPressureLogsView:
          return MaterialPageRoute(
            builder: (context) => BloodPressureLogs(patientID: args.toString()),
          );

        case weightLogsView:
          return MaterialPageRoute(
            builder: (context) => WeightLogs(patientID: args.toString()),
          );

        case bloodGlucoseChartView:
          return MaterialPageRoute(
            builder: (context) => const BloodGlucoseChart(),
          );

        case bloodPressureChartView:
          return MaterialPageRoute(
            builder: (context) => const BloodPressureChart(),
          );

        case weightChartView:
          return MaterialPageRoute(
            builder: (context) => const WeightChart(),
          );

        case alertDetailsView:
          return MaterialPageRoute(
            builder: (context) => AlertDetails(alert: args as AlertModel),
          );

        default:
          return MaterialPageRoute(
            builder: (context) => const NotFound(),
          );
      }
    } else {
      switch (settings.name) {
        case startupView:
          return CupertinoPageRoute(
            builder: (context) => const Startup(),
          );

        case loginView:
          return CupertinoPageRoute(
            builder: (context) => const LogIn(),
          );

        case bottomNavigationView:
          return CupertinoPageRoute(
            builder: (context) => const BottomNavigation(),
          );

        case profileView:
          return CupertinoPageRoute(
            builder: (context) => const Profile(),
          );

        case personalDetailsView:
          return CupertinoPageRoute(
            builder: (context) => const PersonalDetails(),
          );

        case patientsListView:
          return CupertinoPageRoute(
            builder: (context) => const PatientsList(),
          );

        case chatView:
          return CupertinoPageRoute(
            builder: (context) => Chat(patientID: args.toString()),
          );

        case chatsListView:
          return CupertinoPageRoute(
            builder: (context) => const ConversationList(),
          );

        case patientProfileView:
          return CupertinoPageRoute(
            builder: (context) => PatientProfile(patientID: args.toString()),
          );

        case patientDetailsView:
          return CupertinoPageRoute(
            builder: (context) => PatientDetails(patient: args as PatientModel),
          );

        case medicalRecordsView:
          return CupertinoPageRoute(
            builder: (context) => const MedicalRecords(),
          );

        case foodLogsView:
          return CupertinoPageRoute(
            builder: (context) => FoodLogs(patientID: args.toString()),
          );

        case bloodGlucoseLogsView:
          return CupertinoPageRoute(
            builder: (context) => BloodGlucoseLogs(patientID: args.toString()),
          );

        case bloodPressureLogsView:
          return CupertinoPageRoute(
            builder: (context) => BloodPressureLogs(patientID: args.toString()),
          );

        case weightLogsView:
          return CupertinoPageRoute(
            builder: (context) => WeightLogs(patientID: args.toString()),
          );

        case bloodGlucoseChartView:
          return CupertinoPageRoute(
            builder: (context) => const BloodGlucoseChart(),
          );

        case bloodPressureChartView:
          return CupertinoPageRoute(
            builder: (context) => const BloodPressureChart(),
          );

        case weightChartView:
          return CupertinoPageRoute(
            builder: (context) => const WeightChart(),
          );

        case alertDetailsView:
          return CupertinoPageRoute(
            builder: (context) => AlertDetails(alert: args as AlertModel),
          );

        default:
          return CupertinoPageRoute(
            builder: (context) => const NotFound(),
          );
      }
    }
  }
}
