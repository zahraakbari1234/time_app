import 'package:flutter/material.dart';
import 'package:time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {


  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

   static const spinkit = SpinKitRotatingCircle(
    color: Colors.red,
    size: 50.0,
  );

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime' : instance.isDaytime,

    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body:  Center(
            child: spinkit,
        )
    );
  }
}

