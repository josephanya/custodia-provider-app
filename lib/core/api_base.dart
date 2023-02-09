import 'package:custodia_provider/core/environment_config.dart';

class ApiBase {
  static const httpsScheme = EnvironmentConfig.isDebug ? 'http' : 'https';

  static const apiHost =
      EnvironmentConfig.isDebug ? 'localhost' : 'custodiahealth.herokuapp.com';

  static const apiPort = EnvironmentConfig.isDebug ? 3000 : 8080;

  static const apiVersion = '/v1/provider';

  static const receiveTimeout = 5000;
  static const sendTimeout = 3000;
  static const connectTimeout = 5000;

  static get baseUri => Uri(
        scheme: httpsScheme,
        host: apiHost,
        port: apiPort,
        path: '$apiVersion/',
      );
  static Uri authBase(String? endpoint) => Uri(
        scheme: httpsScheme,
        host: apiHost,
        port: apiPort,
        path: '$apiVersion/auth${endpoint ?? ''}',
      );

  static get login => authBase('/login');
  static get logout => authBase('/logout');
}
