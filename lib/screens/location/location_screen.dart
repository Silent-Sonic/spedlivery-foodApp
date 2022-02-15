// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class LocationScreen extends StatelessWidget {
//   const LocationScreen({Key? key}) : super(key: key);
//   static const String routeName = "/location";

//   static Route route() {
//     return MaterialPageRoute(
//       builder: (_) => LocationScreen(),
//       settings: RouteSettings(name: routeName),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height,
//             width: double.infinity,
//             child: GoogleMap(
//               initialCameraPosition: CameraPosition(
//                 target: LatLng(10, 10),
//                 zoom: 5,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
