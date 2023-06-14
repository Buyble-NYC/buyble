import 'package:intl/intl.dart';

class Util{



  static String numToDol( String price ){
    var f = NumberFormat("###.0#", "en_US");
    if( price == "Free" || price == "무료나눔"){
      return price;
    }else{
      return "${f.format(int.parse(price))} \$";
    }
  }

  String descriptionConverter( String description){
    String output = "";
    String temp;
    int cutoff = 50;
    if(description.length >= cutoff ){
      temp = description;
      while( temp.length >= cutoff){
        output += "${temp.substring(0, cutoff)} \n ";
        temp = temp.substring(cutoff, temp.length);
      }
      output += temp;
    }

    return output;

  }

}