import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:profileapp/features/daily_updates/models/daily_update_model.dart';
import 'package:profileapp/features/daily_updates/services/daily_update_services.dart';

class DailyUpdatesView extends StatefulWidget {
  const DailyUpdatesView({Key? key}) : super(key: key);

  @override
  State<DailyUpdatesView> createState() => _DailyUpdatesViewState();
}

class _DailyUpdatesViewState extends State<DailyUpdatesView> {
  List<DailyUpdateModel> dailyUpdates = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDailyUpdates();
  }

  fetchDailyUpdates() async {
    DailyUpdateServices dailyUpdate = DailyUpdateServices();
    dailyUpdate.fetchDailyUpdates();
    dailyUpdates = await dailyUpdate.fetchDailyUpdates();
    _isLoading = false;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Daily Updates",
        ),
        centerTitle: true,
      ),
      floatingActionButton: 
      
      FloatingActionButton(
        onPressed: () {

        },
        child: Icon(Icons.add),
        
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: dailyUpdates.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(dailyUpdates[index].title ?? ""),
                    subtitle: Text(dailyUpdates[index].description ?? ""),
                    trailing: dailyUpdates[index].acknowledgedAt == null
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                child: Icon(Icons.edit),
                                onTap: () {
                                  log("edit tapped");
                                },
                              ),
                              InkWell(
                                child: Icon(Icons.delete),
                                onTap: () {
                                  log("delete tapped");
                                },
                              ),
                            ],
                          )
                        : SizedBox(),
                  );
                },
              ),
      ),
    );
  }
}
