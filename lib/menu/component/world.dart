import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/menu/widgets/summary_card.dart';

class World extends StatelessWidget {
  final double height;
  final data;

  World({required this.height, this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
          child: const Text(
            'Laporan Kasus Dunia',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 1,
          child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: height / 430,
            children: <Widget>[
              SummaryCard(
                total: data.world.confirmed,
                label: 'Positif',
                color: Colors.yellow,
                size:20,
              ),
              SummaryCard(
                total: data.world.recovered,
                label: 'Sembuh',
                color: Colors.greenAccent,
                size:20,
              ),
              SummaryCard(
                total: data.world.deaths,
                label: 'Meninggal',
                color: Colors.red,
                size:20,
              ),
            ],
          ),
        ),
        Text('Pembaruan Terakhir'),
        Text(data.updated),
      ],
    );
  }
}