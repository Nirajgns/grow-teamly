import 'package:flutter/material.dart';
class LeaveView extends StatefulWidget {
  const LeaveView({ Key? key }) : super(key: key);

  @override
  State<LeaveView> createState() => _LeaveViewState();
}

class _LeaveViewState extends State<LeaveView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Leaves View"),
        centerTitle: true,
      ),
      
    );
  }
}