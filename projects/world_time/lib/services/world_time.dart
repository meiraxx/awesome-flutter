import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  String time; // the time in that location
  String flag; // URL to an asset flag icon
  String url; // location URL for the API endpoint
  bool isDaytime; // true or false if day time or not

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    Uri urlObject;
    Response response;
    Map data;
    String datetime, offset;
    DateTime now;
    int connectionRetries = 0;

    // make the request
    urlObject = Uri.parse('https://worldtimeapi.org/api/timezone/${this.url}');
    response = await get(urlObject);

    while (response.statusCode != 200 && connectionRetries<3) {
      await Future.delayed(Duration(seconds: 1));
      print("Invalid HTTP response received (status code: ${response.statusCode}). Retrying...");
      response = await get(urlObject);
      connectionRetries++;
    }

    try {
      // convert fetched json to a map
      data = jsonDecode(response.body);
    } on FormatException catch (e) {
      // in case there is a response but it is not JSON
      print('An error was output: $e');
      this.time = 'Could not fetch data. Please try again later.';
      this.isDaytime = false;
      return;
    }


    datetime = data['datetime'];
    print(datetime);
    offset = data['utc_offset'].substring(0,3);
    print(offset);

    now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    // make a correction to seconds, since it's gonna take some time to update
    // the page the first time
    now = now.add(Duration(seconds: 1));

    // set the time property
    this.isDaytime = (now.hour > 6 && now.hour < 20) ? true : false;
    this.time = DateFormat.jms().format(now);
  }
}