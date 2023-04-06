// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CardData extends StatefulWidget {
  final String libelle, data;
  const CardData({super.key, required this.libelle, required this.data});

  @override
  State<CardData> createState() => _CardDataState();
}

class _CardDataState extends State<CardData> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.libelle,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(
          widget.data,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        )
      ],
    );
  }
}
