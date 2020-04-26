import 'package:flutter/material.dart';
import 'package:censor_twits/helper/theme.dart';
import 'package:censor_twits/model/user.dart';
import 'package:censor_twits/page/common/widget/userListWidget.dart';
import 'package:censor_twits/state/authState.dart';
import 'package:censor_twits/state/searchState.dart';
import 'package:censor_twits/widgets/customAppBar.dart';
import 'package:censor_twits/widgets/customWidgets.dart';
import 'package:provider/provider.dart';

class UsersListPage extends StatelessWidget {
  UsersListPage({
    Key key,
    this.pageTitle = "",
    this.appBarIcon,
    this.emptyScreenText,
    this.emptyScreenSubTileText,
    this.userIdsList,
  }) : super(key: key);

  final String pageTitle;
  final String emptyScreenText;
  final String emptyScreenSubTileText;
  final int appBarIcon;
  final List<String> userIdsList;

  List<User> userList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TwitterColor.mystic,
      appBar: CustomAppBar(
          isBackButton: true,
          title: customTitleText(pageTitle),
          icon: appBarIcon),
      body: Consumer<SearchState>(
        builder: (context, state, child) {
          if (userIdsList != null) {
            userList = state.getuserDetail(userIdsList);
          }
          return userList == null
              ? LinearProgressIndicator()
              : UserListWidget(
                  list: userList,
                  emptyScreenText: emptyScreenText,
                  emptyScreenSubTileText: emptyScreenSubTileText,
                );
        },
      ),
    );
  }
}
