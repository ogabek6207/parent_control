// import 'package:flutter/material.dart';
// import 'package:parent_control/src/app%20theme/app_theme.dart';
// import 'package:parent_control/src/ui/alert/alert_screen.dart';
// import 'package:parent_control/src/ui/home/home_screen.dart';
// import 'package:parent_control/src/ui/setting/setting_screen.dart';
// import 'package:parent_control/src/ui/tasks/tasks_screen.dart';
// import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
//
// import '../main_screen.dart';
//
// class ProvidedStylesExample extends StatefulWidget {
//   const ProvidedStylesExample({Key? key}) : super(key: key);
//
//   @override
//   _ProvidedStylesExampleState createState() => _ProvidedStylesExampleState();
// }
//
// class _ProvidedStylesExampleState extends State<ProvidedStylesExample> {
//   late PersistentTabController _controller;
//   late bool _hideNavBar;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = PersistentTabController(initialIndex: 0);
//     _hideNavBar = false;
//   }
//
//   List<Widget> _buildScreens() {
//     int _selectedIndex = 0;
//     int userId = 0;
//     int userGender = 0;
//     String userName = "", userImage = "";
//     return [
//       HomeScreen(
//         userChanged: (_id, _userName, _userImage, _userGender) {
//           userId = _id;
//           userName = _userName;
//           userImage = _userImage;
//           userGender = _userGender;
//         },
//       ),
//       TasksScreen(
//         id: userId,
//         name: userName,
//         image: userImage,
//         gender: userGender,
//         onBack: () {
//           _selectedIndex = 0;
//         },
//       ),
//     ];
//   }
//
//   List<PersistentBottomNavBarItem> _navBarsItems() {
//     int _selectedIndex = 0;
//     int userId = 0;
//     int userGender = 0;
//     String userName = "", userImage = "";
//     return [
//       PersistentBottomNavBarItem(
//         icon: const Icon(Icons.home),
//         title: "Home",
//         activeColorPrimary: Colors.blue,
//         inactiveColorPrimary: Colors.grey,
//         inactiveColorSecondary: Colors.purple,
//       ),
//       PersistentBottomNavBarItem(
//         iconSize: 40,
//         opacity: 1.0,
//         inactiveColorSecondary: AppTheme.black,
//         icon: const Icon(Icons.search),
//         title: ("Search"),
//         activeColorPrimary: Colors.teal,
//         inactiveColorPrimary: Colors.grey,
//         routeAndNavigatorSettings: RouteAndNavigatorSettings(
//           initialRoute: '/',
//           routes: {
//             '/first': (context) => HomeScreen(
//                   userChanged: (_id, _userName, _userImage, _userGender) {
//                     userId = _id;
//                     userName = _userName;
//                     userImage = _userImage;
//                     userGender = _userGender;
//                   },
//                 ),
//             '/second': (context) => TasksScreen(
//                   id: userId,
//                   name: userName,
//                   image: userImage,
//                   gender: userGender,
//                   onBack: () {
//                     _selectedIndex = 0;
//                   },
//                 ),
//           },
//         ),
//       ),
//     ];
//   }
//   int _selectedIndex = 0;
//   int userId = 0;
//   int userGender = 0;
//   String userName = "", userImage = "";
//   @override
//   Widget build(BuildContext context) {
//     return
//
//
//
//
//       // IndexedStack(
//       //   children: [
//       //     HomeScreen(
//       //       userChanged: (_id, _userName, _userImage, _userGender) {
//       //         userId = _id;
//       //         userName = _userName;
//       //         userImage = _userImage;
//       //         userGender = _userGender;
//       //       },
//       //     ),
//       //     TasksScreen(
//       //
//       //       id: userId,
//       //       name: userName,
//       //       image: userImage,
//       //       gender: userGender, onBack: () {_selectedIndex = 0;  },
//       //     ),
//       //     AlertScreen(
//       //       onBack: () {
//       //         setState(() {
//       //           _selectedIndex = 0;
//       //         });
//       //       },
//       //       id: userId,
//       //       name: userName,
//       //       image: userImage,
//       //       gender: userGender,
//       //     ),
//       //     SettingScreen(
//       //       id: userId,
//       //     ),
//       //   ],
//       // );
//
//
//       PersistentTabView(
//         context,
//         controller: _controller,
//         screens: _buildScreens(),
//         items: _navBarsItems(),
//         confineInSafeArea: false,
//         backgroundColor: Colors.white,
//         handleAndroidBackButtonPress: true,
//         resizeToAvoidBottomInset: true,
//         stateManagement: true,
//
//         navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
//             ? 0.0
//             : kBottomNavigationBarHeight,
//         hideNavigationBarWhenKeyboardShows: true,
//         margin: const EdgeInsets.all(0.0),
//         popActionScreens: PopActionScreensType.all,
//         bottomScreenMargin: 10.0,
//         onWillPop: (context) async {
//           return false;
//         },
//         selectedTabScreenContext: (context) {},
//         hideNavigationBar: _hideNavBar,
//         decoration: NavBarDecoration(
//             colorBehindNavBar: Colors.indigo,
//             borderRadius: BorderRadius.circular(20.0)),
//         popAllScreensOnTapOfSelectedTab: true,
//         itemAnimationProperties: const ItemAnimationProperties(
//           duration: Duration(milliseconds: 1000),
//           curve: Curves.ease,
//         ),
//         screenTransitionAnimation: const ScreenTransitionAnimation(
//           animateTabTransition: true,
//           curve: Curves.ease,
//           duration: Duration(milliseconds: 1000),
//         ),
//         navBarStyle: NavBarStyle
//             .neumorphic, // Choose the nav bar style with this property
//
//     );
//   }
// }
// //
// // class CustomNavBarWidget extends StatelessWidget {
// //   final int selectedIndex;
// //   final List<PersistentBottomNavBarItem>? items;
// //   final ValueChanged<int> onItemSelected;
// //
// //   const CustomNavBarWidget({
// //     Key? key,
// //     required this.selectedIndex,
// //     required this.items,
// //     required this.onItemSelected,
// //   }) : super(key: key);
// //
// //   Widget _buildItem(PersistentBottomNavBarItem item, bool isSelected) {
// //     return Container(
// //       alignment: Alignment.center,
// //       height: kBottomNavigationBarHeight,
// //       child: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         crossAxisAlignment: CrossAxisAlignment.center,
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           Flexible(
// //             child: IconTheme(
// //               data: IconThemeData(
// //                   size: 26.0,
// //                   color: isSelected
// //                       ? (item.activeColorSecondary ?? item.activeColorPrimary)
// //                       : item.inactiveColorPrimary ?? item.activeColorPrimary),
// //               child: isSelected ? item.icon : item.inactiveIcon ?? item.icon,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       color: Colors.white,
// //       child: SizedBox(
// //         width: double.infinity,
// //         height: kBottomNavigationBarHeight,
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceAround,
// //           children: items!.map((item) {
// //             int index = items!.indexOf(item);
// //             return Flexible(
// //               child: GestureDetector(
// //                 onTap: () {
// //                   onItemSelected(index);
// //                 },
// //                 child: _buildItem(item, selectedIndex == index),
// //               ),
// //             );
// //           }).toList(),
// //         ),
// //       ),
// //     );
// //   }
// // }
