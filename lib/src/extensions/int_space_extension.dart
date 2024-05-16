import 'package:flutter/cupertino.dart';

extension IntSpaceExtension on int {
  SizedBox get space => SizedBox.square(dimension: toDouble());
  EdgeInsets get all => EdgeInsets.all(toDouble());
  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: toDouble());
  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: toDouble());
}
