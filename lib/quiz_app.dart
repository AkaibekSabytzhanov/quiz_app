import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Icon> icons = [];
  int turaajoop = 0;
  int jalpusuroo = 0;
  void checkAnswer(bool value) {
    if (quesList.surooAnswer() == value) {
      icons.add(const Icon(Icons.check, color: Colors.green));
      turaajoop++;
    } else {
      icons.add(const Icon(Icons.close, color: Colors.red));
    }
    jalpusuroo++;
    if (quesList.isFinshed() == true) {
      Alert(
        context: context,
        title: "Аягы",
        desc: ' $jalpusurooден  $turaajoop туура!',
        buttons: [
          DialogButton(
            child: const Text("Кайра баштан"),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ).show();
      quesList.reset();
      icons.clear();
      turaajoop = 0;
      jalpusuroo = 0;
    } else {
      quesList.kiyinkiQuestion();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0C846),
      // бул жер AppBar
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: const Text("Суроо-жооп"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 10.0,
                height: 100.0,
                color: Colors.blue,
              ),
              const SizedBox(width: 200.0),
              Container(
                width: 10.0,
                height: 100.0,
                color: Colors.blue,
              ),
            ],
          ),
          Center(
            child: Container(
              // ignore: sort_child_properties_last
              child: Center(child: Text(quesList.getQuestion())),
              width: 400.0,
              height: 150.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.blue),
            ),
          ),
          const SizedBox(height: 20.0),
          InkWell(
            onTap: () {
              setState(() {
                checkAnswer(true);
              });
            },
            child: Container(
              // ignore: prefer_const_constructors, sort_child_properties_last
              child: Center(
                child: const Text(
                  "Туура",
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
              width: 300.0,
              height: 100.0,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 10.0),
          InkWell(
            onTap: () {
              setState(() {
                checkAnswer(false);
              });
            },
            child: Container(
              // ignore: prefer_const_constructors, sort_child_properties_last
              child: Center(
                child: const Text(
                  "Туура эмес",
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
              width: 300.0,
              height: 100.0,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 100.0),
          Row(
            children: <Widget>[
              Container(
                // ignore: sort_child_properties_last
                child: Row(
                  children: icons,
                ),
                width: 411.0,
                height: 30.0,
                color: Colors.white,
              ),
            ],
          )
        ],
      ),
    );
  }
}
