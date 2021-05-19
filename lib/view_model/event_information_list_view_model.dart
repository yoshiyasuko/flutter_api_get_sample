import 'package:flutter/widgets.dart';
import 'package:flutter_api_get_sample/domain/client/api_client.dart';
import 'package:flutter_api_get_sample/domain/entity/event_information.dart';

class EventInformationListViewModel extends ChangeNotifier {
  List<EventInformation> events = [];

  void fetchEvents() async {
    await ApiClient.fetchEvents()
        .then((response) => response.when(success: (events) {
              this.events = events;
              notifyListeners();
            }, failure: (error) {
              print(error.errorMessage);
            }));
  }
}