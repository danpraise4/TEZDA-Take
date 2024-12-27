import 'package:fetch/core/config/config.dart';
import 'package:fetch/core/helper/enums.dart';


late String baseUrl;
late String websiteUrl;
late Environment environment;

// Initialize API Bases for PRODUCTION or for STAGING
void initApi(Environment env) {
  environment = env;

  switch (env) {
    case Environment.development:
      baseUrl = AppConfig.instance.config.baseUrl;
      websiteUrl = 'https://test.website.com';
      break;

    default:
      baseUrl = AppConfig.instance.config.baseUrl;
      websiteUrl = 'https://test.website.com';
      break;
  }
}
