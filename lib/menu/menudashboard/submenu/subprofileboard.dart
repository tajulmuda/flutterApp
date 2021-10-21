// import 'package:flutter/material.dart';
// import 'package:flutter_app/menu/dashboard_menu.dart';
// import 'package:flutter_app/menu/menudashboard/submenu/widgets/active_project_card.dart';
// import 'package:flutter_app/menu/menudashboard/submenu/widgets/task_column.dart';
// import 'package:percent_indicator/percent_indicator.dart';
//
// import '../../login.dart';
// import '../profileboard.dart';
//
// class SubProfileBoard extends StatelessWidget {
//   Text subheading(String title) {
//     return Text(
//       title,
//       style: const TextStyle(
//           color: LightColors.kDarkBlue,
//           fontSize: 20.0,
//           fontWeight: FontWeight.w700,
//           letterSpacing: 1.2),
//     );
//   }
//
//   static CircleAvatar calendarIcon() {
//     return const CircleAvatar(
//       radius: 25.0,
//       backgroundColor: LightColors.kGreen,
//       child: Icon(
//         Icons.logout,
//         size: 20.0,
//         color: Colors.white,
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Colors.white38,
//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//             Container(
//               height: 100,
//               width: width,
//               color: Colors.white70,
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 0, vertical: 0.0),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: <Widget>[
//                           CircularPercentIndicator(
//                             radius: 90.0,
//                             lineWidth: 5.0,
//                             animation: true,
//                             percent: 0.75,
//                             circularStrokeCap: CircularStrokeCap.round,
//                             progressColor: LightColors.kRed,
//                             backgroundColor: LightColors.kDarkYellow,
//                             center: const CircleAvatar(
//                               backgroundColor: LightColors.kBlue,
//                               radius: 35.0,
//                               backgroundImage: AssetImage(
//                                 'assets/image/onboarding1.png',
//                               ),
//                             ),
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: <Widget>[
//                               Container(
//                                 child: const Text(
//                                   'Tajul Muda',
//                                   textAlign: TextAlign.start,
//                                   style: TextStyle(
//                                     fontSize: 22.0,
//                                     color: LightColors.kDarkBlue,
//                                     fontWeight: FontWeight.w800,
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 child: const Text(
//                                   'Food Owner',
//                                   textAlign: TextAlign.start,
//                                   style: TextStyle(
//                                     fontSize: 16.0,
//                                     color: Colors.black45,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     )
//                   ]),
//             ),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: <Widget>[
//                     Container(
//                       color: Colors.transparent,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 20.0, vertical: 10.0),
//                       child: Column(
//                         children: <Widget>[
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: <Widget>[
//                               subheading('My Restaurant'),
//                               IconButton(
//                                 icon: Icon(Icons.location_on, color: Colors.green),
//                                 onPressed: () => Navigator.pushReplacementNamed(context, '/dashboard_menu'),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 15.0),
//                           TaskColumn(
//                             icon: Icons.alarm,
//                             iconBackgroundColor: LightColors.kRed,
//                             title: 'List Menu',
//                             subtitle: '35 Menu',
//                           ),
//                           SizedBox(
//                             height: 15.0,
//                           ),
//                           TaskColumn(
//                             icon: Icons.blur_circular,
//                             iconBackgroundColor: LightColors.kDarkYellow,
//                             title: 'employee',
//                             subtitle: '5 pegawai',
//                           ),
//                           SizedBox(height: 15.0),
//                           TaskColumn(
//                             icon: Icons.check_circle_outline,
//                             iconBackgroundColor: LightColors.kBlue,
//                             title: 'Motto',
//                             subtitle: 'Memuaskan pelanggan adalah kami',
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       color: Colors.transparent,
//                       padding: EdgeInsets.symmetric(
//                           horizontal: 20.0, vertical: 10.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           subheading('Progress & Stock'),
//                           SizedBox(height: 5.0),
//                           Row(
//                             children: <Widget>[
//                               ActiveProjectsCard(
//                                 cardColor: LightColors.kGreen,
//                                 loadingPercent: 0.75,
//                                 title: 'Dapur',
//                                 subtitle: 'Masih Aman',
//                               ),
//                               SizedBox(width: 20.0),
//                               ActiveProjectsCard(
//                                 cardColor: LightColors.kRed,
//                                 loadingPercent: 0.8,
//                                 title: 'Area Pelanggan',
//                                 subtitle: 'hampir penuh',
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: <Widget>[
//                               ActiveProjectsCard(
//                                 cardColor: LightColors.kDarkYellow,
//                                 loadingPercent: 0.54,
//                                 title: 'Persediaan bumbu dapur',
//                                 subtitle: 'Ragu',
//                               ),
//                               SizedBox(width: 20.0),
//                               ActiveProjectsCard(
//                                 cardColor: LightColors.kBlue,
//                                 loadingPercent: 0.88,
//                                 title: 'Bahan Olahan',
//                                 subtitle: 'Banyak',
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 50.0),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: <Widget>[
//                                 RaisedButton(
//                                   onPressed: () {
//                                     Navigator.pop(context);
//                                     Navigator.pop(context);
//                                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Login()));
//                                   },
//                                   color: Colors.black,
//                                   child: Row(
//                                     children: const <Widget>[
//                                       Text(
//                                         'LogOut',
//                                         style: TextStyle(color: Colors.white),
//                                       ),
//                                       Icon(
//                                         Icons.logout,
//                                         color: Colors.white70,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
