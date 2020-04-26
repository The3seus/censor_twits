import 'package:flutter/material.dart';
import 'package:censor_twits/helper/theme.dart';
import 'package:censor_twits/page/settings/widgets/headerWidget.dart';
import 'package:censor_twits/page/settings/widgets/settingsRowWidget.dart';
import 'package:censor_twits/widgets/customAppBar.dart';
import 'package:censor_twits/widgets/customWidgets.dart';
import 'package:censor_twits/widgets/newWidget/title_text.dart';

class ProxyPage extends StatelessWidget {
  const ProxyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TwitterColor.white,
      appBar: CustomAppBar(
        isBackButton: true,
        title: customTitleText(
          'Proxy',
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          SettingRowWidget(
            "Enable HTTP Proxy",
            showCheckBox: true,
            vPadding: 15,
            showDivider: true,
            subtitle:
                'Configure HTTP proxy for network request (note: this does not apply to browser).',
          ),
          SettingRowWidget(
            "Proxy Host",
            subtitle: 'Configure your proxy\'s hostname.',
            showDivider: true,
          ),
          SettingRowWidget(
            "Proxy Port",
            subtitle: 'Configure your proxy\'s port number.',
          ),
        ],
      ),
    );
  }
}
