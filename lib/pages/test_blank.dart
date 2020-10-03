import 'package:animals_guard/alerts/check_geo_alert.dart';
import 'package:animals_guard/pages/map.dart';
import 'package:animals_guard/services/geo_funcs.dart';
import 'package:flutter/material.dart';

class TestBlank extends StatefulWidget {
  @override
  _TestBlankState createState() => _TestBlankState();
}

class _TestBlankState extends State<TestBlank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: () async {
                var address = await Geo.getAddress();
                address = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GMap(
                                  del: address,
                                ))) ??
                    address;
                checkGeoDialog(context, address);
              },
              child: Text('Карта'),
            ),
          ],
        ),
      ),
    );
  }
}
