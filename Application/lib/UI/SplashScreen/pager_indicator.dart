import 'dart:ui' as dartui;

import 'package:flutter/material.dart';
import 'pages.dart';

class PagerIndicator extends StatelessWidget {
  final PagerIndicatorViewModel viewModel;

  PagerIndicator({
    this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    List<PageBubble> bubbles = [];
    for (var i = 0; i < viewModel.pages.length; ++i) {
      final page = viewModel.pages[i];

      var percentActive;
      if (i == viewModel.xad90975c) {
        percentActive = 1.0 - viewModel.x7ed4fe97;
      } else if (i == viewModel.xad90975c - 1 &&
          viewModel.xae28e267 == SlideDirection.leftToRight) {
        percentActive = viewModel.x7ed4fe97;
      } else if (i == viewModel.xad90975c + 1 &&
          viewModel.xae28e267 == SlideDirection.rightToLeft) {
        percentActive = viewModel.x7ed4fe97;
      } else {
        percentActive = 0.0;
      }

      bool isHollow = i > viewModel.xad90975c ||
          (i == viewModel.xad90975c &&
              viewModel.xae28e267 == SlideDirection.leftToRight);

      bubbles.add(
        new PageBubble(
          viewModel: new PageBubbleViewModel(
            page.iconAssetPath,
            page.color,
            isHollow,
            percentActive,
          ),
        ),
      );
    }

    final BUBBLE_WIDTH = 55.0;
    final baseTranslation =
        ((viewModel.pages.length * BUBBLE_WIDTH) / 2) - (BUBBLE_WIDTH / 2);
    var translation = baseTranslation - (viewModel.xad90975c * BUBBLE_WIDTH);
    if (viewModel.xae28e267 == SlideDirection.leftToRight) {
      translation += BUBBLE_WIDTH * viewModel.x7ed4fe97;
    } else if (viewModel.xae28e267 == SlideDirection.rightToLeft) {
      translation -= BUBBLE_WIDTH * viewModel.x7ed4fe97;
    }

    return new Column(
      children: [
        new Expanded(child: new Container()),
        new Transform(
          transform: new Matrix4.translationValues(translation, 0.0, 0.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: bubbles,
          ),
        ),
      ],
    );
  }
}

enum SlideDirection {
  leftToRight,
  rightToLeft,
  none,
}

class PagerIndicatorViewModel {
  final List<PageViewModel> pages;
  final int xad90975c;
  final SlideDirection xae28e267;
  final double x7ed4fe97;

  PagerIndicatorViewModel(
    this.pages,
    this.xad90975c,
    this.xae28e267,
    this.x7ed4fe97,
  );
}

class PageBubble extends StatelessWidget {
  final PageBubbleViewModel viewModel;

  PageBubble({
    this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 55.0,
      height: 65.0,
      child: new Center(
        child: new Container(
          width: dartui.lerpDouble(20.0, 45.0, viewModel.activePercent),
          height: dartui.lerpDouble(20.0, 45.0, viewModel.activePercent),
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            color: viewModel.isHollow
                ? const Color(0x88FFFFFF)
                    .withAlpha((0x88 * viewModel.activePercent).round())
                : const Color(0x88FFFFFF),
            border: new Border.all(
              color: viewModel.isHollow
                  ? const Color(0x88FFFFFF).withAlpha(
                      (0x88 * (1.0 - viewModel.activePercent)).round())
                  : Colors.transparent,
              width: 3.0,
            ),
          ),
          child: new Opacity(
              opacity: viewModel.activePercent,
              child: new Image(
                  image: new AssetImage(viewModel.iconAssetPath),
                  color: viewModel.color)),
        ),
      ),
    );
  }
}

class PageBubbleViewModel {
  final String iconAssetPath;
  final Color color;
  final bool isHollow;
  final double activePercent;

  PageBubbleViewModel(
    this.iconAssetPath,
    this.color,
    this.isHollow,
    this.activePercent,
  );
}
