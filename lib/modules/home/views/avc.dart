import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwipeButtons extends StatefulWidget {
  @override
  _SwipeButtonsState createState() => _SwipeButtonsState();
}

class _SwipeButtonsState extends State<SwipeButtons> {
  double _position = 0;

  void _onSwipe(double delta) {
    setState(() {
      _position += delta;
    });
  }

  void _onSwipeEnd() {
    setState(() {
      if (_position.abs() > 50) {
        _position = _position > 0 ? 100 : -100;
      } else {
        _position = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: 150,
            child: GestureDetector(
              onPanUpdate: (details) {
                _onSwipe(details.delta.dx);
              },
              onPanEnd: (details) {
                _onSwipeEnd();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Option 1',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            width: 150,
            child: GestureDetector(
              onPanUpdate: (details) {
                _onSwipe(details.delta.dx);
              },
              onPanEnd: (details) {
                _onSwipeEnd();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Option 2',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            left: _position,
            duration: Duration(milliseconds: 200),
            child: Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  _position < 0 ? 'Option 1' : 'Option 2',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
  }
}
