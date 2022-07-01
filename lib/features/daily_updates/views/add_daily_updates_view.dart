import 'dart:developer';

import 'package:flutter/material.dart';

class AddDailyUpdateView extends StatefulWidget {
  const AddDailyUpdateView({Key? key}) : super(key: key);

  @override
  State<AddDailyUpdateView> createState() => _AddDailyUpdateViewState();
}

class _AddDailyUpdateViewState extends State<AddDailyUpdateView> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Add daily update"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            SizedBox(height: 20,),
            //!text field for date
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Date",
                labelText: "Enter date",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              controller: _dateController,
            ),
            SizedBox(
              height: 20,
            ),

            //!text form field for title
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Title",
                labelText: "Enter Title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              controller: _titleController,
            ),
            SizedBox(
              height: 20,
            ),

            //! descriptin controller
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Date",
                labelText: "Enter Description",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              controller: _descriptionController,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  print(_dateController.text +
                      _titleController.text +
                      _descriptionController.text);
                },
                child: Text("Print"))
          ],
        ),
      ),
    );
  }
}
