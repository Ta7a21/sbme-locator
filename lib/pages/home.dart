import 'package:flutter/material.dart';
import 'package:locator/services/timer.dart';
import 'package:locator/services/server_handler.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int location = 10;

  @override
  void initState() {
    super.initState();
    startTimer(((countdownTimer) async {
      int tempData = await get('location');
      if (tempData == -1 || location == tempData) return;
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    width: 1 * MediaQuery.of(context).size.width,
                    height: 0.6 * MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/map.jpeg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned(
                    left: positions[location]!.x *
                        MediaQuery.of(context).size.width,
                    top: positions[location]!.y *
                        MediaQuery.of(context).size.height,
                    child: Container(
                      width: 0.015 * constraints.maxWidth,
                      height: 0.015 * constraints.maxHeight,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (location == 10) ? Colors.white70 : Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/replay');
              },
              child: const Text('Replay'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
            ),
          ],
        );
      }),
    );
  }
}
