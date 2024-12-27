part of 'app.dart';

Route<dynamic>? onGenerate(RouteSettings settings) {
  switch (settings.name) {
    // Profile

    case Splash.route:
      return KRoute(child: const Splash());

    case Onboard.route:
      return KRoute(child: const Onboard());

    case Introduction.route:
      return KRoute(child: const Introduction());

    // Products

    case ProductPreview.route:
      return KRoute(child:  ProductPreview(
        product: settings.arguments as ProductModel,
      ));
    // Dashboard Route

    case Dashboard.route:
      return KRoute(child: const Dashboard());

    // Authentication Route

    case Login.route:
      return KRoute(child: const Login());

    case Register.route:
      return KRoute(child: const Register());

    case Setup.route:
      return KRoute(child: const Setup());

    default:
      return null;
  }
}
