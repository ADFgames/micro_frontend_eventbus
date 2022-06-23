import 'dart:async';

class EventBus {
  EventBus._internal();
  static final EventBus _singleton = EventBus._internal();
  factory EventBus() => _singleton;

  final _bus = StreamController.broadcast();

  static emit(payLoad) {
    _singleton._bus.sink.add(payLoad);
  }

  static get listen => _singleton._bus.stream.listen;
}
