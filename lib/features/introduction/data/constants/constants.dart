import 'package:fetch/core/helper/constants.dart';
import 'package:fetch/features/introduction/data/model/onboard.model.dart';

List<OnboardModel> get onboardItems => [
  OnboardModel(
    title: "Welcome to <c>$appName",
    subTitle: "Skip the queues and shop your favorite local stores from anywhere.",
    image: "$imagePath/onboarding_1.svg",
  ),

  OnboardModel(
    title: "<c>Fast and easy <c>Shopping",
    subTitle: "Browse, pay, and pick up your items or get them delivered — all with just a few taps.",
    image: "$imagePath/onboarding_2.svg",
  ),

  OnboardModel(
    title: "<c>Real-time Updates",
    subTitle: "Stay informed at every step of your order, from packing to pickup or delivery.",
    image: "$imagePath/onboarding_3.svg",
  ),
];