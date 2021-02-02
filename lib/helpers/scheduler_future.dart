import 'dart:async';

startTime(action) async {
  var _duration = new Duration(seconds: 3);
  return new Timer(_duration, action);
}
