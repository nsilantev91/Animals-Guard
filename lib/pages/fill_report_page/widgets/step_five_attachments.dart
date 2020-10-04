import 'dart:io';

import 'package:animals_guard/helpers/helpers.dart';
import 'package:animals_guard/pages/fill_report_page/widgets/file_item.dart';
import 'package:animals_guard/repos/statement_repos.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class StepFiveAttachments extends StatefulWidget {
  @override
  _StepFiveAttachmentsState createState() => _StepFiveAttachmentsState();
}

class _StepFiveAttachmentsState extends State<StepFiveAttachments> {
  func() {
    setState(() {});
  }

  Widget buildListOfFiles() {
    List<FileItem> _items = [];
    StatementRepos.getInstance().documents.forEach((e) {
      _items.add(
        FileItem(e, 'Документ', func),
      );
    });
    StatementRepos.getInstance().images.forEach((e) {
      _items.add(
        FileItem(e, 'Фотография', func),
      );
    });
    StatementRepos.getInstance().videos.forEach((e) {
      _items.add(
        FileItem(e, 'Видео', func),
      );
    });
    return Container(
      width: Helpers.responsiveWidth(320, context),
      constraints: BoxConstraints(
        maxHeight: Helpers.responsiveHeight(200, context),
        minHeight: Helpers.responsiveHeight(0, context),
      ),
      child: ListView.separated(
        // shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return _items[index];
        },
        itemCount: _items.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: Helpers.responsiveHeight(12, context),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Helpers.responsiveWidth(24, context)),
            child: Text(
              "Прикрепите файлы",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Helpers.responsiveHeight(16, context),
                color: Theme.of(context).textTheme.bodyText1.color,
                fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
              ),
            ),
          ),
          SizedBox(
            height: Helpers.responsiveHeight(61, context),
          ),
          buildListOfFiles(),
          SizedBox(
            height: Helpers.responsiveHeight(16, context),
          ),
          //TODO здесь будет отображаться список прикрепленных файлов
          //TODO добавленный виджет - ReportTextField с текстом названия файла, label - тип файла
          RaisedButton.icon(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Color(0xFFD3DADD),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 0,
            onPressed: () async {
              FilePickerResult result = await FilePicker.platform.pickFiles();
              if (result != null) {
                File file = File(result.files.single.path);
                if (result.files.single.extension.toLowerCase() == 'mp4' ||
                    result.files.single.extension.toLowerCase() == 'mov') {
                  StatementRepos.getInstance().videos.add(file);
                } else if (result.files.single.extension.toLowerCase() ==
                        'jpg' ||
                    result.files.single.extension.toLowerCase() == 'png' ||
                    result.files.single.extension.toLowerCase() == 'jpeg') {
                  StatementRepos.getInstance().images.add(file);
                } else {
                  StatementRepos.getInstance().documents.add(file);
                }
              }
              setState(() {});
            },
            icon: Icon(
              Icons.add,
              color: Color(0xFFD3DADD),
            ),
            label: Text(
              "Добавить файл",
              style: TextStyle(
                color: Color(0xFFD3DADD),
                fontFamily: Theme.of(context).textTheme.bodyText1.fontFamily,
                fontSize: Helpers.responsiveHeight(17, context),
              ),
            ),
          )
        ],
      ),
    );
  }
}
