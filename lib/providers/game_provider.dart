import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/pages/end_screen.dart';

class Game extends ChangeNotifier {
  //* variables
  final Map _questions = {
    "questions": [
      {
        "question": "Türkiye Cumhuriyeti'nin kurucusu kimdir?",
        "answers": [
          {
            "a": "İsmet İnönü",
            "isAnswer": false,
          },
          {
            "b": "Mustafa Kemal Atatürk",
            "isAnswer": true,
          },
          {
            "c": "İbrahim Çallı",
            "isAnswer": false,
          },
          {
            "d": "Kazım Karabekir",
            "isAnswer": false,
          },
        ],
      },
      {
        "question": "İlk insan hangi yüzyılda yaşamıştır?",
        "answers": [
          {
            "a": "5. yüzyıl",
            "isAnswer": false,
          },
          {
            "b": "10. yüzyıl",
            "isAnswer": false,
          },
          {
            "c": "20. yüzyıl",
            "isAnswer": false,
          },
          {
            "d": "Bilinmiyor",
            "isAnswer": true,
          },
        ],
      },
      {
        "question": "İstanbul'un fethi hangi yıl gerçekleşmiştir?",
        "answers": [
          {
            "a": "1453",
            "isAnswer": true,
          },
          {
            "b": "1520",
            "isAnswer": false,
          },
          {
            "c": "1683",
            "isAnswer": false,
          },
          {
            "d": "1919",
            "isAnswer": false,
          },
        ],
        "answer": "a"
      },
      {
        "question": "Osmanlı İmparatorluğu'nun son padişahı kimdir?",
        "answers": [
          {
            "a": "V. Mehmed Reşad",
            "isAnswer": false,
          },
          {
            "b": "II. Abdülhamid",
            "isAnswer": false,
          },
          {
            "c": "V. Murad",
            "isAnswer": false,
          },
          {
            "d": "VI. Mehmed",
            "isAnswer": true,
          },
        ],
      },
      {
        "question":
            "Hangi savaşta Türkiye, İtilaf Devletleri tarafında yer almamıştır?",
        "answers": [
          {
            "a": "Birinci Dünya Savaşı",
            "isAnswer": false,
          },
          {
            "b": "Kore Savaşı",
            "isAnswer": false,
          },
          {
            "c": "Vietnam Savaşı",
            "isAnswer": true,
          },
          {
            "d": "Körfez Savaşı",
            "isAnswer": false,
          },
        ],
      },
      {
        "question":
            "Hangi ülke Amerika Birleşik Devletleri'ne bağımsızlık savaşı vererek bağımsızlığını kazanmıştır?",
        "answers": [
          {
            "a": "Kanada",
            "isAnswer": false,
          },
          {
            "b": "Meksika",
            "isAnswer": true,
          },
          {
            "c": "Brezilya",
            "isAnswer": false,
          },
          {
            "d": "Amerika Birleşik Devletleri",
            "isAnswer": false,
          },
        ],
      },
      {
        "question": "Fransız Devrimi hangi yıllar arasında gerçekleşmiştir?",
        "answers": [
          {
            "a": "1789-1799",
            "isAnswer": true,
          },
          {
            "b": "1685-1695",
            "isAnswer": false,
          },
          {
            "c": "1861-1865",
            "isAnswer": false,
          },
          {
            "d": "1914-1918",
            "isAnswer": false,
          },
        ],
      },
      {
        "question": "Hangi lider Sovyetler Birliği'nin ilk lideridir?",
        "answers": [
          {
            "a": "Nikita Kruşçev",
            "isAnswer": false,
          },
          {
            "b": "Vladimir Lenin",
            "isAnswer": true,
          },
          {
            "c": "Leon Troçki",
            "isAnswer": false,
          },
          {
            "d": "Joseph Stalin",
            "isAnswer": false,
          },
        ],
      },
    ]
  };

  int _score = 0;

  // total duration of the game. If this reached to zero the game ends.
 final Duration _gameDuration = const Duration(seconds: 10);

  bool isAnswered = false;

  int _questionNumber = 1;
  late int _time =0 ;
  late PageController controller;

  //* end of varibales

  //* getters

  Map get questions => _questions;
  int get questionNumber => _questionNumber;
  int get score => _score;
  int get time => _time;
  Duration get gameDuration => _gameDuration;

  //* end of getters

  //* Functions

  void increaseScore() {
    print("increased");
    _score += 10;
    notifyListeners();
  }

  void startTimer(BuildContext ctx,DateTime startTime) {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        final DateTime now = DateTime.now();
        // print(now.difference(startTime));
        final int difference = now.difference(startTime).inSeconds;
        
        if (difference == _gameDuration.inSeconds) {
          print("Times Up Mother Fucker");
          timer.cancel();
          Navigator.of(ctx).pushReplacementNamed(EndScreen.routeName);
        }
        _time = _gameDuration.inSeconds - difference;
      //  print(timer.tick);
        notifyListeners();
      },
    );
  }

  Map shuffleQuestions() {
    _questions["questions"].shuffle();
    return _questions;
  }

  void nextQuestion() {
    _questionNumber += 1;
    notifyListeners();
  }

  bool changeIsAnswered() {
    isAnswered = !isAnswered;
    notifyListeners();
    return isAnswered;
  }

  //* end of functions
}
