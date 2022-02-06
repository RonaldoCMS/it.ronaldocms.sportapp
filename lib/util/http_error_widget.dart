import 'package:flutter/material.dart';

class HttpErrorWidget {

  static Widget get HTTP_LIMIT =>
      Center(child: Text("Hai superato il limite giornaliero di richieste."));

  static Widget get HTTP_LOADING =>
      Center(child: CircularProgressIndicator.adaptive());

  
}
