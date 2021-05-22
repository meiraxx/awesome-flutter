import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  DateTime lastNow, newNow;
  Duration lastTimeElapsed = Duration(seconds: 0);
  String lastLocation;
  String timeFormatOption = 'minutes';
  String timeFormatButtonText = 'Show seconds';
  IconData timeFormatButtonIcon = Icons.remove_red_eye_outlined;

  @override
  Widget build(BuildContext context) {
    data = (data.isEmpty) ? ModalRoute.of(context).settings.arguments : data;
    lastLocation = (lastLocation==null) ? data['location'] : lastLocation;

    // continuously update clock, in a slightly incorrect way
    final correctedDuration = Duration(seconds: 1);
    Timer(correctedDuration, () {
      setState(() {
        DateTime realNow = DateTime.now();
        lastTimeElapsed =
        (lastNow == null) ? Duration(seconds: 0) : realNow.difference(
            lastNow);

        newNow = (newNow == null || lastLocation != data['location'])
            ? DateFormat.jms().parse(data['time'])
            : newNow.add(lastTimeElapsed);


        bool newIsDaytime = (newNow.hour > 6 && newNow.hour < 20)
            ? true
            : false;

        // update data
        data['time'] = DateFormat.jms().format(newNow);
        data['isDaytime'] = newIsDaytime;

        // defining last variables
        lastNow = realNow;
        lastLocation = data['location'];
      });
    });

    /*
    // Timer.periodic
    Timer.periodic(duration, (timer) {
      // Stop the timer when it matches a condition
      if (timer.tick >= 10) {
        timer.cancel();
      }

      print('Tick: ${timer.tick}');
      setState(() {
        data['time'] = data['time'];
        print(DateFormat.jm().parse(data['time']));
      });
    });
    */

    // set background
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[800];
    Map timeFormats = {
      'seconds': data['time'],
      'minutes': DateFormat.jm().format(DateFormat.jms().parse(data['time'])),
    };

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = (result!=null) ? {
                          'location': result['location'],
                          'flag': result['flag'],
                          'time': result['time'],
                          'isDaytime': result['isDaytime'],
                        } : data;
                      });
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[300],
                    ),
                    label: Text(
                      "Edit location",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[300],
                      ),
                    )),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/${data['flag']}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 0.0, 0.0),
                      child: Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  //DateFormat.jm().format(DateFormat.jms().parse(data['time'])),
                  //data['time'],
                  timeFormats[timeFormatOption],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10.0),
                TextButton.icon(
                  label: Text(
                    timeFormatButtonText,
                  ),
                  style: TextButton.styleFrom(
                    primary: Colors.grey[300],
                  ),
                  onPressed: () {
                    setState(() {
                      if (timeFormatOption == 'seconds') {
                        timeFormatOption = 'minutes';
                        timeFormatButtonText = 'Show seconds';
                        timeFormatButtonIcon = Icons.visibility_outlined;
                      } else if (timeFormatOption == 'minutes') {
                        timeFormatOption = 'seconds';
                        timeFormatButtonText = 'Hide seconds';
                        timeFormatButtonIcon = Icons.visibility_off_outlined;
                      }
                    });
                  },
                  icon: Icon(
                    timeFormatButtonIcon,
                  ),
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}
