// ignore: unused_import
import 'dart:math';


/*void main() {
  int age;
  age = 19;
  double moyenne;
  
  String nom;
  List notes = [0, 4, 6];
  Map moyennes = {1: "abalo", 'i': 180};
  print(note[2] );
  import 'dart:convert'}
*/
void main() {
  print(isBinary("101001100010390"));

}

bool isBinary(String binary){
  for(int i=0;i<binary.length;i++){
  if (binary[i]== "0" || binary[i]=="1"){
      continue;
    }else{
      return false;
    }


  }
  return true;
}
  