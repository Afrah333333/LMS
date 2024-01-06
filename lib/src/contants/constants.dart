import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

//colors
const Color kPrimaryColor = Color(0xFF2E7D32);
const Color kSecondaryColor = Color(0xFF4CAF50);
const Color kTextBlackColor = Color(0xFF313131);
const Color kTextWhiteColor = Color(0xFFFFFFFF);
const Color kContainerColor = Color(0xFF777777);
const Color kOtherColor = Color(0xFFF4F6F7);
const Color kTextLightColor = Color(0xFFA5A5A5);
const Color kErrorBorderColor = Color(0xFFE74C3C);

//default value
const kDefaultPadding = 20.0;

const sizedBox = SizedBox(
  height: kDefaultPadding,
);
const kWidthSizedBox = SizedBox(
  width: kDefaultPadding,
);

const kHalfSizedBox = SizedBox(
  height: kDefaultPadding / 2,
);

const kHalfWidthSizedBox = SizedBox(
  width: kDefaultPadding / 2,
);

final kTopBorderRadius = BorderRadius.only(
  topLeft: Radius.circular(40),
  topRight:
  Radius.circular(40),
);

final kBottomBorderRadius = BorderRadius.only(
  bottomRight: Radius.circular(40),
  bottomLeft:
  Radius.circular(40),
);


//validation for mobile
const String mobilePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';

//validation for email
const String emailPattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
const kCardColor = Color(0xFF282B30);
const kHourColor = Color(0xFFF5C35A);
const kBGColor = Color(0xFF343537);

const kTextColor = Color(0xFF000000);

const kCalendarDay = TextStyle(
  color: Colors.black,
  fontSize: 16.0,
);