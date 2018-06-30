import 'dart:convert';
import 'package:test/test.dart';
import 'package:actworthy_citizen/models/action.dart';

void main() {

  test('Can create Action instance from Json', () {
    // Arrange
    const headline = "Test headline";
    const summary = "Test summary";
    const actionType = "Test type";
    const organizationName = "Organization name";
    const organizationType = "Organization type";
    const issues = ["Issue 1","Issue 2"];
    final expiresOn = DateTime.now();
    final jsonString = '''{ 
                            "headline": "$headline",
                            "summary": "$summary", 
                            "action_type": "$actionType", 
                            "organization": 
                              { "name": "$organizationName", 
                                "type": "$organizationType" 
                              }, 
                            "issues": ["${issues[0]}", "${issues[1]}"], 
                            "expires": "$expiresOn" 
                            } ''';
    var json = jsonDecode(jsonString);

    // Act
    var action = Action.fromJson(json);

    // Assert
    expect(action.title, equals(headline));
    expect(action.summary, equals(summary));
    expect(action.type, equals(actionType));
    expect(action.organization.name, equals(organizationName));
    expect(action.organization.type, equals(organizationType));
    expect(action.issues[0].name, equals(issues[0]));
    expect(action.issues[1].name, equals(issues[1]));
    expect(action.expiresOn, equals(expiresOn));
  });
}