import 'package:blockapplication/src/block/block.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
  TextEditingController _email, _password;
  FocusNode _emailNode, _passwordNode;

  Widget textField({
    String headLine,
    bool IsButton = false,
    bool isEmail = false,
    Function onChange,
    String errorText,
  }) {
    return Center(
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45),
            color: IsButton ? Colors.greenAccent : Colors.white70,
          ),
          padding: EdgeInsets.all(15),
          width: IsButton ? 200 : 300,
          child: !IsButton
              ? Column(
                  children: <Widget>[
                    Text(
                      headLine,
                      style: TextStyle(
                          color: IsButton ? Colors.green : Colors.brown,
                          decorationStyle: TextDecorationStyle.dotted,
                          fontSize: 17),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        errorText: errorText,
                      ),
                      onChanged: onChange,
                      obscureText: isEmail ? false : true,
                      keyboardType: isEmail
                          ? TextInputType.emailAddress
                          : TextInputType.text,
                      enableSuggestions: true,
                      autocorrect: true,
                      autofocus: true,
                      keyboardAppearance: Brightness.dark,
                      cursorColor: Colors.blue,
                    ),
                  ],
                )
              : Center(
                  child: Text(headLine),
                )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          StreamBuilder(
            stream: bloc.email,
            builder: (context, snapshot) => textField(
              errorText: snapshot.error,
              onChange:(newValue) {
                bloc.changeEmail(newValue);
              },
              headLine: "Email",
              isEmail: true,
            ),
          ),
          StreamBuilder(
              stream: bloc.password,
              builder: (context, snapshot) {
                return textField(
                  headLine: "Password",
                  onChange: (newValue){
                    bloc.changePassword(newValue);
                  },
                  errorText: snapshot.error,
                );
              }),
          textField(
            headLine: "Submit",
            IsButton: true,
          ),
        ],
      ),
    );
  }
}
