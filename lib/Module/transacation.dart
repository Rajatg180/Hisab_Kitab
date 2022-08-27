import 'package:flutter/material.dart';

class Transaction {
  final String title;
  final String id;
  final double amount;
  final DateTime date;
  Transaction(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date});
}
