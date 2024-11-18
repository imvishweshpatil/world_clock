import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    // Safely retrieve the arguments and handle null values
    final arguments = ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;

    if (arguments != null) {
      data = arguments;
    }

    // print(data);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: <Widget>[
              ElevatedButton.icon(
                icon: Icon(Icons.edit_location),
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                label: Text('Edit Location'),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 2.0,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 55,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}