import 'dart:convert';
import 'package:test/test.dart';
import 'package:actworthy_citizen/models/organization.dart';

void main() {

  test('Can create Organization instance from Json', () {
    // Arrange
    const name = "Organization name";
    const type = "Organization type";
    final jsonString = '{ "name": "$name", "type": "$type" }';
    var json = jsonDecode(jsonString);

    // Act
    var organization = Organization.fromJson(json);

    // Assert
    expect(organization.name, equals(name));
    expect(organization.type, equals(type));
  });
}