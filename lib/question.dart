// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';

// ignore: implementation_imports
import 'package:flutter/src/widgets/container.dart';

import 'quiz_clas.dart';

class QuesList {
  int _surooNomeri = 0;
  // ignore: prefer_final_fields
  List<Question> _suroolor = [
    Question("1. Ош Бишкектен чоң", false),
    Question("2. Кыргызстандын борбору Бишкек", true),
    Question("3. Ош түштүктө жайгашкан", true),
    Question("4. Кыргызстанда 7 облус бар", true),
    Question("5. Күздөн кийин жаз", false),
    Question("6. Flutter бул программалоо тили ", false),
    Question("7. 1 күндө 24 саат", true),
  ];
  String getQuestion() {
    return _suroolor[_surooNomeri].surooString;
  }

  bool isFinshed() {
    if (_surooNomeri == _suroolor.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _surooNomeri = 0;
  }

  bool surooAnswer() {
    return _suroolor[_surooNomeri].surooAnswer;
  }

  void kiyinkiQuestion() {
    if (_surooNomeri < _suroolor.length - 1) {
      _surooNomeri++;
    }
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
