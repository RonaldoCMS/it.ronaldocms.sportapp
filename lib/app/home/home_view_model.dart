import 'package:flutter/cupertino.dart';

class Home_ViewModel extends ChangeNotifier {
  BuildContext context;

  Home_ViewModel(this.context) {}

  List<Widget> pages = [];
}
