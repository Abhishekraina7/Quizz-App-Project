import 'package:flutter/material.dart';
import 'quizzbrain.dart';


void main() {
runApp(const Quizzler());

}

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
    child: QuizPage(),
        ),
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

 //TODO: You need to understand why I created a separte class and used it to shorten the code


  int count = 0; // this helps in keeping the track of question number

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
                brain.questionreserve[count].myString, //Ask why here
                 //We are simply providing text widget with a string argument
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
               bool correctAns = brain.questionreserve[count].myBoolean;
               setState(() {
                 count++;
                 if(correctAns == true)
                   {
                 scoreKeeper.add(const Icon(Icons.check,color: Colors.green),);}
                 else{
                   scoreKeeper.add(const Icon(Icons.close,color: Colors.red),);
                 }

               });
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
                bool correctAns = brain.questionreserve[count].myBoolean;
                setState(() {
                  count++;
                  if(correctAns == true)
                  {
                    scoreKeeper.add(const Icon(Icons.check,color: Colors.green),);}
                  else{
                    scoreKeeper.add(const Icon(Icons.close,color: Colors.red),);
                  }


                });
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

