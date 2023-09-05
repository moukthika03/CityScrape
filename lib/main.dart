import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'places.dart';
import 'bookings.dart';
import 'weather.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
int imageIndex=0;

String imageFile="";
// const paymentItems = [
//   PaymentItem(
//     label: 'Total',
//     amount: '99.99',
//     status: PaymentItemStatus.final_price,
//   )
// ];


void main() {
  runApp(MyApp());
}
TextEditingController nameController = TextEditingController();
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cityscrape",
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: MainLayout(),),

    );
  }
}
// class SecondRoute extends StatefulWidget {
//   const SecondRoute({Key? key}) : super(key: key);
//
//   @override
//   State<SecondRoute> createState() => _SecondRouteState();
// }
//
// class _SecondRouteState extends State<SecondRoute> {
//   @override
//   Widget build(BuildContext context) {
//     void onGooglePayResult(paymentResult) {
//       // Send the resulting Google Pay token to your server / PSP
//       debugPrint(paymentResult.toString());
//     }
//     return Scaffold(
//       appBar: AppBar(
//           title: const Text('Payment'),
//           backgroundColor: Colors.teal
//       ),
//
//       body: Center(
//         child: GooglePayButton(
//           paymentConfigurationAsset: 'gpay.json',
//           paymentItems: paymentItems,
//           style: GooglePayButtonStyle.black,
//           type: GooglePayButtonType.pay,
//           margin: const EdgeInsets.only(top: 15.0),
//           onPaymentResult: onGooglePayResult,
//           loadingIndicator: const Center(
//             child: CircularProgressIndicator(),
//           ),
//           width:250,
//           height:60,
//
//         ),
//
//       ),
//     );
//   }
// }
class Hotel extends StatefulWidget {
  const Hotel({Key? key}) : super(key: key);

  @override
  State<Hotel> createState() => _HotelState();
}

