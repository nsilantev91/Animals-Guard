
import 'package:animals_guard/bloc/make_statemants_bloc/make_statements_bloc.dart';
import 'package:animals_guard/bloc/news_bloc/news_bloc.dart';
import 'package:animals_guard/pages/navigation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // ignore: close_sinks
  static final MakeStatementsBloc makeStatementsBloc = MakeStatementsBloc();

   // ignore: close_sinks
   static final NewsBloc newsBloc = NewsBloc();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MyApp.makeStatementsBloc,
          ),
           BlocProvider(
            create: (context) => MyApp.newsBloc
          ),
        ],
        child: MaterialApp(
          title: 'Animals Guard',
          theme: ThemeData(
              cardColor: Color(0xFFEFF7FF),
              buttonColor: Color(0xFFFFEE94),
              scaffoldBackgroundColor: Colors.white,
              //серый цвет для шагов
              accentColor: Color(0xFFC4C4C4),
              textTheme: TextTheme(
                bodyText1: GoogleFonts.inter(
                  color: Color(0xFF313131),
                ),
                bodyText2: GoogleFonts.inter(
                  color: Color(0xFFA3AEB2),
                ),
              )),
          home: NavigationPage(),
        ));
  }
}
