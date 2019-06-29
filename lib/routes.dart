library routes;
import 'package:flutter/material.dart';
import 'package:hello_world/landingPage/landingPage.dart';
import 'package:hello_world/mainPage/mainPage.dart';
import 'package:hello_world/formPage/formPage.dart';

final routes = {
  '/mainPage' : (BuildContext context) => new MainPage(),
  '/formPage' : (BuildContext context) => new FormPage(),
  '/': (BuildContext context) => new LandingPage(),
};