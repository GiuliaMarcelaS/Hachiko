import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Medicoes with ChangeNotifier{
  final String id;
  final int batimento;
  final int temperatura;

  Medicoes({
    required this.id,
    required this.batimento,
    required this.temperatura,
  });
  
}
