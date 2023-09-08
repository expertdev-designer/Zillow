// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
//
// import '../Utils/strings.dart';
//
// class ProfileScreen extends StatefulWidget{
//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   int _currentIndex = 0;
//
//   final List<Widget> _pages = [
//     homeTabContent(),
//     favoritesTabContent(),
//     profileTabContent(),
//     search(),
//   ];
//   BitmapDescriptor? customIcon;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadCustomIcon();
//   }
//   Future<void> _loadCustomIcon() async {
//     final ByteData data = await rootBundle.load('assets/images/example.svg');
//     final Uint8List bytes = data.buffer.asUint8List();
//
//     final Codec codec = await instantiateImageCodec(bytes);
//     final FrameInfo frameInfo = await codec.getNextFrame();
//     final ByteData byteData = await frameInfo.image.toByteData(format: ImageByteFormat.png);
//
//     if (byteData != null) {
//       setState(() {
//         customIcon = BitmapDescriptor.fromBytes(byteData.buffer.asUint8List());
//       });
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Profile Screen with Bottom Navigation Bar',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         // appBar: AppBar(
//         //   title: Text('Profile Screen'),
//         // ),
//         body: _pages[_currentIndex],
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: _currentIndex,
//           onTap: (index) {
//             setState(() {
//               _currentIndex = index;
//             });
//           },
//           items: [
//             // BottomNavigationBarItem(
//             //   icon: Icon(Icons.home),
//             //   label: Strings.search,
//             // ),
//             BottomNavigationBarItem(
//               icon: customIcon != null
//                   ? Icon(BitmapDescriptorWidget(customIcon!))
//                   : Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.favorite),
//               label: 'Favorites',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: 'Profile',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// Widget search() {
//   return Center(
//     child: Text('Home Tab Content'),
//   );
// }
//
// Widget homeTabContent() {
//   return Center(
//     child: Text('Home Tab Content'),
//   );
// }
//
// Widget favoritesTabContent() {
//   return Center(
//     child: Text('Favorites Tab Content'),
//   );
// }
//
// Widget profileTabContent() {
//   return Center(
//     child: Text('Profile Tab Content'),
//   );
// }
