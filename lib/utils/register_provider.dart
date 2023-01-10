import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:custodia_provider/view_models/community_vm.dart';
import 'package:custodia_provider/view_models/edit_profile_vm.dart';
import 'package:custodia_provider/view_models/patient_list_vm.dart';
import 'package:custodia_provider/view_models/user_auth_vm.dart';

final signInProvider = ChangeNotifierProvider((ref) => SignInVM());
final resetPasswordProvider =
    ChangeNotifierProvider((ref) => ResetPasswordVM());
final patientListProvider = ChangeNotifierProvider((ref) => PatientListVM());
final communityProvider = ChangeNotifierProvider((ref) => CommunityVM());
final editProfileProvider = ChangeNotifierProvider((ref) => EditProfileVM());
