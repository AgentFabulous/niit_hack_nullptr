import 'dart:async';
import 'package:flutter/material.dart';
import 'page_dragger.dart';
import 'page_reveal.dart';
import 'pager_indicator.dart';
import 'pages.dart';

class x690882f8 extends StatefulWidget {
  @override
  _x3a8ec6d2 createState() => new _x3a8ec6d2();
}

class _x3a8ec6d2 extends State<x690882f8>
    with TickerProviderStateMixin {
  StreamController<SlideUpdate> x293e0d4e;
  AnimatedPageDragger x14bfb5c8;

  int xad90975c = 0;
  int x4eb9c389 = 0;
  SlideDirection xae28e267 = SlideDirection.none;
  double x7ed4fe97 = 0.0;

  _x3a8ec6d2() {
    x293e0d4e = new StreamController<SlideUpdate>();

    x293e0d4e.stream.listen((SlideUpdate event) {
      setState(() {
        if (event.updateType == UpdateType.dragging) {
          xae28e267 = event.direction;
          x7ed4fe97 = event.x7ed4fe97;

          if (xae28e267 == SlideDirection.leftToRight) {
            x4eb9c389 = xad90975c - 1;
          } else if (xae28e267 == SlideDirection.rightToLeft) {
            x4eb9c389 = xad90975c + 1;
          } else {
            x4eb9c389 = xad90975c;
          }
        } else if (event.updateType == UpdateType.doneDragging) {
          if (x7ed4fe97 > 0.5) {
            x14bfb5c8 = new AnimatedPageDragger(
              xae28e267: xae28e267,
              transitionGoal: TransitionGoal.open,
              x7ed4fe97: x7ed4fe97,
              x293e0d4e: x293e0d4e,
              vsync: this,
            );
          } else {
            x14bfb5c8 = new AnimatedPageDragger(
              xae28e267: xae28e267,
              transitionGoal: TransitionGoal.close,
              x7ed4fe97: x7ed4fe97,
              x293e0d4e: x293e0d4e,
              vsync: this,
            );
            x4eb9c389 = xad90975c;
          }

          x14bfb5c8.run();
        } else if (event.updateType == UpdateType.animating) {
          xae28e267 = event.direction;
          x7ed4fe97 = event.x7ed4fe97;
        } else if (event.updateType == UpdateType.doneAnimating) {
          xad90975c = x4eb9c389;

          xae28e267 = SlideDirection.none;
          x7ed4fe97 = 0.0;

          x14bfb5c8.dispose();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: [
          new Page(
            viewModel: pages[xad90975c],
            percentVisible: 1.0,
          ),
          new PageReveal(
            revealPercent: x7ed4fe97,
            child: new Page(
              viewModel: pages[x4eb9c389],
              percentVisible: x7ed4fe97,
            ),
          ),
          new PagerIndicator(
            viewModel: new PagerIndicatorViewModel(
              pages,
              xad90975c,
              xae28e267,
              x7ed4fe97,
            ),
          ),
          new PageDragger(
            canDragLeftToRight: xad90975c > 0,
            canDragRightToLeft: xad90975c < pages.length - 1,
            x293e0d4e: this.x293e0d4e,
          ),
        ],
      ),
    );
  }
}
