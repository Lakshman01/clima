import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {

  LocationScreen(this.weatherData);

  final weatherData;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  String sourceName = '';
  String srcDescription = '';
  String tableID = '';

  @override
  void initState() {
    super.initState();

    dynamic tempData = widget.weatherData;

    updateUI(tempData);
  }

  void updateUI(dynamic inputData){

    sourceName = inputData['source'][0]['annotations']['source_name'];
    srcDescription = inputData['source'][0]['annotations']['source_description'];
    tableID = inputData['source'][0]['annotations']['table_id'];

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(sourceName, style: TextStyle(fontSize: 22.0),),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.location_city),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Enter your location',
                  hintStyle: TextStyle(color: Colors.grey),
                  ),
                cursorColor: Colors.black12,
                onChanged: (value){
                  print(value);
                },
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(srcDescription,style: TextStyle(fontSize: 30.0),),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(tableID,style: TextStyle(fontSize: 10.0),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//
