import 'package:animals_guard/appbar/custom_appbar.dart';
import 'package:animals_guard/helpers/helpers.dart';
import 'package:animals_guard/pages/preview_report_page/widgets/generated_text.dart';
import 'package:animals_guard/pages/preview_report_page/widgets/preview_report_button.dart';
import 'package:animals_guard/repos/statement_repos.dart';
import 'package:animals_guard/repos/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_share/flutter_share.dart';

class PreviewReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var repos = StatementRepos.getInstance();
    List<String> pathes = List<String>();
    repos.images.forEach((element) { pathes.add(element.path);});
    var text =
        "Проишествие.\n Адрес: ${UserRepos.address.caption}\n Время и дата: ${repos.incidentTime}\n Описание произошедшего: ${repos.incidentDescription}\n";
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              alignment: Alignment.centerRight,
              children: [
                CustomAppbar("Отправка заявления"),
                Positioned(
                  right: Helpers.responsiveWidth(20, context),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: Helpers.responsiveHeight(40, context),
                      width: Helpers.responsiveHeight(40, context),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 0.5,
                          color: Color(0xFFD3DADD),
                        ),
                      ),
                      child: Icon(
                        Icons.close,
                        size: Helpers.responsiveHeight(20, context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Helpers.responsiveHeight(100, context),
            ),
            GeneratedText(text),
            SizedBox(
              height: Helpers.responsiveHeight(70, context),
            ),
            PreviewReportButton(
              text: "Отправить через сайт",
              action: () async {
                Navigator.of(context).pop();
              },
              color: Theme.of(context).buttonColor,
            ),
            SizedBox(
              height: Helpers.responsiveHeight(24, context),
            ),
            PreviewReportButton(
              text: "Отправить через e-mail",
              action: () async {
                final Email email = Email(
                  body: text,
                  subject: 'Сообщение о прошествии.',
                  recipients: ['example@example.com'],
                  cc: ['cc@example.com'],
                  bcc: ['bcc@example.com'],
                  attachmentPaths: pathes,
                  isHTML: false,
                );
                await FlutterEmailSender.send(email);
                Navigator.of(context).pop();
              },
              color: Theme.of(context).buttonColor,
            ),
            SizedBox(
              height: Helpers.responsiveHeight(24, context),
            ),
            PreviewReportButton(
              text: "Распечатать документ",
              action: () async {
                var file  = await Helpers.writePdf(text);
                print(file.path.substring(5));
                await FlutterShare.shareFile(title: 'заявление.pdf', filePath: file.path.substring(5));
                Navigator.of(context).pop();
              },
              color: Theme.of(context).cardColor,
            ),
          ],
        ),
      ),
    );
  }
}
