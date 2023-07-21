import 'package:flutter/material.dart';
import 'package:weather/weather.dart';
import "package:flutter/services.dart" show rootBundle;
import "dart:convert";

enum WeatherInfState { NOT_DOWNLOADED, DOWNLOADING, FINISHED_DOWNLOADING }

class WeatherInf extends StatefulWidget {
  const WeatherInf({Key? key}) : super(key: key);
  @override
  State<WeatherInf> createState() => _WeatherInfState();
}

class _WeatherInfState extends State<WeatherInf> {
  var jsonResult;
  List _items = [];
  bool isSelected = false;
  double? _temp;
  var f;
  List _temps=[];
  List _forecasts=[];
  loadJson() async {
    String data = await rootBundle.loadString('assets/places.json');
    jsonResult = json.decode(data);
    setState(() {
      _items = jsonResult["places"];

    });
    for (var i=0;i<= _items.length;i++)
    {
      await queryWeather(_items[i]["latitude"],_items[i]["longitude"]);
      await queryForecast(_items[i]["latitude"],_items[i]["longitude"]);
      // print(_temp);
      _temps.add(_temp?.toStringAsFixed(0));
      _forecasts.add(_data);
      // _temps.add(_resultView());
      // print(_temps);
    }
    // print(jsonResult["items"][0]["image"]);
  }
  @override

  String key = '67ece18a613e33dd73d112c383456602';
  late WeatherFactory ws;
  List<Weather> _data = [];

  WeatherInfState _state = WeatherInfState.NOT_DOWNLOADED;
  // double? lat, lon;
  @override
  void initState() {
    super.initState();
    ws = new WeatherFactory(key);
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await loadJson();
    });
  }

  Future <void> queryForecast(double? lat, double? lon) async {
    /// Removes keyboard
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {
      _state = WeatherInfState.DOWNLOADING;
    });

    List<Weather> forecasts = await ws.fiveDayForecastByLocation(lat!, lon!);
    setState(() {
      _data = forecasts;
      _state = WeatherInfState.FINISHED_DOWNLOADING;
    });


  }
  Future<void> queryWeather(double? lat, double? lon) async {
    /// Removes keyboard
    FocusScope.of(context).requestFocus(FocusNode());

    setState(() {
      _state = WeatherInfState.DOWNLOADING;
    });

    Weather weather = await ws.currentWeatherByLocation(lat!, lon!);
    setState(() {
      _data = [weather];

      _temp= weather.temperature?.celsius;
      _state = WeatherInfState.FINISHED_DOWNLOADING;
    });
    // print(_temp);
  }
  Widget contentDownloading() {
    return Container(

      margin: EdgeInsets.all(25),
      child: Column(children: [
        Text(
          '',
          style: TextStyle(fontSize: 20),
        ),
        Container(
            margin: EdgeInsets.only(top: 50),
            child: Center(child: CircularProgressIndicator(strokeWidth: 10)))
      ]),
    );
  }

  Widget contentNotDownloaded() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '',
          ),
        ],
      ),
    );
  }
  Widget contentFinishedDownload() {

    return SizedBox(

        width: 400,
        child: Center(
          child: Text(_temp.toString()),
        )

    );
  }
  Widget _resultView() => _state == WeatherInfState.FINISHED_DOWNLOADING
      ? contentFinishedDownload()
      : _state == WeatherInfState.DOWNLOADING
      ? contentDownloading()
      : contentNotDownloaded();





  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WEATHER",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(

        body: Container(
          height: double.infinity,
          width:double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              // scale:0.2,
              image: AssetImage("images/clouds4.webp"),

            ),

          ),
          padding: const EdgeInsets.all(25),

          child: Column(
              children: [
                // Display the data loaded from sample.json
                _items.isNotEmpty
                    ? Expanded(
                  child: Container(
                    width:420,
                    child: ListView.builder(
                      itemExtent: 250,
                      itemCount: _items.length,
                      itemBuilder: (context, index) {

                        return Card(

                          color: Colors.transparent.withOpacity(0.0),
                          margin: const EdgeInsets.all(10),
                          child: ListTile(

                            // leading: Text(_items[index]["id"]),


                            title: Text(_items[index]["name"], textAlign: TextAlign.center, style: TextStyle(fontSize: 25),),
                            leading:index >= _temps.length? Text("...") :  Text(_temps[index].toString()+"°C", style: TextStyle(fontSize: 30),),
                            subtitle: index >= _forecasts.length? Text("...") :  Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(height:30, width: 190.0,

                                      decoration: BoxDecoration(
                                        // image: DecorationImage(
                                        //     image: AssetImage("images/clouds.jpg"),),
                                          color: Colors.black26,
                                          border: Border.all(
                                            color: Colors.black87,  // red as border color
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(5))
                                      ),

                                      child: Text(" "+_forecasts[index][0].date.toString())),
                                ),
                                Container(
                                  height: 70,
                                  width:208,
                                  child: Row(
                                      children: [Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height:50, width: 86.5,
                                          decoration: BoxDecoration(
                                              color: Colors.black26,
                                              border: Border.all(
                                                color: Colors.black87,
                                              ),
                                              borderRadius: BorderRadius.all(Radius.circular(5))
                                          ),

                                          child: Text(" MIN: "+_forecasts[index][0].tempMin.toString()),),
                                      ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                              height:50, width: 86.5,
                                              decoration: BoxDecoration(
                                                  color: Colors.black26,
                                                  border: Border.all(
                                                    color: Colors.black87,  // red as border color
                                                  ),
                                                  borderRadius: BorderRadius.all(Radius.circular(5))
                                              ),

                                              child: Text(" MAX: "+_forecasts[index][0].tempMax.toString())),
                                        ),
                                      ]
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      height:30, width: 190.0,
                                      decoration: BoxDecoration(
                                          color: Colors.black26,
                                          border: Border.all(
                                            color: Colors.black87,  // red as border color
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(5))
                                      ),

                                      child: Text(" FEELS LIKE: "+_forecasts[index][0].tempFeelsLike.toString())),
                                ),

                              ],
                            ),
                            // leading: TextButton(
                            //   child: Text(
                            //     'Fetch weather',
                            //     style: TextStyle(color: Colors.white),
                            //   ),
                            //   onPressed: ()
                            //
                            //   async {
                            //     await queryWeather(_items[index]["latitude"],_items[index]["longitude"]);
                            //   },
                            //   style: ButtonStyle(
                            //       backgroundColor: MaterialStateProperty.all(Colors.blue)),
                            // ),


                            // subtitle: Text(_temps[index].toString()),
                          ),
                        );
                      },
                    ),
                  ),
                )
                    : Container()
              ]
          ),
        ),
      ),
    );
  }
}
