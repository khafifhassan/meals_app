import 'package:flutter/Material.dart';

class Category {
  final String _id;
  final String _title;
  final Color _color;

  const Category(this._id, this._title, this._color);

  String get id {
    return this._id;
  }

  String get title {
    return this._title;
  }

  Color get color {
    return this._color;
  }
}
