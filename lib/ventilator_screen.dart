import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'utils/dimension.dart';
import 'widgets/bat_shape.dart';
import 'widgets/button_fan.dart';

class VentilatorScreen extends StatefulWidget {
  const VentilatorScreen({super.key});

  @override
  State<VentilatorScreen> createState() => _VentilatorScreenState();
}

class _VentilatorScreenState extends State<VentilatorScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool inOn = false;
  int step = 0;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/back2.jpeg"), fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: const Text(
            "An animated fan",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35))),
        ),
        bottomNavigationBar: const Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            "Powered By Omar Farouk",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [getVerticalStem(), getBottomCircle()],
              ),
              Positioned(
                top: 20,
                child: Stack(
                  children: [
                    Container(
                      height: Dimension.getScreenHeight(context) * 0.3,
                      width: Dimension.getScreenHeight(context) * 0.3,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white12,
                          border: Border.all(color: Colors.white38, width: 3),
                          borderRadius: BorderRadius.circular(200)),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [getAllBats(), getModelZone()],
                      ),
                    ),
                  ],
                ),
              ),
              getControlZone()
            ],
          ),
        ),
      ),
    );
  }


  updateVentilator(int step) {
    List<int> values = [400, 300, 100];
    _controller.duration = Duration(milliseconds: values[step - 1]);
    _controller.repeat();
  }

  offVentilator() {
    _controller.duration = const Duration(milliseconds: 700);
    Timer(const Duration(milliseconds: 3000), () {
      _controller.stop();
    });
  }

  getVerticalStem() {
    return Container(
      width: 25,
      height: Dimension.getScreenHeight(context) * 0.5,
      color: Colors.grey.shade600,
    );
  }

  Container getBottomCircle() {
    return Container(
      height: 50,
      width: Dimension.getScreenWidth(context) * 0.5,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.deepPurple,
          border: Border.all(color: Colors.deepPurple),
          borderRadius: const BorderRadius.all(Radius.elliptical(200, 50))),
      child: Container(
        height: 20,
        width: 80,
        decoration: const BoxDecoration(
            color: Colors.white54,
            borderRadius: BorderRadius.all(Radius.elliptical(40, 10))),
      ),
    );
  }

  Positioned getControlZone() {
    return Positioned(
        top: Dimension.getScreenHeight(context) * 0.35,
        child: Container(
          height: 75,
          width: 20,
          padding: const EdgeInsets.symmetric(horizontal: 1),
          margin: const EdgeInsets.symmetric(horizontal: 1),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(2)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              ButtonFan(
                  callback: () {
                    if (inOn) {
                      setState(() {
                        step = 3;
                        updateVentilator(step);
                      });
                    }
                  },
                  step: step,
                  value: 3),
              ButtonFan(
                  callback: () {
                    if (inOn) {
                      setState(() {
                        step = 2;
                        updateVentilator(step);
                      });
                    }
                  },
                  step: step,
                  value: 2),
              ButtonFan(
                  callback: () {
                    if (inOn) {
                      setState(() {
                        step = 1;
                        updateVentilator(step);
                      });
                    }
                  },
                  step: step,
                  value: 1),
              inOn
                  ? GestureDetector(
                      onTap: () {
                        offVentilator();
                        setState(() {
                          inOn = false;
                          step = 0;
                        });
                      },
                      child: Container(
                        width: 15,
                        height: 15,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(2)),
                        child: const Text(
                          "OFF",
                          style: TextStyle(color: Colors.white, fontSize: 5),
                        ),
                      ))
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          inOn = true;
                          step = 1;
                          updateVentilator(step);
                        });
                      },
                      child: Container(
                        width: 15,
                        height: 15,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(2)),
                        child: const Text(
                          "ON",
                          style: TextStyle(color: Colors.white, fontSize: 7),
                        ),
                      ),
                    ),
              const SizedBox(),
            ],
          ),
        ));
  }

  Widget getAllBats() {
    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.rotate(
              angle: _controller.value *
                  2 *
                  3.14159, // Rotation en radians (360 degrés)
              child: Container(
                height: 200,
                width: 200,
                alignment: Alignment.center,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      alignment: Alignment.center,
                    ),
                    Positioned(
                        top: 0,
                        child: Transform.rotate(
                            angle: 0,
                            child: SizedBox(
                              height: 120,
                              width: 20,
                              child: CustomPaint(
                                painter: BatShapePainter(),
                              ),
                            ))),
                    Positioned(
                        bottom: 50,
                        left: 130,
                        child: Transform.rotate(
                            angle: -pi / 2.5,
                            child: SizedBox(
                              height: 80,
                              width: 20,
                              child: CustomPaint(
                                painter: BatShapePainter(),
                              ),
                            ))),
                    Positioned(
                        bottom: 50,
                        right: 130,
                        child: Transform.rotate(
                            angle: pi / 2.5,
                            child: SizedBox(
                              height: 80,
                              width: 20,
                              child: CustomPaint(
                                painter: BatShapePainter(),
                              ),
                            ))),
                  ],
                ),
              ));
        });
  }

  getModelZone() {
    return Positioned(
      child: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        child: const CircleAvatar(
          backgroundColor: Colors.deepPurple,
          radius: 35,
          child: Text(
            "KOF",
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
