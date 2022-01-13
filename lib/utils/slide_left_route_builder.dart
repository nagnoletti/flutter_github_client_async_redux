import 'package:flutter/material.dart';

///
/// slide_left_route_builder.dart
/// ...
///
class SlideLeftPageRouteBuilder extends PageRouteBuilder {
  final Widget page;

  SlideLeftPageRouteBuilder(this.page)
      : super(
          pageBuilder: (context, animation1, animation2) => page,
          transitionsBuilder: (context, animation1, animation2, child) {
            return SlideTransition(
              position: animation1.drive(
                Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: const Offset(0, 0),
                ).chain(
                  CurveTween(curve: Curves.easeInOutCubic),
                ),
              ),
              child: child,
            );
          },
        );
}
