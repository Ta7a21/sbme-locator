import 'package:flutter/material.dart';
import 'package:locator/timer.dart';
import 'package:locator/server_handler.dart';

void main() {
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int location = 10;
  Map<int, Coordinates> positions = {
    0: Coordinates(0.86, 0.6),
    1: Coordinates(0.72, 0.45),
    2: Coordinates(0.62, 0.45),
    3: Coordinates(0.48, 0.45),
    4: Coordinates(0.31, 0.45),
    5: Coordinates(0.15, 0.45),
    6: Coordinates(0.4, 0.25),
    7: Coordinates(0.25, 0.25),
    8: Coordinates(0.86, 0.86),
    9: Coordinates(0.86, 0.73),
    10: Coordinates(0, 0)
  };

  @override
  void initState() {
    super.initState();
    startTimer(((countdownTimer) async {
      int tempData = await getLocation();
      if (tempData == -1) return;
      setState(() {
        location = tempData;
      });
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SBME Floor Locator"),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: <Widget>[
            Flexible(
              fit: FlexFit.loose,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/map.jpeg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    left: positions[location]!.x * constraints.maxWidth,
                    top: positions[location]!.y * constraints.maxHeight,
                    child: Container(
                      width: 0.06129629629 * constraints.maxWidth,
                      height: 0.03292084726 * constraints.maxHeight,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (location == 10) ? Colors.white : Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
