import 'package:flutter/material.dart';

class Game extends ChangeNotifier {
  final Map _questions = {
    "questions": [
      {
        "question": "Türkiye Cumhuriyeti'nin kurucusu kimdir?",
        "answers": [
          {
            "a": "İsmet İnönü",
          },
          {
            "b": "Mustafa Kemal Atatürk",
          },
          {
            "c": "İbrahim Çallı",
          },
          {
            "d": "Kazım Karabekir",
          },
        ],
        "answer": "b"
      },
      {
        "question": "İlk insan hangi yüzyılda yaşamıştır?",
        "answers": [
          {
            "a": "5. yüzyıl",
          },
          {
            "b": "10. yüzyıl",
          },
          {
            "c": "20. yüzyıl",
          },
          {
            "d": "Bilinmiyor",
          },
        ],
        "answer": "d"
      },
      {
        "question": "İstanbul'un fethi hangi yıl gerçekleşmiştir?",
        "answers": [
          {
            "a": "1453",
          },
          {
            "b": "1520",
          },
          {
            "c": "1683",
          },
          {
            "d": "1919",
          },
        ],
        "answer": "a"
      },
      {
        "question": "Osmanlı İmparatorluğu'nun son padişahı kimdir?",
        "answers": [
          {
            "a": "V. Mehmed Reşad",
          },
          {
            "b": "II. Abdülhamid",
          },
          {
            "c": "V. Murad",
          },
          {
            "d": "VI. Mehmed",
          },
        ],
        "answer": "d"
      },
      {
        "question":
            "Hangi savaşta Türkiye, İtilaf Devletleri tarafında yer almamıştır?",
        "answers": [
          {
            "a": "Birinci Dünya Savaşı",
          },
          {
            "b": "Kore Savaşı",
          },
          {
            "c": "Vietnam Savaşı",
          },
          {
            "d": "Körfez Savaşı",
          },
        ],
        "answer": "c"
      },
      {
        "question":
            "Hangi ülke Amerika Birleşik Devletleri'ne bağımsızlık savaşı vererek bağımsızlığını kazanmıştır?",
        "answers": [
          {
            "a": "Kanada",
          },
          {
            "b": "Meksika",
          },
          {
            "c": "Brezilya",
          },
          {
            "d": "Amerika Birleşik Devletleri",
          },
        ],
        "answer": "b"
      },
      {
        "question": "Fransız Devrimi hangi yıllar arasında gerçekleşmiştir?",
        "answers": [
          {
            "a": "1789-1799",
          },
          {
            "b": "1685-1695",
          },
          {
            "c": "1861-1865",
          },
          {
            "d": "1914-1918",
          },
        ],
        "answer": "a"
      },
      {
        "question": "Hangi lider Sovyetler Birliği'nin ilk lideridir?",
        "answers": [
          {
            "a": "Nikita Kruşçev",
          },
          {
            "b": "Vladimir Lenin",
          },
          {
            "c": "Leon Troçki",
          },
          {
            "d": "Joseph Stalin",
          },
        ],
        "answer": "b"
      },
    ]
  };

  int _score = 0;
  Map a ={};
  // a.
  Map get questions => _questions;

  int get score => _score;

  void increaseScore() {
    _score += 10;
    notifyListeners();
  }

  void startGame() {}

  Map shuffleQuestions() {
    _questions["questions"].shuffle();
    return _questions;
  }
}
