import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var latitude, longitude;

  getLocation() async{
    LocationPermission permission = await Geolocator.checkPermission();

    if(permission == LocationPermission.denied){
      await Geolocator.requestPermission();
    }else if(permission == LocationPermission.deniedForever){
      await Geolocator.openLocationSettings();
    }else{
      final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      setState(() {
        latitude = position.latitude;
        longitude = position.longitude;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("latitude: $latitude", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
            SizedBox(height: 5,),
            Text("longitude: $longitude", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
            SizedBox(height: 5,),
            ElevatedButton(onPressed: (){
              getLocation();
            }, child: Text("Get Location")),

            //we need to add Geolocator package for get current location..

            // Everything is ok lets run the app

            // Please Subscribe, like my video and press bell icon to get updates of my videos on flutter

          ],
        ),
      ),
    );
  }
}


