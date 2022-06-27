import 'package:flutter/material.dart';
import 'package:profileapp/features/attendence/views/attendence_view.dart';
import 'package:profileapp/features/dashboard/views/dashboard_view.dart';
import 'package:profileapp/features/leaves/views/leave_view.dart';
import 'package:profileapp/features/profile/views/profile_view.dart';
import 'features/daily_updates/views/daily_update_view.dart';

class Homepage extends StatefulWidget {
  const Homepage({
    Key? key,
  }) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Widget> pages=[
    DashboardView(),
    DailyUpdateView(),
    AttendanceView(),
    LeaveView(),
    ProfileView(),

  ];
  int _currentindex=0;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     "Homepage",
      //     style: TextStyle(color: Color.fromARGB(255, 57, 34, 149)),
      //   ),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         locator.get<SharedPreferences>().clear();
        //         Navigator.pushAndRemoveUntil(
        //             context,
        //             MaterialPageRoute(
        //               builder: (context) => Loginpage(),
        //             ),
        //             (route) => false);
        //       },
        //       icon: Icon(Icons.logout))
        // ],
      // ),
      body: pages[_currentindex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentindex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
            ),
            label: "Dashboard"
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.update,
            ),
            label: "update"
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.insights,
            ),
            label: "Attendence"
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.holiday_village,
            ),
            label: "holiday_village"
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "person"
          ),
        ],
        onTap: (index) {
         setState(() {
            _currentindex =index;
         });
        },
      ),
    );
  }
}
