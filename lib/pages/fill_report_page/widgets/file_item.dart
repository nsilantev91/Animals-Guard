import 'dart:io';

import 'package:animals_guard/helpers/helpers.dart';
import 'package:animals_guard/repos/statement_repos.dart';
import 'package:flutter/material.dart';

class FileItem extends StatelessWidget {
  String type;
  Function func;
  File file;
  FileItem(
    this.file,
    this.type,
    this.func,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        Helpers.responsiveHeight(6, context),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      width: Helpers.responsiveWidth(320, context),
      child: Row(
        children: [
          Container(
            width: Helpers.responsiveWidth(270, context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(type),
                SizedBox(
                  height: Helpers.responsiveHeight(9, context),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Helpers.responsiveWidth(20, context),
                    vertical: Helpers.responsiveHeight(9, context),
                  ),
                  child: Text(
                    file.path.split("/").last,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              switch (type) {
                case 'Изображение':
                  StatementRepos.getInstance().images.remove(file);
                  break;
                case 'Документ':
                  StatementRepos.getInstance().documents.remove(file);
                  break;
                case 'Видео':
                  StatementRepos.getInstance().videos.remove(file);
                  break;
                default:
              }
              func();
            },
            child: Icon(
              Icons.clear,
            ),
          ),
        ],
      ),
    );
  }
}
