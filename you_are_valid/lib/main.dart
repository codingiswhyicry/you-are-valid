import 'package:flutter/material.dart';
import 'valid_lib.dart';

void main() {
  var resourceBranding = AureusBranding(
      fontFamily: 'Exo',
      lightModeStyle: AureusStylization(
          contrastGradient: LinearGradient(colors: [
            Color.fromRGBO(26, 28, 45, 1.0),
            Color.fromRGBO(16, 6, 45, 1.0),
          ]),
          accentColor: palette.black(),
          primaryImage:
              Image(image: AssetImage('assets/AUREUS-light-fluid.png')),
          secondaryImage:
              Image(image: AssetImage('assets/AUREUS-light-blur.png')),
          logo: Image(image: AssetImage('assets/Icon - Light Mode.png'))),
      darkModeStyle: AureusStylization(
          contrastGradient: LinearGradient(colors: [
            Color.fromRGBO(201, 197, 226, 1.0),
            Color.fromRGBO(214, 199, 246, 1.0),
          ]),
          accentColor: palette.white(),
          primaryImage:
              Image(image: AssetImage('assets/AUREUS-dark-fluid.png')),
          secondaryImage:
              Image(image: AssetImage('assets/AUREUS-dark-blur.png')),
          logo: Image(image: AssetImage('assets/Icon - Dark Mode.png'))));

  var resourceInformation = AureusInformation(
      name: 'Aureus',
      mission:
          "An open-source design system library for user safety critical applications.",
      safetySettings: const Safety(
          frequencyUsage: SafetyPlanFrequency.singleUse,
          isActionBarDevEnabled: false,
          quickActionItems: [],
          eligiblePlanOptions: []),
      developerName: 'Astra Laboratories',
      developerEmail: 'hello@withastra.com',
      userSupportURL: 'https://www.withastra.org/',
      requestedDataPermissions: [
        DataConsent().cameraAccessPermission(
            "We use the camera to demo a Core Tool for you."),
        DataConsent().microphoneAccessPermission(
            "We use the microphone to demo a Core Tool for you."),
      ],
      termsOfService: 'termsOfService',
      privacyPolicy: 'privacyPolicy');

  var resourceNavigation = const AureusNavigationTree(
    homeScreen: ValidBabeyView(),
  );

  packageVariables = AureusResource(
      resourceBranding: resourceBranding,
      resourceInformation: resourceInformation,
      resourceNavigation: resourceNavigation);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'You Are Valid',
      home: ValidBabeyView(),
    );
  }
}
