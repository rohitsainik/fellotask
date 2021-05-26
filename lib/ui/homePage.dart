import 'package:fellotask/ui/jumpGame.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'newsPage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex == 0 ? NewsPage() : Jump(),
      floatingActionButton: floatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
// Custom Tab Button
  floatingButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = 0;
            });
          },
          child: Container(
              height: 40,
              width: 120,
              decoration: BoxDecoration(
                  color: _selectedIndex == 0 ? Colors.black : Colors.white,
                  border: Border.all(
                    color: _selectedIndex == 0
                        ? Colors.black
                        : Colors.indigoAccent,
                  ),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'News',
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                    color: _selectedIndex == 0 ? Colors.white : Colors.black,
                  ),
                ),
              )),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = 1;
            });
          },
          child: Container(
              width: 120,
              height: 40,
              decoration: BoxDecoration(
                  color:
                      _selectedIndex == 1 ? Colors.indigoAccent : Colors.white,
                  border: Border.all(
                    color: _selectedIndex == 1
                        ? Colors.indigoAccent
                        : Colors.black,
                  ),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Align(
                alignment: Alignment.center,
                child: Text('Game',
                    style: GoogleFonts.lato(
                        color:
                            _selectedIndex == 1 ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 16)),
              )),
        ),
      ],
    );
  }
}
