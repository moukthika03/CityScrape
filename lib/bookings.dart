import "package:flutter/material.dart";
import 'package:pay/pay.dart';

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

const _paymentItems = [
  PaymentItem(
    label: 'Total',
    amount: '99.99',
    status: PaymentItemStatus.final_price,
  )
];

class _InfoBookState extends State<InfoBook> {
  String? selectedValue;
  String size ="";
  int _qty = 0;
  int days = 0;
  int price = 0;
  int fp = 0;
  String msg = "Calculate prices";

  void onGooglePayResult(paymentResult) {
    // Send the resulting Google Pay token to your server / PSP
    debugPrint(paymentResult.toString());
  }

  void calculate()
  {
    setState(() {
      fp= _qty*price*days;
      msg = fp.toString()+" Rs ";
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
      size='Single Room';
      price=2000;
    });
  }

  void changeS()
  {
    setState((){
      size='Double Room';
      price=3500;
    });
  }
  void changeM()
  {
    setState((){
      size='Suit Room';
      price=1000;
    });
  }
  void changeL()
  {
    setState((){
      size='Double Room AC';
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

            SizedBox(height: 40),
            Container(
              width: 700,
              height: 1000,
              margin: new EdgeInsets.symmetric(horizontal: 20.0) ,
              decoration: BoxDecoration(
                  // gradient: LinearGradient(
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomCenter,
                  //   colors: [Colors.deepPurpleAccent, Colors.purple],
                  // ),
                  border: Border.all(
                    width:1,
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child:  Column(
                children: [
                  SizedBox(height: 20),
                  Row(
                    children:<Widget>[
                      SizedBox(width: 20),
                      Text('Room Type :',style:TextStyle(
                        fontSize: 20,
                        fontFamily:'BeauRivage',
                        color: Colors.white,
                      ),
                      ),
                      Text(' $size',style:TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily:'BeauRivage',
                        color: Colors.white,
                      ),),

                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      MaterialButton(
                        color: Colors.deepPurple,
                        minWidth: 10,
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white54, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        onPressed: () {
                          changeXS();
                        },
                        child: Text(
                          'SR',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 15),
                      MaterialButton(
                        color: Colors.lightBlueAccent,
                        minWidth: 10,
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white54, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        onPressed: () {
                          changeS();
                        },
                        child: Text(
                          'DR',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 15),
                      MaterialButton(
                        color: Colors.pink,
                        minWidth: 10,
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white54, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        onPressed: () {
                          changeM();
                        },
                        child: Text(
                          'SUR',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 15),
                      MaterialButton(
                        color: Colors.deepOrangeAccent,
                        minWidth: 10,
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white54, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
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
                  SizedBox(height: 40,),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Text('No of persons :',style:TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily:'BeauRivage',
                        color: Colors.white,
                      ),
                      ),
                    ],
                  ),
                  SizedBox(height:10),
                  Row(
                    children:<Widget>[
                      SizedBox(width: 20),
                      RaisedButton(
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white54, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Text('-'),
                        onPressed: () {
                          clickn();
                        },
                      ),
                      SizedBox(width: 10),
                      Text('$_qty'),
                      SizedBox(width: 10),
                      RaisedButton(
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white54, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Text('+'),
                        onPressed: () {
                          click();
                        },
                      ),

                    ],
                  ),

                  SizedBox(height: 40,),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      Text('No of days :',style:TextStyle(
                        fontSize: 20,
                        fontFamily:'BeauRivage',
                        color: Colors.white,
                      ),
                      ),
                    ],
                  ),
                  SizedBox(height:10),
                  Row(
                    children:<Widget>[
                      SizedBox(width: 20),
                      RaisedButton(
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white54, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Text('-'),
                        onPressed: () {
                          dayn();
                        },
                      ),
                      SizedBox(width: 10),
                      Text('$days'),
                      SizedBox(width: 10),
                      RaisedButton(
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white54, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Text('+'),
                        onPressed: () {
                          dayp();
                        },
                      ),

                      // SizedBox(height: 100),


                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(width: 20,),
                      Text('Check in date:- ',style:TextStyle(
                        fontSize: 20,
                        fontFamily:'BeauRivage',
                        color: Colors.white,
                      ),),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      SizedBox(
                        width: 60,
                        height: 40,
                        child: TextField(
                          // controller: name,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: 'DD',
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      SizedBox(
                        width: 60,
                        height: 40,
                        child: TextField(
                          // controller: name,
                          decoration: InputDecoration(
                            // prefixIcon: Icon(Icons.search, size: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: 'MM',
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      SizedBox(
                        width:100,
                        height: 40,
                        child: TextField(
                          // controller: name,
                          decoration: InputDecoration(
                            // prefixIcon: Icon(Icons.search, size: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: 'YYYY',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 80),
                  Row(
                    children: [
                      SizedBox(width: 20),

                      SizedBox(
                        width: 300,
                        height:80,
                        child: RaisedButton(
                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white54, width: 1),
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Text('$msg'),
                            onPressed:(){
                              calculate();
                            }),
                      ),

                      // GooglePayButton(
                      //   paymentConfigurationAsset: ("assets/gpay.json"),
                      //   paymentItems: _paymentItems,
                      //   type: GooglePayButtonType.pay,
                      //   margin: const EdgeInsets.only(top: 15.0),
                      //   onPaymentResult: onGooglePayResult,
                      //   loadingIndicator: const Center(
                      //     child: CircularProgressIndicator(),
                      //   ),
                      // ),

                    ],
                  ),
                  Center(
                    child: GooglePayButton(
                      paymentConfigurationAsset: 'gpay.json',
                      paymentItems: _paymentItems,
                      // style: GooglePayButtonStyle.black,
                      type: GooglePayButtonType.pay,
                      margin: const EdgeInsets.only(top: 15.0),
                      onPaymentResult: onGooglePayResult,
                      loadingIndicator: const Center(
                        child: CircularProgressIndicator(),
                      ),
                      width:250,
                      height:60,

                    ),

                  ),
                ],

              ),
            ),
          ],
        ),
      ),
    );
  }
}
