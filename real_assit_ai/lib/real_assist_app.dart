import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_assit_ai/core/extensions/responsive.dart';

import 'core/routes/app_router.dart';

class RealAssistApp extends StatelessWidget {
  const RealAssistApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (
      BuildContext context,
      Orientation orientation,
      DeviceType deviceType,
    ) {
      return MaterialApp(
        title: 'Real Assist AI',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: GoogleFonts.dmSansTextTheme(Theme.of(context).textTheme),
        ),
        onGenerateRoute: AppRouter.generateRoute,
      );
    });
  }
}
