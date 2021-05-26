import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Jump extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => JumpState();
}

class JumpState extends State<Jump> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> offset;
  AudioCache? _audioCache;

  @override
  void initState() {
    super.initState();
    _audioCache = AudioCache(
        prefix: "",
        fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    offset = Tween<Offset>(begin: Offset(0.0, 0.1), end: Offset.zero)
        .animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: buildBody(),
    ));
  }

  // Application Body
  buildBody() {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
            top: 15,
            child: Text('JUMP Game',
                style: GoogleFonts.zcoolKuaiLe(
                    fontSize: 25, color: Colors.blueAccent))),
        Image.asset('asstes/back.png'),
        Align(
          alignment: Alignment.center,
          child: SlideTransition(
            position: offset,
            child: Padding(
              padding: EdgeInsets.all(50.0),
              child: Image.asset(
                'asstes/girl.png',
                height: 300,
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 160,
            child: Image.asset(
              'asstes/circlejump.png',
              width: 150,
            )),
        Positioned(
          bottom: 70,
          child: Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                print(controller.status);
                controller.forward();
                _audioCache!.play('asstes/YippeeSoundEffect.mp3');
                Timer(Duration(milliseconds: 1000), () {
                  controller.reverse();
                });
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(120),
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x80000000),
                          blurRadius: 12.0,
                          offset: Offset(0.0, 5.0),
                        ),
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.indigoAccent,
                          Colors.lightBlueAccent,
                        ],
                      )),
                  child: Center(
                      child: Text(
                    'JUMP',
                    style: GoogleFonts.zcoolKuaiLe(
                        fontSize: 15, color: Colors.white),
                  )),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
