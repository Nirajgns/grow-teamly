import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:material_color_utilities/material_color_utilities.dart';

class DashboardCard extends StatelessWidget {
  final Icon icon;
  final String title;
  final String count;
  final Color? containerColor;
  const DashboardCard(
      {Key? key, required this.icon, required this.title, required this.count,   this.containerColor =Colors.purpleAccent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: 100,
      width: size.width * 0.43,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          icon,
          Text(title),
          Text(
            count,
          ),
        ],
      ),
    );
  }
}
