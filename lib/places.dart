import "package:flutter/material.dart";
import "package:flutter/services.dart" show rootBundle;
import "dart:convert";
import "main.dart";

class InfoRoute extends StatefulWidget {
  const InfoRoute({Key? key}) : super(key: key);

  @override
  State<InfoRoute> createState() => _InfoRouteState();
// final String place= place;
}

class _InfoRouteState extends State<InfoRoute> {

  var jsonResult;
  List _items = [];
  loadJson() async {
    String data = await rootBundle.loadString('assets/places.json');
    jsonResult = json.decode(data);
    setState(() {
      _items = jsonResult["places"].where((element) => element["name"] == nameController.text).toList();
    });
    // print(jsonResult["items"][0]["image"]);
  }
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await loadJson();
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title:Text('Top Places'),
        // backgroundColor: Colors.teal
      ),

      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
            children: [
              // Display the data loaded from sample.json
              _items.isNotEmpty
                  ? Expanded(
                child: ListView.builder(
                  itemExtent: 450,
                  itemCount: _items.length,
                  itemBuilder: (context, index) {

                    return Card(

                      color: Colors.lightBlueAccent,
                      margin: const EdgeInsets.all(10),
                      child: ListTile(

                        // leading: Text(_items[index]["id"]),

                        title: Text(_items[index]["name"], textAlign: TextAlign.center,),
                        subtitle:Column(
                          children: [
                            Text(""),
                            Text(_items[index]["topPlaces"], textAlign: TextAlign.center,),
                            Text(""),
                            Text(_items[index]["topPlace2"], textAlign: TextAlign.center,),
                            Text(""),
                            Text(_items[index]["topPlace3"], textAlign: TextAlign.center,),
                            Text(""),
                            Text(_items[index]["topPlace4"], textAlign: TextAlign.center,),
                            Text(""),
                            Text(_items[index]["topPlace5"], textAlign: TextAlign.center,),
                            Text(""),
                            Text(_items[index]["topPlace6"], textAlign: TextAlign.center,),
                            Text(""),
                            Text(_items[index]["topPlace7"], textAlign: TextAlign.center,),
                            Text(""),
                            Text(_items[index]["topPlace8"], textAlign: TextAlign.center,),
                            Text(""),
                            Text(_items[index]["topPlace9"], textAlign: TextAlign.center,),
                            Text(""),
                            Text(_items[index]["topPlace10"], textAlign: TextAlign.center,),
                            Text(""),
                          ],
                        ),
                        leading:Container(
                          decoration: BoxDecoration(
                            // image: DecorationImage(
                            //     image: AssetImage(_items[index]["image"]),
                            //
                            //     fit: BoxFit.fitWidth
                            //
                            // )
                          ),
                          child: Image.asset(_items[index]["image"], fit: BoxFit.cover,),
                        ),
                      ),
                    );
                  },
                ),
              )
                  : Container()
            ]

        ),
      ),
    );
  }
}