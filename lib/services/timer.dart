import 'package:quiver/async.dart';

const int _start = 1000;
late CountdownTimer countDownTimer;

void startTimer(Function(CountdownTimer) function) {
  countDownTimer = CountdownTimer(
    const Duration(seconds: _start),
    const Duration(seconds: 1),
  );
  var sub = countDownTimer.listen(null);
  sub.onData(function);

  sub.onDone(() {
    sub.cancel();
  });
}
