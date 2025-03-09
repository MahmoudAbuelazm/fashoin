import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

const double kDefaultDuration = 0.3;
typedef PageBuilder = Widget Function();

class PageRoutes {
  static Route<T> fadeThrough<T>(PageBuilder page,
      [double duration = kDefaultDuration]) {
    return PageRouteBuilder<T>(
      transitionDuration: Duration(milliseconds: (duration * 1000).round()),
      pageBuilder: (context, animation, secondaryAnimation) => page(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child);
      },
    );
  }

  static Route<T> fade<T>(PageBuilder page,
      [double duration = kDefaultDuration]) {
    return PageRouteBuilder<T>(
      transitionDuration: Duration(milliseconds: (duration * 1000).round()),
      pageBuilder: (context, animation, secondaryAnimation) => page(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  static Route<T> fadeScale<T>(PageBuilder page,
      [double duration = kDefaultDuration]) {
    return PageRouteBuilder<T>(
      transitionDuration: Duration(milliseconds: (duration * 1000).round()),
      pageBuilder: (context, animation, secondaryAnimation) => page(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeScaleTransition(animation: animation, child: child);
      },
    );
  }

  static Route<T> sharedAxis<T>(PageBuilder page,
      [SharedAxisTransitionType type = SharedAxisTransitionType.scaled,
      double duration = kDefaultDuration]) {
    return PageRouteBuilder<T>(
      transitionDuration: Duration(milliseconds: (duration * 1000).round()),
      pageBuilder: (context, animation, secondaryAnimation) => page(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: type,
          child: child,
        );
      },
    );
  }
}
