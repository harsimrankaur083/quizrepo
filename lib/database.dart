import 'data.dart';

class Database {
  int _nextquestion = 0;
  List<Data> _quesbank = [
    Data('Electrons are larger than molecules.', false),
    Data('The Atlantic Ocean is the biggest ocean on Earth.', false),
    Data('The chemical make up food often changes when you cook it.', true),
    Data(' Sharks are mammals.', false),
    Data('Floatation separates mixtures based on density', true),
    Data(' Atoms are most stable when their outer shells are full.', true),
    Data('Filtration separates mixtures based upon their particle size.', true),
    Data(' Venus is the closest planet to the Sun.', false),
    Data(' Conductors have low resistance.', true),
    Data(' Molecules can have atoms from more than one chemical element.', true),
    Data(' Water is an example of a chemical element.', false),
    Data(' The study of plants is known as botany.', true),
    Data(' Mount Kilimanjaro is the tallest mountain in the world.', false),
    Data(' Atomic bombs work by atomic fission.', true),
    Data(' Molecules are chemically bonded.', true),
    Data(' Spiders have six legs.', false),
    Data(' Kelvin is a measure of temperature.', true),
    Data(' The human skeleton is made up of less than 100 bones.', false),


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
