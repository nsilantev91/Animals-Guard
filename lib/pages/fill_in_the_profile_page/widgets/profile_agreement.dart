import 'package:flutter/material.dart';

class ProfileAgreement extends StatefulWidget {
  final double size;
  final double width;

  ProfileAgreement(this.size, this.width);

  double _adaptationHeight(double mySize) {
    return size * (mySize / 740);
  }

  double _adaptationWidth(double myWidth) {
    return width * (myWidth / 360);
  }

  @override
  _ProfileAgreementState createState() => _ProfileAgreementState();
}

class _ProfileAgreementState extends State<ProfileAgreement> {
  var value = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: widget._adaptationHeight(29),
        ),
        Container(
          height: widget._adaptationHeight(52),
          width: widget._adaptationWidth(320),
          child: RaisedButton(
            child: Text(
              "Сохранить",
              style: TextStyle(
                fontFamily: Theme.of(context).textTheme.body1.fontFamily,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            color: Theme.of(context).accentColor, onPressed: () {},
          ),
        ),
      ],
    );
  }
}
