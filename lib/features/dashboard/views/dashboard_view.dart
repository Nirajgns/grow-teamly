import 'package:flutter/material.dart';
import 'package:profileapp/features/dashboard/model/dashboard_card.dart';
import 'package:profileapp/features/dashboard/services/dashboard_services.dart';
import 'package:profileapp/features/dashboard/widgets/dashboard_card.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  DashboardCardModel? dashboardCard;
  bool _isloading = true;
  @override
  void initState() {
    super.initState();
    fetchDashboardCardData();
  }

  fetchDashboardCardData() async {
    DashboardCardModel? response =
        await DashboardServices().fetchDashboardCardData();
    dashboardCard = response;
    _isloading = false;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dashboard View",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: _isloading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.redAccent,
              ),
            )
          : Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    spacing: 15,
                    runSpacing: 15,
                    children: [
                      DashboardCard(
                        icon: const Icon(Icons.leave_bags_at_home),
                        title: " My Leaves",
                        count: dashboardCard!.myleavebalance.toString(),
                        containerColor: Colors.grey,
                      ),

                      DashboardCard(
                        icon: const Icon(Icons.dashboard_customize),
                        title: "My ghost count",
                        count: dashboardCard!.myghostcount.toString(),
                        containerColor: Colors.amber,
                      ),

                      DashboardCard(
                        icon: const Icon(Icons.dashboard_customize),
                        title: "My leave balance",
                        count: dashboardCard!.myleavebalance.toString(),
                        containerColor: Colors.yellow,
                      ),

                      DashboardCard(
                        icon: const Icon(Icons.dashboard_customize),
                        title: "My daily updates",
                        count: dashboardCard!.mynodailyUpdates.toString(),
                      ),

                      DashboardCard(
                        icon: const Icon(Icons.dashboard_customize),
                        title: "My not acknowledged",
                        count: dashboardCard!.mynotacknowledged.toString(),
                      ),

                      //!Before creating dashboard class...

                      // Container(
                      //   padding: EdgeInsets.all(10.0),
                      //   height: 120,
                      //   width: size.width * 0.5,
                      //   alignment: Alignment.center,
                      //   decoration: BoxDecoration(
                      //     color: Colors.amber,
                      //     borderRadius: BorderRadius.circular(15),
                      //   ),
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //     children: [
                      //       Icon(
                      //         Icons.timeline,
                      //       ),
                      //       Text("My missing Checkout..."),
                      //       Text(
                      //         dashboardCard!.mymissingcheckoutcount.toString(),
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      // Container(
                      //   padding: EdgeInsets.all(10.0),
                      //   height: 120,
                      //   width: size.width * 0.5,
                      //   alignment: Alignment.center,
                      //   decoration: BoxDecoration(
                      //       color: Colors.blue,
                      //       borderRadius: BorderRadius.circular(15)),
                      //   child: Text(
                      //     dashboardCard!.mymissingcheckoutcount.toString(),
                      //     style:
                      //         TextStyle(color: Colors.redAccent, fontSize: 20),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
