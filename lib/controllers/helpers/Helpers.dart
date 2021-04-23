import 'package:flutter/material.dart';

compareMediaQuery(BuildContext context, int size) =>
    MediaQuery.of(context).size.width / 4 > size
        ? size
        : MediaQuery.of(context).size.width / 4;

sb(double height) => SizedBox(
      height: height,
    );
