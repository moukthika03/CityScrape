import "package:flutter/material.dart";
import "package:flutter/services.dart" show rootBundle;
import "dart:convert";
import "main.dart";
import 'package:dropdown_button2/dropdown_button2.dart';

TextEditingController name = TextEditingController();
class InfoBook extends StatefulWidget {
  const InfoBook({Key? key}) : super(key: key);

  @override
  State<InfoBook> createState() => _InfoBookState();
}

class _InfoBookState extends State<InfoBook> {
  String? selectedValue;
  String size="SR";
  int _qty=0;
  int days=0;
  int price=1499;
  int fp=0;
  void calculate()
  {
    setState(() {
      fp=_qty*price*days;
    });
  }
  void dayp()
  {
    setState(() {
      days+=1;
    });
  }
  void dayn()
  {
    setState(() {
      days-=1;
    });
  }
  void click()
  {
    setState(() {
      _qty+=1;
    });
  }
  void clickn()
  {
    setState(() {
      if(_qty>0) {
        _qty -= 1;
      }
    });
  }
  void changeXS()
  {
    setState(() {
      size='SingleRoom';
      price=2000;
    });
  }
  void changeS()
  {
    setState((){
      size='DoubleRoom';
      price=3500;
    });
  }
  void changeM()
  {
    setState((){
      size='SuitRoom';
      price=1000;
    });
  }
  void changeL()
  {
    setState((){
      size='DoubleRoomAc';
      price=4000;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Bookings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              child: Image(
                image: AssetImage(
                   imageFile
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children:<Widget>[
                SizedBox(width: 20),
                Text('Rooms :',style:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  fontFamily:'BeauRivage',
                  color: Colors.blue,
                ),
                ),
                Text('$size',style:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 27,
                  fontFamily:'BeauRivage',
                  color: Colors.blue,
                ),),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                MaterialButton(
                  color: Colors.blue,
                  shape: const CircleBorder(),
                  onPressed: () {
                    changeXS();
                  },
                  child: Text(
                    'SR',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MaterialButton(
                  color: Colors.blue,
                  shape: const CircleBorder(),
                  onPressed: () {
                    changeS();
                  },
                  child: Text(
                    'DR',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MaterialButton(
                  color: Colors.blue,
                  shape: const CircleBorder(),
                  onPressed: () {
                    changeM();
                  },
                  child: Text(
                    'SUR',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MaterialButton(
                  color: Colors.blue,
                  shape: const CircleBorder(),
                  onPressed: () {
                    changeL();
                  },
                  child: Text(
                    'DLA',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 10),
                Text('No of persons :',style:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  fontFamily:'BeauRivage',
                  color: Colors.blue,
                ),
                ),
                Text('$_qty',style:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 29,
                  fontFamily:'BeauRivage',
                  color: Colors.blue,
                ),),
              ],
            ),
            SizedBox(height:10),
            Row(
              children:<Widget>[
                SizedBox(width: 30),
                RaisedButton(
                  child: Text('-'),
                  onPressed: () {
                    clickn();
                  },
                ),
                SizedBox(width: 10),
                Text('$_qty'),
                SizedBox(width: 10),
                RaisedButton(
                  child: Text('+'),
                  onPressed: () {
                    click();
                  },
                ),
              ],
            ),

            Row(
              children: [
                SizedBox(width: 10),
                Text('No of days :',style:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  fontFamily:'BeauRivage',
                  color: Colors.blue,
                ),
                ),
                Text('$days',style:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 29,
                  fontFamily:'BeauRivage',
                  color: Colors.blue,
                ),),
              ],
            ),
            SizedBox(height:10),
            Row(
              children:<Widget>[
                SizedBox(width: 30),
                RaisedButton(
                  child: Text('-'),
                  onPressed: () {
                    dayn();
                  },
                ),
                SizedBox(width: 10),
                Text('$days'),
                SizedBox(width: 10),
                RaisedButton(
                  child: Text('+'),
                  onPressed: () {
                    dayp();
                  },
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 20),
                Text('Price :',style:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontFamily:'BeauRivage',
                  color: Colors.blue,
                ),),
                Text('$fp',style:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 29,
                  fontFamily:'BeauRivage',
                  color: Colors.blue,
                ),),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 30),
                RaisedButton(
                    child: Text('Calculate'),
                    onPressed:(){
                      calculate();
                    }),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('DATE',style:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  fontFamily:'BeauRivage',
                  color: Colors.blue,
                ),),
              ],
            ),
            TextField(
              controller: name,
              decoration: InputDecoration(
                // prefixIcon: Icon(Icons.search, size: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Enter the Date',
              ),
            ),
            RaisedButton(
              color: Colors.blue,
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SecondRoute()),
                // );
              },
              child: Text(
                'Pay',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
