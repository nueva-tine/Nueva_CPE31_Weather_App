import 'package:weather_app_nueva/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_nueva/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: SpinKitWaveSpinner(
            size: 100.0,
            color: Colors.greenAccent,
          )),
    );
  }


  void getWeatherData() async {
    Networking networking = new Networking();
    String data = await networking.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(data);
    }));
  }
}
