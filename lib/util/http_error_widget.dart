import 'package:flutter/material.dart';
import 'package:football/util/costant.dart';

class HttpErrorWidget {
  static Widget get HTTP_LIMIT =>
      Center(child: Text("Hai superato il limite giornaliero di richieste."));

  static Widget get HTTP_LOADING =>
      Center(child: CircularProgressIndicator.adaptive());

  static Widget get HTTP_NOT_HAS_DATA => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Constant.logoApp,
          Text("Mi dispiace, non è possibile visualizzare i dati al momento.")
        ],
      );
}