class _HotelState extends State<Hotel> {
  int likes=0;
  int likes1=0;
  int likes2=0;
  int likes3=0;
  int likes4=0;
  int likes5=0;
  int likes6=0;
  int likes7=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
       body:SingleChildScrollView(
         child: Column(
           children: <Widget>[
             Container(
               child: Image(
                   image: AssetImage(
                       "images/2.jpg"
                   ),
               ),
             ),
             SizedBox(height: 10),
             Row(
               children: [
                 SizedBox(width: 90),
                 RaisedButton(
                   disabledColor: Colors.black54,
                   disabledTextColor: Colors.white,
                   onPressed: (){
                        setState((){likes= likes+1;});
                   },
                   child: Row(
                     children: [
                       Icon(Icons.favorite,
                       color: Colors.red,),
                       SizedBox(width: 5),
                       Text(likes.toString(),style: TextStyle(fontSize:18)),
                     ],
                   ),
                 ),
                 SizedBox(width: 20),
                 RaisedButton(
                   disabledColor: Colors.black54,
                   disabledTextColor: Colors.white,
                    onPressed: (){
                     setState(() {
                       imageFile="images/2.jpg";
                     });
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InfoBook()),
                    );
                    },
                   child: Text('Book Now'),
                 ),
               ],
             ),
             SizedBox(height: 20),
             Container(
               child: Image(
                 image: AssetImage(
                     "images/1.jpg"
                 ),
               ),
             ),
             SizedBox(height: 10),
             Row(
               children: [
                 SizedBox(width: 90),
                 RaisedButton(
                   disabledColor: Colors.black54,
                   disabledTextColor: Colors.white,
                    onPressed: (){
                    setState((){likes1= likes1+1;});
                    },
                    child: Row(
                    children: [
                    Icon(Icons.favorite,
                    color: Colors.red,),
                    SizedBox(width: 5),
                    Text(likes1.toString(),style: TextStyle(fontSize:18)),
                    ],
                 ),
                 ),
                 SizedBox(width: 20),
                 RaisedButton(
                   disabledColor: Colors.black54,
                   disabledTextColor: Colors.white,
                   onPressed: (){
                     setState(() {
                       imageFile="images/1.jpg";
                     });
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => InfoBook()),
                     );
                   },
                   child: Text('Book Now'),
                 ),
               ],
             ),
             SizedBox(height: 20),
             Container(
               child: Image(
                 image: AssetImage(
                     "images/3.jpg"
                 ),
               ),
             ),
             SizedBox(height: 10),
             Row(
               children: [
                 SizedBox(width: 90),
                 RaisedButton(
                   disabledColor: Colors.black54,
                   disabledTextColor: Colors.white,
                   onPressed: (){
                     setState((){likes2= likes2+1;});
                   },
                   child: Row(
                     children: [
                       Icon(Icons.favorite,
                         color: Colors.red,),
                       SizedBox(width: 5),
                       Text(likes2.toString(),style: TextStyle(fontSize:18)),
                     ],
                   ),
                 ),
                 SizedBox(width: 20),
                 RaisedButton(
                   disabledColor: Colors.black54,
                   disabledTextColor: Colors.white,
                   onPressed: (){
                     setState(() {
                       imageFile="images/3.jpg";
                     });
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => InfoBook()),
                     );
                   },
                   child: Text('Book Now'),
                 ),
               ],
             ),
             SizedBox(height: 20),
             Container(
               child: Image(
                 image: AssetImage(
                     "images/4.jpg"
                 ),
               ),
             ),
             SizedBox(height: 10),
             Row(
               children: [
                 SizedBox(width: 90),
                 RaisedButton(
                   disabledColor: Colors.black54,
                   disabledTextColor: Colors.white,
                   onPressed: (){
                     setState((){likes3= likes3+1;});
                   },
                   child: Row(
                     children: [
                       Icon(Icons.favorite,
                         color: Colors.red,),
                       SizedBox(width: 5),
                       Text(likes3.toString(),style: TextStyle(fontSize:18)),
                     ],
                   ),
                 ),
                 SizedBox(width: 20),
                 RaisedButton(
                   disabledColor: Colors.black54,
                   disabledTextColor: Colors.white,
                   onPressed: (){
                     setState(() {
                       imageFile="images/4.jpg";
                     });
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => InfoBook()),
                     );
                   },
                   child: Text('Book Now'),
                 ),
               ],
             ),
             SizedBox(height: 20),
             Container(
               child: Image(
                 image: AssetImage(
                     "images/5.jpg"
                 ),
               ),
             ),
             SizedBox(height: 10),
             Row(
               children: [
                 SizedBox(width: 90),
                 RaisedButton(
                   disabledColor: Colors.black54,
                   disabledTextColor: Colors.white,
                   onPressed: (){
                     setState((){likes4= likes4+1;});
                   },
                   child: Row(
                     children: [
                       Icon(Icons.favorite,
                         color: Colors.red,),
                       SizedBox(width: 5),
                       Text(likes4.toString(),style: TextStyle(fontSize:18)),
                     ],
                   ),
                 ),
                 SizedBox(width: 20),
                 RaisedButton(
                   disabledColor: Colors.black54,
                   disabledTextColor: Colors.white,
                   onPressed: (){
                     setState(() {
                       imageFile="images/5.jpg";
                     });
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => InfoBook()),
                     );
                   },
                   child: Text('Book Now'),
                 ),
               ],
             ),
             SizedBox(height: 20),
             Container(
               child: Image(
                 image: AssetImage(
                     "images/6.jpg"
                 ),
               ),
             ),
             SizedBox(height: 10),
             Row(
               children: [
                 SizedBox(width: 90),
                 RaisedButton(
                   disabledColor: Colors.black54,
                   disabledTextColor: Colors.white,
                   onPressed: (){
                     setState((){likes5= likes5+1;});
                   },
                   child: Row(
                     children: [
                       Icon(Icons.favorite,
                         color: Colors.red,),
                       SizedBox(width: 5),
                       Text(likes5.toString(),style: TextStyle(fontSize:18)),
                     ],
                   ),
                 ),
                 SizedBox(width: 20),
                 RaisedButton(
                   disabledColor: Colors.black54,
                   disabledTextColor: Colors.white,
                   onPressed: (){
                     setState(() {
                       imageFile="images/7.jpg";
                     });
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => InfoBook()),
                     );
                   },
                   child: Text('Book Now'),
                 ),
               ],
             ),
             SizedBox(height: 20),
             Container(
               child: Image(
                 image: AssetImage(
                     "images/7.jpg"
                 ),
               ),
             ),
             SizedBox(height: 10),
             Row(
               children: [
                 SizedBox(width: 90),
                 RaisedButton(
                   disabledColor: Colors.black54,
                   disabledTextColor: Colors.white,
                   onPressed: (){
                     setState((){likes6= likes6+1;});
                   },
                   child: Row(
                     children: [
                       Icon(Icons.favorite,
                         color: Colors.red,),
                       SizedBox(width: 5),
                       Text(likes6.toString(),style: TextStyle(fontSize:18)),
                     ],
                   ),
                 ),
                 SizedBox(width: 20),
                 RaisedButton(
                   disabledColor: Colors.black54,
                   disabledTextColor: Colors.white,
                   onPressed: (){
                     setState(() {
                       imageFile="images/7.jpg";
                     });
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => InfoBook()),
                     );
                   },
                   child: Text('Book Now'),
                 ),
               ],
             ),
             SizedBox(height:10),
    ]
    ),
       )
    );
  }
}


