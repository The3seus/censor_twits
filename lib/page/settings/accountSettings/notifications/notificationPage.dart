import 'package:flutter/material.dart';
import 'package:censor_twits/helper/theme.dart';
import 'package:censor_twits/model/user.dart';
import 'package:censor_twits/page/settings/widgets/headerWidget.dart';
import 'package:censor_twits/page/settings/widgets/settingsAppbar.dart';
import 'package:censor_twits/page/settings/widgets/settingsRowWidget.dart';
import 'package:censor_twits/state/authState.dart';
import 'package:censor_twits/widgets/newWidget/customUrlText.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<AuthState>(context).userModel ?? User();
    return Scaffold(
      backgroundColor: TwitterColor.white,
      appBar: SettingsAppBar(
        title: 'Notifications',
        subtitle: user.userName,
      ),
      body: ListView(
        children: <Widget>[
          HeaderWidget('Filters'),
          SettingRowWidget(
            "Quality filter",
            showCheckBox: true,
            subtitle:
                'Filter lower-quality from your notifications. This won\'t filter out notifications from people you follow or account you\'ve inteacted with recently.',
            // navigateTo: 'AccountSettingsPage',
          ),
          Divider(height: 0),
          SettingRowWidget("Advanced filter"),
          SettingRowWidget("Muted word"),
          HeaderWidget(
            'Preferences',
            secondHeader: true,
          ),
          SettingRowWidget(
            "Unread notification count badge",
            showCheckBox: true,
            subtitle:
                'Display a badge with the number of notifications waiting for you inside the Twitter app.',
          ),
          SettingRowWidget("Push notifications"),
          SettingRowWidget("SMS notifications"),
          SettingRowWidget(
            "Email notifications",
            subtitle: 'Control when how often Twitter sends emails to you.',
          ),
        ],
      ),
    );
  }
}
