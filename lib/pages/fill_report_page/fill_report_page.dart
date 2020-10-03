import 'package:animals_guard/appbar/custom_appbar.dart';
import 'package:animals_guard/bloc/make_statemants_bloc/make_statements_bloc.dart';
import 'package:animals_guard/dog_slider/dog_slider.dart';
import 'package:animals_guard/helpers/helpers.dart';
import 'package:animals_guard/pages/fill_report_page/widgets/report_text_field.dart';
import 'package:animals_guard/pages/fill_report_page/widgets/report_navbar.dart';
import 'package:animals_guard/pages/fill_report_page/widgets/step_five_attachments.dart';
import 'package:animals_guard/pages/fill_report_page/widgets/step_four_map_place.dart';
import 'package:animals_guard/pages/fill_report_page/widgets/step_one_abstract_place.dart';
import 'package:animals_guard/pages/fill_report_page/widgets/step_three_time.dart';
import 'package:animals_guard/pages/fill_report_page/widgets/step_two_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main.dart';

class FillReportPage extends StatefulWidget {
  @override
  _FillReportPageState createState() => _FillReportPageState();
}

class _FillReportPageState extends State<FillReportPage> {
  void _incStep() {
    int currentStep = MyApp.makeStatementsBloc.step;
    if (currentStep == 2) {
      return;
    }
    MyApp.makeStatementsBloc.add(InternetStepEvent(currentStep + 1));
  }

  void _decStep() {
    int currentStep = MyApp.makeStatementsBloc.step;
    if (currentStep == -1) return;
    MyApp.makeStatementsBloc.add(InternetStepEvent(currentStep - 1));
  }

  List<Widget> _steps = [
    StepOneAbstractPlace(),
    StepTwoDescription(),
    StepThreeTime(),
    StepFourMapPlace(),
    StepFiveAttachments()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocBuilder<MakeStatementsBloc, MakeStatementsState>(
      builder: (context, state) {
        final currentStep = state.step + 2;
        return Scaffold(
        //  resizeToAvoidBottomPadding: false,
          bottomNavigationBar: ReportNavbar(
            currentStep: currentStep,
            incStep: _incStep,
            decStep: _decStep,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    CustomAppbar("Шаг " + currentStep.toString()),
                    GestureDetector(
                      onTap: () {
                        //TODO по нажатию, мы покинем страницу, вне зависимости от того,
                        //TODO на каком мы шаге, надо уметь сохранять ответы на все вопросы, если пользователь случайно нажал
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.white,
                        )),
                        width: Helpers.responsiveWidth(120, context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: Helpers.responsiveHeight(20, context),
                ),
                DogSlider(
                  onChanged: null,
                  countPos: 3,
                  width: Helpers.responsiveWidth(360, context),
                ),
                SizedBox(
                  height: Helpers.responsiveHeight(100, context),
                ),
                _steps[currentStep],
              ],
            ),
          ),
        );
      },
    ));
  }
}
