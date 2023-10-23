
// this file is used to provide the questions and answers via questions file which has the constructor to guide the actions
import 'questions.dart';

class Quizzbrain {
   int _count=0;
  final List<Questions> _questionreserve = [
    //I made this list a private member so that main can't have direct access to questions and answers.

    Questions('Some cats are actually allergic to humans', true),
    Questions('You can lead a cow down stairs but not up stairs.', false),
    Questions(
        'Approximately one quarter of human bones are in the feet.', true),
    Questions('A slug\'s blood is green.', true),
    Questions('Buzz Aldrin\'s mother\'s maiden name was Moon.', true),
    Questions('It is illegal to pee in the Ocean in Portugal.', true),
    Questions(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Questions(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Questions(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Questions(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Questions('Google was originally called \"Backrub\".', true),
    Questions(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Questions(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),

  ];


  // Made following methods which will only pass the answers and questions required by the main.dart file not the whole list's access.
  // by doing so we made our code more abstract and encapsulated with high security.
void nextQuestion() {
  if (_count < _questionreserve.length-1) {
   _count++;
  }
}
    String getQuestionText() {
      return _questionreserve[_count].myString;
    }
    bool getAnswer() {
      return _questionreserve[_count].myBoolean;
    }
  }



