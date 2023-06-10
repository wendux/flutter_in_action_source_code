

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_client_app/l10n/localization_intl.dart';
import 'package:github_client_app/states/profile_change_notifier.dart';
import 'package:provider/provider.dart';
import '../common/global.dart';

class ThemeChangeRoute extends StatelessWidget {
  const ThemeChangeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(GmLocalizations.of(context)!.theme),
      ),
      body: ListView(
        children: Global.themes.map((e) {
          return GestureDetector(
            child: Padding(padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Container(
                color: e,
                height: 40,
              ),
            ),
            onTap: () {
              Provider.of<ThemeModel>(context, listen: false).theme = e;
            },
          );
        }).toList(),
      ),
    );
  }
}


