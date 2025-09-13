class Env {
  final String vodBaseUrl = const String.fromEnvironment('VOD_BASE_URL');
  final String tvBaseUrl = const String.fromEnvironment('TV_BASE_URL');
  final String dataPlaneBaseUrl = const String.fromEnvironment('DATA_PLANE_BASE_URL');
  final String keyClockClientId = const String.fromEnvironment(
    'KEY_CLOAK_CLIENT_ID',
  );
  final String keyClockRedirectUrl = const String.fromEnvironment(
    'KEY_CLOAK_REDIRECT_URL',
  );
  final String keyClockUrl = const String.fromEnvironment('KEY_CLOAK_URL');
  final String registrationUrl = const String.fromEnvironment(
    'REGISTRATION_URL',
  );
  final String registrationCallbackUrl = const String.fromEnvironment(
    'REGISTRATION_CALLBACK_URL',
  );
  final String privacyPolicyUrl = const String.fromEnvironment(
    'PRIVACY_POLICY_URL',
  );

  final String accountSettingsUrl = const String.fromEnvironment(
    'ACCOUNT_SETTINGS_URL',
  );

  final bool testingSuiteEnabled = const bool.fromEnvironment(
    'TESTING_SUITE_ENABLED',
    defaultValue: true,
  );

  final Environment environment = switch (const String.fromEnvironment(
    'ENVIRONMENT',
  )) {
    'dev' => Environment.dev,
    'test' => Environment.test,
    'staging' => Environment.staging,
    'production' => Environment.production,
    _ => Environment.staging,
  };
  Env();
}

enum Environment { dev, staging, test, production }
