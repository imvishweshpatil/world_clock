import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for UI
  String time = ''; // the time in that location
  String flag; // url to an asset flag icon
  String url; // location url for API endpoint

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      // Make the request
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));

      // Check if the request was successful
      if (response.statusCode == 200) {
        Map data = jsonDecode(response.body);

        // Get properties from JSON
        String datetime = data['datetime'];
        String offset = data['utc_offset'].substring(1, 3);

        // Create DateTime object
        DateTime now = DateTime.parse(datetime);
        now = now.add(Duration(hours: int.parse(offset)));

        // Set the time property
        time = DateFormat.jm().format(now);
        print('Time fetched successfully: $time');
      } else {
        // Print the response body when the request fails
        print('Error: Failed to fetch time data.');
        print('Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');
        time = 'could not get the time data';
      }
    } catch (e) {
      // Catch any other errors (e.g., network issues)
      print('Caught error: $e');
      time = 'could not get the time data';
    }
  }
}