final city=['chennai','madurai','rameshwaram','thanjavur'];

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex=0;
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  
  static const List<Widget> _pages=<Widget>[
    HomePage(),
    WeatherInf(),
    Hotel(),
    // Location(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:false ,
      appBar: AppBar(
        title: Text('Cityscrape'),

      ),
      body:Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      drawer:Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Cityscrape'),
              accountEmail: Text('Cityscrape@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("TP"),
              ),
            ),
            ListTile(
              title:Text('9025036068') ,
              leading: Icon(Icons.phone),
            ),
            ListTile(
              title:Text('www.tourplanners.com') ,
              leading: Icon(Icons.account_circle_rounded),
            ),
            ListTile(
              title:Text('Tourplanners123') ,
              leading: Icon(Icons.favorite),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black54,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon:Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Weather",
            icon:Icon(Icons.cloud),
          ),
          BottomNavigationBarItem(
            label: "Hotels",
            icon:Icon(Icons.hotel),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.0),
        child: Container(
          color: Theme.of(context).primaryColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                TextField(
                  controller: nameController,
                  onSubmitted: (value) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => InfoRoute()),
                        );
                  },
                  decoration: InputDecoration(
                    // prefixIcon: Icon(Icons.search, size: 18),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.blueGrey,
                      size: 20.0,
                    ),

                    border: OutlineInputBorder(
                      // borderSide: BorderSide(color: Colors.purple),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Enter the City',
                  ),
                ),

                SizedBox(height: 80),
               Center(
                  child: Text(
                    'Natural Treasures',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                ),
                SizedBox(height: 10),
                  SingleChildScrollView(
                    child:
                  Container(
                    height: 300,
                    child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: false,
                    ),
                      items: [
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width:1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            image: new DecorationImage(image: new AssetImage('images/ooty.jpg'), fit: BoxFit.fill,),

                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width:1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            image: new DecorationImage(image: new AssetImage('images/hogenakkal.jpeg'), fit: BoxFit.fill,),
                          ),
                          // child:  Image.asset('images/hogenakkal.jpeg'),
                        ),
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width:1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            image: new DecorationImage(image: new AssetImage('images/marinabeach.jpeg'), fit: BoxFit.fill,),

                          ),
                          // child:   Image.asset('images/marinabeach.jpeg')
                        ),
                      ],
                    ),
                  ),
                  ),

                SizedBox(height: 40),

                Center(
                  child: Text(
                    'Favourites',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  child:
                  Container(
                    height: 300,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: false,
                      ),
                      items: [
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width:1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            image: new DecorationImage(image: new AssetImage('images/temple.jpeg'), fit: BoxFit.fill,),

                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width:1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            image: new DecorationImage(image: new AssetImage('images/hogenakkal.jpeg'), fit: BoxFit.fill,),
                          ),
                          // child:  Image.asset('images/10.jpg'),
                        ),
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width:1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            image: new DecorationImage(image: new AssetImage('images/marinabeach.jpeg'), fit: BoxFit.fill,),

                          ),
                          // child:   Image.asset('images/20.jpg')
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 40),
                Center(
                  child: Text(
                    'Archives',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  child:
                  Container(
                    height: 300,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: false,
                      ),
                      items: [
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width:1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            image: new DecorationImage(image: new AssetImage('images/18.jpg'), fit: BoxFit.fill,),

                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width:1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            image: new DecorationImage(image: new AssetImage('images/19.jpg'), fit: BoxFit.fill,),
                          ),
                          // child:  Image.asset('images/19.jpeg'),
                        ),
                        Container(
                          margin: EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width:1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            image: new DecorationImage(image: new AssetImage('images/20.jpg'), fit: BoxFit.fill,),

                          ),
                          // child:   Image.asset('images/20.jpeg')
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      );

  }
}
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(nameController.text),

    );
  }
}