import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Medicoes with ChangeNotifier{
  final String id;
  final String batimento;
  final String temperatura;

  Medicoes({
    required this.id,
    required this.batimento,
    required this.temperatura,
  });
  
}
