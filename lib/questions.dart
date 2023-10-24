
//this file is used to take
class Questions {
  late String myString;
  late bool myBoolean;

  Questions( String myString, bool myBoolean) { // this is a constructor which works as transport of questions and answers
    this.myString = myString;
    this.myBoolean = myBoolean;
  }
}


//We solved the Issues of null safety and we learned the following
//1. Using late keyword helped in dealing with null-safety error
//2. Using the 'this keyword' helped in accessing the late defined instances during the runtime.

