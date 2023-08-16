import 'package:book_hunt/Features/home/domain/enitities/book_entity.dart';
import 'package:book_hunt/constants.dart';
import 'package:book_hunt/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

void main() async {
  // change status bar and navigation bar color to black
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      systemNavigationBarColor: Colors.black // Replace 'Colors.blue' with the color you desire
      ));

  //register hive adapter and open box
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox(kFeaturebBox);

  runApp(const BookHunter());
}

class BookHunter extends StatelessWidget {
  const BookHunter({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kPrimaryColor,
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
    );
  }
}
