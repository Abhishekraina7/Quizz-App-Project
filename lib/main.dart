
import 'package:flutter/material.dart';
import 'quizzbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


void main() {
runApp(const Quizzler());

}

class Quizzler extends StatelessWidget { // here the word extends is used to inherit all the properties of statelessWidget
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
   backgroundColor: Colors.black,
body: SafeArea(
    child: QuizPage(),
        ),
        ,
      ),
    );
  }
}
class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List <Widget>scoreKeeper = []; //We created this list because we can use it later anywher
  Quizzbrain brain = Quizzbrain(); // So this a object that I used to get the questions and answers from the quizzbrain file.
  // this helps in keeping the track of question number


void checkAnswer(bool userPickedAnswer) //this function is used to keep in check wheather you have reached the end or not
{
  bool correctAnswer =brain.getAnswer();
  setState(() {

if(brain.theEnd() == true)  //if list has ended then we reset the list and shows alert pop message
  {
    // Alert(context: context,
    //     title: "Finished",
    //     desc: "All the question are attempted").show();
  Alert(
    context: context,
    type: AlertType.warning,
    title: "Finished",
    desc: "No more questions",
    buttons: [
      DialogButton(
        child: Text(
          "RESET",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        width: 120,
      )
    ],
  ).show();

    brain.reset(); //reseted the list of questions
    scoreKeeper = []; // rested the scorekeeper list to zero displaying a blank question
  }
else{
  if(userPickedAnswer == correctAnswer)
    {
      scoreKeeper.add(const Icon(
        Icons.check,
        color: Colors.green,
      ));
    } else {
    scoreKeeper.add(const Icon(
      Icons.close,
      color: Colors.red,
    ));
  }
  brain.nextQuestion();
}
  });
}

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget> [
        const SizedBox(height: 100.0),
        Expanded(//The Question Area
           child: Container(
             child:  Center(
               child:  Text(

                brain.getQuestionText(), //Ask why here
                 //We are simply providing text widget with a string argument\
                 style:
                 const TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold,color: Colors.white),
               ),
             ),
           ),
        ),
        const SizedBox(height: 200.9),// For question
       Expanded(
         child:  Container(
           margin: const EdgeInsets.all(20.0),
         color: Colors.lightGreen,
           child:  TextButton(
             style: ButtonStyle(
               foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
             ),
             onPressed: () {
              checkAnswer(true);

               // setState(() {
               //
               //   if(correctAns == true)
               //     {
               //   scoreKeeper.add(const Icon(Icons.check,color: Colors.green),);}
               //   else{
               //     scoreKeeper.add(const Icon(Icons.close,color: Colors.red),);
               //   }
               //   brain.nextQuestion();
               //
               // });
             },
             child: const Text('True', style: TextStyle(fontSize: 24, color: Colors.white),),
           )

         ),
       ),
        //For making the true as the decesion
        Expanded(
          child:  Container(
            margin: const EdgeInsets.all(20.0),
            color: Colors.red,
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
               checkAnswer(false);
                // setState(() {
                //
                //   if(correctAns == true)
                //   {
                //     scoreKeeper.add(const Icon(Icons.check,color: Colors.green),);}
                //   else{
                //     scoreKeeper.add(const Icon(Icons.close,color: Colors.red),);
                //   }
                //   brain.nextQuestion();
                //
                //
                // });
              },
              child: const Text('False', style: TextStyle(fontSize: 24, color: Colors.white),),
            ),
          ),
        ),//For making the false as the decesion
      //TODO: Add a row here below the coloumn as the score keeper
        Row(
          children: scoreKeeper,
        ),

      ],

    );
  }
}

