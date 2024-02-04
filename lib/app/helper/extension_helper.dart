import 'package:flutter/material.dart';

extension RegisteredUserSeriousCondition on bool? {
  (String, Color) isContactWithCovid19Person() {
    if (this == true) {
      return ("Had Contact with Covid 19 Person", Colors.red);
    } else {
      return ("No Contact with Covid 19 Person", Colors.green);
    }
  }

  (String, Color) gotFluOrSick() {
    if (this == true) {
      return ("I have fever", Colors.red);
    } else {
      return ("I don't have fever", Colors.green);
    }
  }

  (String, Color) isUnderQuarantine() {
    if (this == true) {
      return ("Under quarantine", Colors.red);
    } else {
      return ("Not under quarantine", Colors.green);
    }
  }
}
