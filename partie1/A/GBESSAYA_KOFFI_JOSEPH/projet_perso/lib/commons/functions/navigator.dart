import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PageRoute<T> _routeBuilder<T>(Widget page) {
  if (Platform.isIOS) {
    return CupertinoPageRoute<T>(
      builder: (_) => page,
    );
  } else {
    return MaterialPageRoute<T>(
      builder: (_) => page,
    );
  }
}

Future<T?> pushToAndRemoveAll<T>(BuildContext context, Widget page) {
  return Navigator.of(context).pushAndRemoveUntil(
    _routeBuilder(page),
    (_) => false,
  );
}
