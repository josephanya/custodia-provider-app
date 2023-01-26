
// import 'package:dio/dio.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// final String? baseURL = dotenv.env['BASE_URL'];

// final authProvider = Provider<Auth>((ref) => Auth());

// class Auth {
//   final Dio _dio = Dio();

//   Future<Response> login(Map<String, dynamic> payload) async {
//     try {
//       Response response = await _dio.post(
//         '$baseURL/v1/user/auth/login',
//         data: payload,
//       );
//       return response;
//     } on DioError catch (e) {
//       if (e.response != null) {
//         throw CustomError(e.response!.data.toString());
//       } else {
//         throw CustomError('No Internet connection');
//       }
//     }
//   }

//   Future<Response> signUp(Map<String, dynamic>? payload) async {
//     try {
//       Response response = await _dio.post(
//         '$baseURL/v1/user/auth/signup',
//         data: payload,
//       );
//       return response;
//     } on DioError catch (e) {
//       if (e.response != null) {
//         throw CustomError(e.response!.data.toString());
//       } else {
//         throw CustomError('No Internet connection');
//       }
//     }
//   }

//   Future<Response> logout(String authToken) async {
//     try {
//       Response response = await _dio.post(
//         '$baseURL/v1/user/auth/logout',
//         options: Options(
//           headers: {
//             'Authorization':
//                 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImphamFAbGlmZWJveC5uZyIsInVzZXJJRCI6IjYzNDFkYzQxNmRmOWI5OGMyN2UxMmU4ZCIsImlhdCI6MTY2NTI2MDYwOX0.7fLVDCVJJPi-xaSj72_lT0mNKgipd3FH1VHtoQSLJKU'
//           },
//         ),
//       );
//       return response;
//     } on DioError catch (e) {
//       if (e.response != null) {
//         throw CustomError(e.response!.data.toString());
//       } else {
//         throw CustomError('No Internet connection');
//       }
//     }
//   }

//   Future<bool> checkMembershipValidity(String authToken) async {
//     try {
//       print(' my $authToken');
//       Response response = await _dio.get(
//         '$baseURL/v1/user/membership/check-validity',
//         options: Options(
//           headers: {
//             'Authorization':
//                 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Impvc2VwaEBsaWZlYm94Lm5nIiwidXNlcklEIjoiNjM1ZDgxZWRmZmRlNGRhZGFiMWUzZjAyIiwiaWF0IjoxNjY3MDczNzkzfQ.I96U0jSMod7jZvpVCzgrhc1fsT9iovOzl6RWb-qWjuQ'
//           },
//         ),
//       );
//       return response.data['data']['has_valid_membership'];
//     } on DioError catch (e) {
//       if (e.response != null) {
//         throw CustomError(e.response!.data.toString());
//       } else {
//         throw CustomError('No Internet connection');
//       }
//     }
//   }
// }

// final databaseProvider = Provider<Database>((ref) => Database());

// class Database {
//   final Dio _dio = Dio();

//   Future<List<BloodGlucose>> getBloodGlucose(String authToken, userID) async {
//     try {
//       Response response = await _dio.get(
//         '$baseURL/v1/patients/$userID/biomarker/blood-glucose',
//         options: Options(
//           headers: {'Authorization': 'Bearer $authToken'},
//         ),
//       );
//       final result = List<Map<String, dynamic>>.from(response.data['result']);
//       List<BloodGlucose> readings =
//           result.map((reading) => BloodGlucose.fromJSON(reading)).toList();
//       return readings;
//     } on DioError catch (e) {
//       if (e.response != null) {
//         throw CustomError(e.response!.data.toString());
//       } else {
//         throw CustomError('No Internet connection');
//       }
//     }
//   }

//   Future<List<BloodPressure>> getBloodPressure(String authToken, userID) async {
//     try {
//       Response response = await _dio.get(
//         '$baseURL/v1/patients/$userID/biomarker/blood-pressure',
//         options: Options(
//           headers: {'Authorization': 'Bearer $authToken'},
//         ),
//       );
//       final result = List<Map<String, dynamic>>.from(response.data['result']);
//       List<BloodPressure> readings =
//           result.map((reading) => BloodPressure.fromJSON(reading)).toList();
//       return readings;
//     } on DioError catch (e) {
//       if (e.response != null) {
//         throw CustomError(e.response!.data.toString());
//       } else {
//         throw CustomError('No Internet connection');
//       }
//     }
//   }

