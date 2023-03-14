import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {

    // receiving arguments sent from loading screen
    data  = data.isNotEmpty ? data :(ModalRoute.of(context)?.settings.arguments) as Map;

    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color? bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(bgImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/choose_location');
                      setState((){
                        data = {
                          'location': result['location'],
                          'time' : result['time'],
                          'isDaytime' : result['isDaytime'],
                          'flag' : result['flag'],
                        };
                      });
                    },
                    icon: const Icon(Icons.edit_location,
                      color: Colors.black,
                    ),
                    label: const Text(
                        'Edit Location',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    )
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: const TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Text(
                    data['time'],
                    style: const TextStyle(
                      fontSize: 66.0,
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




