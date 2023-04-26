import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Game extends ChangeNotifier {
  late PageController controller;
  bool isAnswered = false;

  // total duration of the game. If this reached to zero the game ends.
  late Duration _gameDuration;

  int _lastScore = 0;
  int _questionNumber = 1;
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
      {
        "question":
            "Hangi ülke, bağımsızlığını kazandığı ilk Afrika ülkesidir?",
        "answers": [
          {
            "a": "Gana",
            "isAnswer": true,
          },
          {
            "b": "Nijerya",
            "isAnswer": false,
          },
          {
            "c": "Zimbabwe",
            "isAnswer": false,
          },
          {
            "d": "Kenya",
            "isAnswer": false,
          }
        ]
      },
      {
        "question": "Kur'an hangi dilde yazılmıştır?",
        "answers": [
          {
            "a": "Türkçe",
            "isAnswer": false,
          },
          {
            "b": "Farsça",
            "isAnswer": false,
          },
          {
            "c": "Arapça",
            "isAnswer": true,
          },
          {
            "d": "Urduca",
            "isAnswer": false,
          }
        ]
      },
      {
        "question": "Hangi şehir Amerika Birleşik Devletleri'nin başkentidir?",
        "answers": [
          {
            "a": "New York",
            "isAnswer": false,
          },
          {
            "b": "Los Angeles",
            "isAnswer": false,
          },
          {
            "c": "Washington D.C.",
            "isAnswer": true,
          },
          {
            "d": "Chicago",
            "isAnswer": false,
          }
        ]
      },
      {
        "question":
            "Hangi savaşta Almanya, İtalya ve Japonya, Müttefik Devletleri'ne karşı savaşmıştır?",
        "answers": [
          {
            "a": "Kore Savaşı",
            "isAnswer": false,
          },
          {
            "b": "İkinci Dünya Savaşı",
            "isAnswer": true,
          },
          {
            "c": "Soğuk Savaş",
            "isAnswer": false,
          },
          {
            "d": "Körfez Savaşı",
            "isAnswer": false,
          }
        ]
      },
      {
        "question":
            "Hangi ülke, Japonya'nın İkinci Dünya Savaşı'ndan sonra teslim olmasından sonra Kore'yi işgal etti?",
        "answers": [
          {
            "a": "Amerika Birleşik Devletleri",
            "isAnswer": false,
          },
          {
            "b": "Sovyetler Birliği",
            "isAnswer": true,
          },
          {
            "c": "Çin Halk Cumhuriyeti",
            "isAnswer": false,
          },
          {
            "d": "Vietnam",
            "isAnswer": false,
          }
        ]
      },
    ]
  };

  int _score = 0;

  //* end of varibales

  //* getters

  Map get questions => _questions;

  int get questionNumber => _questionNumber;

  int get score => _score;

  Duration get gameDuration => _gameDuration;

  int get lastScore => _lastScore;

  //* end of getters

  //* Functions

  void getDataFromPrefs() {
    getGameDurationFromSettings();
    getLastScore();
  }

  // Shared Preferences
  // This function gets gameDuration from local storage and sets the _gameDuration. if gameDuration is null then _gameDuration will be 60 by default.
  Future<void> getGameDurationFromSettings() async {
    logger.i(" game duration has been set ");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _gameDuration = Duration(seconds: prefs.getInt("gameDuration") ?? 60);
  }

  // This function gets last score from local storage and sets the _lastScore. if last score is null then _lastScore will be 0 by default.
  Future<void> getLastScore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _lastScore = prefs.getInt("lastScore") ?? 0;
    logger.i(_lastScore);
  }

  // sets the value of gameDuration.
  Future<void> setGameDuration(int newGameDuration) async {
    _gameDuration = Duration(seconds: newGameDuration);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("gameDuration", newGameDuration);
  }

  Future<void> setLastScore(int newScore) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (newScore > _lastScore) {
      _lastScore = newScore;
      prefs.setInt("lastScore", _lastScore);
    }
  }

  // end of Shared Preferences

  void increaseScore() {
    logger.i("Increased");
    _score += 10;
    notifyListeners();
  }

  void resetGame() {
    _questionNumber = 1;
    _score = 0;
    notifyListeners();
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