//   Future<List<Weight>> getWeight(String authToken, userID) async {
//     try {
//       Response response = await _dio.get(
//         '$baseURL/v1/patients/$userID/biomarker/weight',
//         options: Options(
//           headers: {'Authorization': 'Bearer $authToken'},
//         ),
//       );
//       final result = List<Map<String, dynamic>>.from(response.data['result']);
//       List<Weight> readings =
//           result.map((reading) => Weight.fromJSON(reading)).toList();
//       return readings;
//     } on DioError catch (e) {
//       if (e.response != null) {
//         throw CustomError(e.response!.data.toString());
//       } else {
//         throw CustomError('No Internet connection');
//       }
//     }
//   }

//   Future<List<Food>> getFood(String authToken, userID) async {
//     try {
//       Response response = await _dio.get(
//         '$baseURL/v1/patients/$userID/biomarker/food',
//         options: Options(
//           headers: {'Authorization': 'Bearer $authToken'},
//         ),
//       );
//       final result = List<Map<String, dynamic>>.from(response.data['result']);
//       List<Food> readings =
//           result.map((reading) => Food.fromJSON(reading)).toList();
//       return readings;
//     } on DioError catch (e) {
//       if (e.response != null) {
//         throw CustomError(e.response!.data.toString());
//       } else {
//         throw CustomError('No Internet connection');
//       }
//     }
//   }

//   Future<BiomarkersSummary> getBiomarkersSummary(
//       String authToken, userID) async {
//     try {
//       Response response = await _dio.get(
//         '$baseURL/v1/patients/$userID/biomarker/summary',
//         options: Options(
//           headers: {'Authorization': 'Bearer $authToken'},
//         ),
//       );
//       return BiomarkersSummary.fromJSON(response.data);
//     } on DioError catch (e) {
//       if (e.response != null) {
//         throw CustomError(e.response!.data.toString());
//       } else {
//         throw CustomError('No Internet connection');
//       }
//     }
//   }

//   logBloodGlucose(Map<String, dynamic> payload, String authToken) async {
//     try {
//       Response response = await _dio.post(
//         '$baseURL/v1/patients/biomarker/blood-glucose',
//         data: payload,
//         options: Options(
//           headers: {'Authorization': 'Bearer $authToken'},
//         ),
//       );
//       print(response);
//       return response.data;
//     } on DioError catch (e) {
//       if (e.response != null) {
//         throw CustomError(e.response!.data.toString());
//       } else {
//         throw CustomError('No Internet connection');
//       }
//     }
//   }

//   logBloodPressure(Map<String, dynamic> payload, String authToken) async {
//     try {
//       Response response = await _dio.post(
//         '$baseURL/v1/patients/biomarker/blood-pressure',
//         data: payload,
//         options: Options(
//           headers: {'Authorization': 'Bearer $authToken'},
//         ),
//       );
//       print(response);
//       return response.data;
//     } on DioError catch (e) {
//       if (e.response != null) {
//         throw CustomError(e.response!.data.toString());
//       } else {
//         throw CustomError('No Internet connection');
//       }
//     }
//   }

//   logWeight(Map<String, dynamic> payload, String authToken) async {
//     try {
//       Response response = await _dio.post(
//         '$baseURL/v1/patients/biomarker/weight',
//         data: payload,
//         options: Options(
//           headers: {'Authorization': 'Bearer $authToken'},
//         ),
//       );
//       print(response);
//       return response.data;
//     } on DioError catch (e) {
//       if (e.response != null) {
//         throw CustomError(e.response!.data.toString());
//       } else {
//         throw CustomError('No Internet connection');
//       }
//     }
//   }

//   logFood(FormData payload, String authToken) async {
//     try {
//       Response response = await _dio.post(
//         '$baseURL/v1/patients/biomarker/food',
//         data: payload,
//         options: Options(
//           headers: {'Authorization': 'Bearer $authToken'},
//         ),
//       );
//       print(response);
//       return response.data;
//     } on DioError catch (e) {
//       if (e.response != null) {
//         throw CustomError(e.response!.data.toString());
//       } else {
//         throw CustomError('No Internet connection');
//       }
//     }
//   }
// }
