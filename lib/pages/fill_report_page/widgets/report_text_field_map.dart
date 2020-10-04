import 'package:animals_guard/alerts/check_geo_alert.dart';
import 'package:animals_guard/helpers/helpers.dart';
import 'package:animals_guard/models/point.dart';
import 'package:animals_guard/repos/user_repository.dart';
import 'package:animals_guard/services/geo_funcs.dart';
import 'package:flutter/material.dart';

class ReportTextFieldMap extends StatefulWidget {
  final String label;

  ReportTextFieldMap(this.label);

  @override
  _ReportTextFieldMapState createState() => _ReportTextFieldMapState();
}

class _ReportTextFieldMapState extends State<ReportTextFieldMap> {
  TextEditingController controller;
  bool isLoading = false;

  @override
  void initState() {
    controller = TextEditingController();
    controller.text = UserRepos.address.caption;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? CircularProgressIndicator()
        : Column(
            children: [
              GestureDetector(
                //кнопка для определения геопозиции
                onTap: () async {
                  setState(() {
                    isLoading = true;
                  });
                  var address = await Geo.getAddress();
                  UserRepos.address = address;
                  await checkGeoDialog(context, address);
                  setState(() {
                    isLoading = false;
                    controller.text =
                        address != null ? UserRepos.address.caption : '';
                  });
                },
                child: Container(
                  width: 50, //Helpers.responsiveWidth(1, context),
                  height: 50, //Helpers.responsiveHeight(1, context),
                  decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      topLeft: Radius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.gps_fixed_outlined,
                      size: 50, //Helpers.responsiveHeight(10, context),
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
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
                        widget.label,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: Helpers.responsiveWidth(10, context),
                        ),
                        width: Helpers.responsiveWidth(300, context),
                        child: TextField(
                          onChanged: (value) {
                            UserRepos.address = new Point(
                                caption: value,
                                position: UserRepos.address.position);
                          },
                          controller: controller,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1.color,
                            fontFamily: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .fontFamily,
                            fontSize: Helpers.responsiveHeight(17, context),
                          ),
                          cursorColor:
                              Theme.of(context).textTheme.bodyText1.color,
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
                            hintStyle: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ],
          );
  }
}
