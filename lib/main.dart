import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tase/pages/home/home_page.dart';
import 'package:tase/providers/filter_provider.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tase',
        theme: ThemeData.light().copyWith(
            textTheme:
                GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme.apply(
                      bodyColor: kPrimaryColor,
                    ))),
        home: MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => FilterProvider())],
          child: const HomePage(),
        ));
  }
}
