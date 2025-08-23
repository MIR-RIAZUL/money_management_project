// import 'package:flutter/material.dart';
//
// class drawer extends StatelessWidget {
//   const drawer({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           Container(
//             color: Colors.teal,
//             child: SafeArea(
//               child: Stack(
//                 children: [
//                   DrawerHeader(
//                     decoration: BoxDecoration(color: Colors.teal),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         CircleAvatar(
//                           radius: 39,
//                           backgroundImage: NetworkImage(
//                             "https://scontent.fdac189-1.fna.fbcdn.net/v/t39.30808-6/498692148_2403836573324104_1909885292037843185_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=cc71e4&_nc_eui2=AeEVoUPyQnEvaf0hWgVl0Rh5QILtjBdjuYhAgu2MF2O5iPq5jpCoadpblyZnf4v4lcTRh1uy1iM4hBN7L2dkd4Ab&_nc_ohc=H3q565fx_YgQ7kNvwGvdBQG&_nc_oc=Adkdn0LQolkR1xlqEIQEF-Efx7nDtijEstoZOi4qEOf-YUQHuajQugz-SF9xCRNc1CY&_nc_zt=23&_nc_ht=scontent.fdac189-1.fna&_nc_gid=GyR5ExO4TXsMJBa5fpU7Cg&oh=00_AfVob-7ivuLLT36KPX_j26DOlnoZi1AhN0tvBjqZsFQV1w&oe=68AFB9CC",
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           "Mir Riazul",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           "mirriazul859@.com",
//                           style: TextStyle(
//                             color: Colors.white70,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                     top: 20,
//                     right: 16,
//                     child: Container(
//                       padding: EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.2),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Text(
//                         "Balance: ₹${calculateBalance().toStringAsFixed(2)}",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 60,
//                     right: 16,
//                     child: Container(
//                       padding: EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.2),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Text(
//                         "Earning: ₹${calculateTotalEarnings().toStringAsFixed(2)}",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 100,
//                     right: 16,
//                     child: Container(
//                       padding: EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         color: Colors.white.withOpacity(0.2),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Text(
//                         "Earning: ₹${calculateTotalExpenses().toStringAsFixed(2)}",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           // Add other drawer items here
//           ListTile(
//             leading: Icon(Icons.home),
//             title: Text('Home'),
//             onTap: () {
//               Navigator.pop(context);
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.settings),
//             title: Text('Settings'),
//             onTap: () {
//               Navigator.pop(context);
//             },
//           ),
//         ],
//       ),
//     ),
//     );
//
//   }
// }
