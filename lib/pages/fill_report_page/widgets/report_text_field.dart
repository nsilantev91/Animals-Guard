import 'package:animals_guard/helpers/helpers.dart';
import 'package:animals_guard/repos/statement_repos.dart';
import 'package:flutter/material.dart';

class ReportTextField extends StatefulWidget {
  String title;
  String text;
  ReportTextField(
    this.title,
    this.text,
  );

  @override
  _ReportTextFieldState createState() => _ReportTextFieldState();
}

class _ReportTextFieldState extends State<ReportTextField> {
  TextEditingController _controller = TextEditingController();
  String _text;

  Future<String> createAlertDialog(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).cardColor,
          contentPadding: EdgeInsets.only(
            top: Helpers.responsiveHeight(15, context),
          ),
          content: Container(
            padding: EdgeInsets.only(
              left: Helpers.responsiveHeight(6, context),
              top: Helpers.responsiveHeight(6, context),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: Helpers.responsiveWidth(20, context),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).cardColor,
            ),
            width: Helpers.responsiveWidth(320, context),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: Helpers.responsiveWidth(10, context),
                  ),
                  width: Helpers.responsiveWidth(300, context),
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyText1.color,
                      fontFamily:
                          Theme.of(context).textTheme.bodyText1.fontFamily,
                      fontSize: Helpers.responsiveHeight(17, context),
                    ),
                    cursorColor: Theme.of(context).textTheme.bodyText1.color,
                    minLines: 1,
                    maxLines: 10,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      hintText: "Введите сообщение...",
                      hintStyle: TextStyle(
                        color: Theme.of(context).textTheme.bodyText2.color,
                        fontFamily:
                            Theme.of(context).textTheme.bodyText2.fontFamily,
                        fontSize: Helpers.responsiveHeight(15, context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Отмена'),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop(
                  _controller.text.toString(),
                );
              },
              child: Text('Сохранить'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    _text = widget.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        createAlertDialog(context).then(
          (value) {
            if (value != null && value.trim().length == 0) {
              setState(() {
                _text = widget.text;
              });
            }
            if (value != null && value.trim().length != 0) {
              setState(() {
                _text = value;
              });
            }
            StatementRepos.getInstance().setIncidentDescription(_text);
            print(StatementRepos.getInstance().incidentDescription);
          },
        );
      },
      child: Container(
        padding: EdgeInsets.only(
          left: Helpers.responsiveHeight(6, context),
          top: Helpers.responsiveHeight(6, context),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: Helpers.responsiveWidth(20, context),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).cardColor,
        ),
        width: Helpers.responsiveWidth(320, context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                _text == widget.text
                    ? _text
                    : StatementRepos.getInstance().incidentDescription,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
