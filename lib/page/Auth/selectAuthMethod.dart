import 'package:flutter/material.dart';
import 'package:censor_twits/helper/enum.dart';
import 'package:censor_twits/helper/theme.dart';
import 'package:censor_twits/page/Auth/signup.dart';
import 'package:censor_twits/state/authState.dart';
import 'package:censor_twits/widgets/newWidget/title_text.dart';
import 'package:provider/provider.dart';
import '../homePage.dart';
import 'signin.dart';

class WelcomePage extends StatefulWidget {
  WelcomePage({Key key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Widget _submitButton() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: Colors.purple,
        onPressed: () {
          var state = Provider.of<AuthState>(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Signup(loginCallback: state.getCurrentUser),
            ),
          );
        },
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: TitleText('Create account', color: Colors.white),
      ),
    );
  }

  Widget _body() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width - 80,
              height: 40,
              child: Image.asset('assets/images/icon-480.png'),
            ),
            Spacer(),
            Center(
              child: TitleText(
                'MDCCXCI.',
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            _submitButton(),
            Spacer(),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                TitleText(
                  'Have an account already?',
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
                InkWell(
                  onTap: () {
                    var state = Provider.of<AuthState>(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SignIn(loginCallback: state.getCurrentUser),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
                    child: TitleText(
                      ' Log in',
                      fontSize: 14,
                      color: TwitterColor.dodgetBlue,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AuthState>(context);
    return Scaffold(
      body: state.authStatus == AuthStatus.NOT_LOGGED_IN ||
              state.authStatus == AuthStatus.NOT_DETERMINED
          ? _body()
          : HomePage(),
    );
  }
}
