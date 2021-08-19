import 'data.dart';

class Database {
  int _nextquestion = 0;
  List<Data> _quesbank = [
    Data('The first Indian movie nominated for Oscar was Lagaan', false),
    Data('"Abhi to party shuru huyi hai" is song of movie Khoobsurat.', true),
    Data('Shahrukh khan played a role of a villain in Baazigar movie.', true),
    Data('Accidental primeminister movies is biopic of Narendra Modi.', false),
    Data('Ramgopal Verma is the director of "Kasoor".', false),
    Data(' Shraddha was lead actoress of "Bhaghi 2"', false),
    Data('S. S. Rajamouli is director of "bahubali 2".', true),
  ];
  String getQuestion() {
    return _quesbank[_nextquestion].ques;
  }

  bool getAnswer() {
    return _quesbank[_nextquestion].ans;
      

  }

  void getNextQuestion() {
    if (_nextquestion < _quesbank.length - 1) {
      _nextquestion++;
    }
  }

  bool isFinished() {
    if (_nextquestion >= _quesbank.length - 1) {
      print('true');
      return true;
    } else {
      return false;
    }
  }
  void reset(){
    _nextquestion=0;
  }
  int totalQuestion(){
    return _quesbank.length;
  }
  
}
