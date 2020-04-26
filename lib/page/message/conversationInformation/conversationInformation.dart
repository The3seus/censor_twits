import 'package:flutter/material.dart';
import 'package:censor_twits/helper/constant.dart';
import 'package:censor_twits/helper/theme.dart';
import 'package:censor_twits/model/user.dart';
import 'package:censor_twits/page/settings/widgets/headerWidget.dart';
import 'package:censor_twits/page/settings/widgets/settingsAppbar.dart';
import 'package:censor_twits/page/settings/widgets/settingsRowWidget.dart';
import 'package:censor_twits/state/authState.dart';
import 'package:censor_twits/state/chats/chatState.dart';
import 'package:censor_twits/widgets/customAppBar.dart';
import 'package:censor_twits/widgets/customWidgets.dart';
import 'package:censor_twits/widgets/newWidget/customUrlText.dart';
import 'package:provider/provider.dart';

class ConversationInformation extends StatelessWidget {
  const ConversationInformation({Key key}) : super(key: key);

  Widget _header(BuildContext context, User user) {
    
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: SizedBox(
              height: 80,
              width: 80,
              child: customImage(context, user.profilePic),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              UrlText(
                text: user.displayName,
                style: onPrimaryTitleText.copyWith(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              user.isVerified
                  ? customIcon(
                      context,
                      icon: AppIcon.blueTick,
                      istwitterIcon: true,
                      iconColor: AppColor.primary,
                      size: 18,
                      paddingIcon: 3,
                    )
                  : SizedBox(width: 0),
            ],
          ),
          customText(
            user.userName,
            style: onPrimarySubTitleText.copyWith(
              color: Colors.black54,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
     var user = Provider.of<ChatState>(context).chatUser ?? User();
    return Scaffold(
      backgroundColor: TwitterColor.white,
      appBar: CustomAppBar(
        isBackButton: true,
        title: customTitleText(
          'Conversation information',
        ),
      ),
      body: ListView(
        children: <Widget>[
          _header(context, user),
          HeaderWidget('Notifications'),
          SettingRowWidget(
            "Mute conversation",
            visibleSwitch: true,
          ),
          Container(
            height: 15,
            color: TwitterColor.mystic,
          ),
          SettingRowWidget("Block ${user.userName}",textColor: TwitterColor.dodgetBlue,showDivider: false,),
          SettingRowWidget("Report ${user.userName}",textColor: TwitterColor.dodgetBlue,showDivider: false),
          SettingRowWidget("Delete conversation", textColor: TwitterColor.ceriseRed,showDivider: false),
        ],
      ),
    );
  }
}
