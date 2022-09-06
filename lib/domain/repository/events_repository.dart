import 'package:dio/dio.dart';
import 'dart:convert';

import '../models/event.dart';
import '../models/upcoming_events.dart';
import '../network/requests/events_request.dart';
import '../network/end_points.dart';
import '../network/requests/upcoming_events_request.dart';
import '../network/responses/events_response.dart';
import '../network/responses/upcoming_events_response.dart';
import '../remote/dio_helper.dart';

class EventsRepository {
  Future<List<Event>> getEvents() async {
    try {
      Response response = await DioHelper.getData(url: epGetEvents, query: {});

      if (response.statusCode == 200) {
        EventsResponse eventsResponse = EventsResponse.fromJson(response.data);
        return eventsResponse.events;
      }
      print("Get Events: statusCode = ${response.statusCode}");
    } catch (exception) {
      print("Catch exception1: $exception");
    }
    return <Event>[];
  }

  Future<List<UpcomingEvents>> getUpcomingEvents() async {
    // try {
    Response response =
        await DioHelper.getData(url: epGetUpcomingEvents, query: {});

    if (response.statusCode == 200) {
      print(response.data.toString());
      UpcomingEventsResponse eventsResponse =
          UpcomingEventsResponse.fromJson(json.decode(response.data));
      return eventsResponse.upcomingevents;
    }
    print("Get Events: statusCode = ${response.statusCode}");
    // } catch (exception) {
    //   print("Catch exception2: $exception");
    // }
    return <UpcomingEvents>[];
  }
}
