import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_weather_api/screens/home.dart';
import 'package:learn_weather_api/utils/constants/colors.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Weather API',
      theme: ThemeData(
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.montserrat(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: TColors.light,
          ),
          headlineMedium: GoogleFonts.montserrat(
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
            color: TColors.light,
          ),
          headlineSmall: GoogleFonts.montserrat(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: TColors.light,
          ),
          titleLarge: GoogleFonts.montserrat(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: TColors.light,
          ),
          titleMedium: GoogleFonts.montserrat(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: TColors.light,
          ),
          titleSmall: GoogleFonts.montserrat(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color: TColors.light,
          ),
          bodyLarge: GoogleFonts.poppins(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: TColors.light,
          ),
          bodyMedium: GoogleFonts.poppins(
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            color: TColors.light,
          ),
          bodySmall: GoogleFonts.poppins(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
            color: TColors.light.withOpacity(0.5),
          ),
          labelLarge: GoogleFonts.poppins(
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: TColors.light,
          ),
          labelMedium: GoogleFonts.poppins(
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: TColors.light.withOpacity(0.5),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
