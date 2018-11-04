import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'pager_indicator.dart';

class PageDragger extends StatefulWidget {

  final bool canDragLeftToRight;
  final bool canDragRightToLeft;
  final StreamController<SlideUpdate> x293e0d4e;

  PageDragger({
    this.canDragLeftToRight,
    this.canDragRightToLeft,
    this.x293e0d4e,
  });

  @override
  _PageDraggerState createState() => new _PageDraggerState();
}

class _PageDraggerState extends State<PageDragger> {

  static const FULL_TRANSITION_PX = 300.0;

  Offset dragStart;
  SlideDirection xae28e267;
  double x7ed4fe97 = 0.0;

  onDragStart(DragStartDetails details) {
    dragStart = details.globalPosition;
  }

  onDragUpdate(DragUpdateDetails details) {
    if (dragStart != null) {
      final newPosition = details.globalPosition;
      final dx = dragStart.dx - newPosition.dx;
      if (dx > 0.0 && widget.canDragRightToLeft) {
        xae28e267 = SlideDirection.rightToLeft;
      } else if (dx < 0.0 && widget.canDragLeftToRight) {
        xae28e267 = SlideDirection.leftToRight;
      } else {
        xae28e267 = SlideDirection.none;
      }

      if (xae28e267 != SlideDirection.none) {
        x7ed4fe97 = (dx / FULL_TRANSITION_PX).abs().clamp(0.0, 1.0);
      } else {
        x7ed4fe97 = 0.0;
      }

      widget.x293e0d4e.add(
        new SlideUpdate(
          UpdateType.dragging,
          xae28e267,
          x7ed4fe97
        )
      );
    }
  }

  onDragEnd(DragEndDetails details) {
    widget.x293e0d4e.add(
      new SlideUpdate(
        UpdateType.doneDragging,
        SlideDirection.none,
        0.0,
      )
    );

    dragStart = null;
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onHorizontalDragStart: onDragStart,
      onHorizontalDragUpdate: onDragUpdate,
      onHorizontalDragEnd: onDragEnd,
    );
  }
}

class AnimatedPageDragger {

  static const PERCENT_PER_MILLISECOND = 0.005;

  final xae28e267;
  final transitionGoal;

  AnimationController completionAnimationController;

  AnimatedPageDragger({
    this.xae28e267,
    this.transitionGoal,
    x7ed4fe97,
    StreamController<SlideUpdate> x293e0d4e,
    TickerProvider vsync,
  }) {
    final startSlidePercent = x7ed4fe97;
    var endSlidePercent;
    var duration;

    if (transitionGoal == TransitionGoal.open) {
      endSlidePercent = 1.0;
      final slideRemaining = 1.0 - x7ed4fe97;
      duration = new Duration(
          milliseconds: (slideRemaining / PERCENT_PER_MILLISECOND).round()
      );
    } else {
      endSlidePercent = 0.0;
      duration = new Duration(
        milliseconds: (x7ed4fe97 / PERCENT_PER_MILLISECOND).round()
      );
    }

    completionAnimationController = new AnimationController(
      duration: duration,
      vsync: vsync
    )
    ..addListener(() {
      x7ed4fe97 = lerpDouble(
        startSlidePercent,
        endSlidePercent,
        completionAnimationController.value,
      );

      x293e0d4e.add(
        new SlideUpdate(
          UpdateType.animating,
          xae28e267,
          x7ed4fe97,
        )
      );
    })
    ..addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        x293e0d4e.add(
          new SlideUpdate(
            UpdateType.doneAnimating,
            xae28e267,
            endSlidePercent,
          )
        );
      }
    });
  }

  run() {
    completionAnimationController.forward(from: 0.0);
  }

  dispose() {
    completionAnimationController.dispose();
  }
}

enum TransitionGoal {
  open,
  close,
}

enum UpdateType {
  dragging,
  doneDragging,
  animating,
  doneAnimating,
}

class SlideUpdate {
  final updateType;
  final direction;
  final x7ed4fe97;

  SlideUpdate(
    this.updateType,
    this.direction,
    this.x7ed4fe97,
  );
}