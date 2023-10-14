import 'package:flutter/material.dart';


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
  List <Widget>scoreKeeper = [ //We created this list because we can use it later anywhere
    const Icon(Icons.check,
        color: Colors.green),
    const Icon(Icons.close,
      color: Colors.red,),
    const Icon(Icons.check,
        color: Colors.green),
    const Icon(Icons.close,
      color: Colors.red,),
    const Icon(Icons.check,
        color: Colors.green),
    const Icon(Icons.close,
      color: Colors.red,),
  ];
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget> [
        const SizedBox(height: 60.0),
        Expanded(
           child: Container(
             child: const Center(
               child:  Text('Question Area',
                 style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),
               ),
             ),
           ),
        ),
        const SizedBox(height: 200.9),// For question
       Expanded(
         child:  Container(
           margin: EdgeInsets.all(20.0),
         color: Colors.lightGreen,
           child:  TextButton(
             style: ButtonStyle(
               foregroundColor: MaterialStateProperty.all<Color>(Colors.white),

             ),
             onPressed: () {
               setState(() {
                 scoreKeeper.add(Icon(Icons.check,color: Colors.green),);
               });
             },
             child: const Text('True', style: TextStyle(fontSize: 24, color: Colors.white),),
           )

         ),
       ),
        //For making the true as the decesion
        Expanded(
          child:  Container(
            margin: EdgeInsets.all(20.0),
            color: Colors.red,
            child: const TextButton(
              onPressed:null,
              child:  Text(
                'False',
                style: TextStyle(fontSize: 24,color: Colors.white),
              ),
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

