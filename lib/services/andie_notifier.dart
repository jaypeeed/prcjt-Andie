import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:prjct_andie/models/userAndie.dart';

class AndieNotifier with ChangeNotifier{

  List<userAndie> _andieList = [];
  late userAndie _currentAndie;

  UnmodifiableListView<userAndie> get andieList => UnmodifiableListView(_andieList);

  userAndie get currentAndie => _currentAndie;

  set andieList(List<userAndie> andieList){
    _andieList = andieList;
    notifyListeners();
  }

  set currentAndie( userAndie andie){
    _currentAndie = andie;
    notifyListeners();
  }
}