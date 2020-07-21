import 'package:flutter/material.dart';
import 'package:flutter_login/generated/l10n.dart';

class ErrorView extends StatelessWidget {
  final String errorMessage;
  final Function onTap;
  const ErrorView({Key key, @required this.errorMessage, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _createErrorText(errorMessage, context),
            _createTryButton(context)
          ]),
    );
  }

  Widget _createErrorText(String error, BuildContext context) {
    return Text(
      error,
      style: Theme.of(context).textTheme.headline6,
      textAlign: TextAlign.center,
    );
  }

  Widget _createTryButton(BuildContext context) {
    return FlatButton(
      child: Text(
        S.of(context).error_rety,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () => onTap(),
      color: Colors.deepPurple,
    );
  }
}
