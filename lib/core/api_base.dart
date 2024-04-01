class ApiBase {
  static const httpsScheme = 'https';
  // static const httpsScheme = 'http';

  static const apiHost = 'custodia-health-api-b53b05e2c965.herokuapp.com';
  // static const apiHost = 'localhost';

  static const apiPort = 4000;

  static const apiVersion = '/v1/provider';

  static const receiveTimeout = 10000;
  static const sendTimeout = 5000;
  static const connectTimeout = 10000;

  static const websocketUri = '$httpsScheme://$apiHost';
  // static const websocketUri = 'http://localhost:$apiPort';

  static get baseUri => Uri(
        scheme: httpsScheme,
        host: apiHost,
        // port: apiPort,
        path: '$apiVersion/',
      );

  static Uri authBase(String? endpoint) => Uri(
        scheme: httpsScheme,
        host: apiHost,
        // port: apiPort,
        path: '$apiVersion/auth${endpoint ?? ''}',
      );

  static Uri alertBase(String? endpoint) => Uri(
        scheme: httpsScheme,
        host: apiHost,
        // port: apiPort,
        path: '$apiVersion/alerts${endpoint ?? ''}',
      );

  static Uri profileBase(String? endpoint) => Uri(
        scheme: httpsScheme,
        host: apiHost,
        // port: apiPort,
        path: '$apiVersion/profile${endpoint ?? ''}',
      );

  static Uri patientBase(String? endpoint) => Uri(
        scheme: httpsScheme,
        host: apiHost,
        // port: apiPort,
        path: '$apiVersion/patients${endpoint ?? ''}',
      );

  static Uri chatBase(String? endpoint) => Uri(
        scheme: httpsScheme,
        host: apiHost,
        path: '$apiVersion/chat${endpoint ?? ''}',
      );

  static get login => authBase('/login');
  static get deviceToken => authBase('/push-token');
  static get alert => alertBase('');
  static get profile => profileBase('');
  static get patients => patientBase('');
  static get chatMessages => chatBase('/messages');
  static get conversation => chatBase('/conversation');
}
