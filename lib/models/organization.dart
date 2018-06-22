import 'package:flutter/foundation.dart';

class Organization {
  final String name;
  final String type;

  Organization({
    @required this.name,
    @required this.type,
  });

  factory Organization.fromJson(json) {
    return Organization(
      name: json["name"],
      type: json["type"],
    );
  }
}
