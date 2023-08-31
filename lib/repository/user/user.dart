import 'package:custodia_provider/models/user_model.dart';

abstract class User {
  Future<UserModel> getUser();
}
