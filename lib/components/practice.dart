// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class Practice extends ChangeNotifier {
//   final _firestore = FirebaseFirestore.instance;
//   late Future<List<Map<String, dynamic>>> _users;

//   @override
//   void initState() {
//     super.initState();
//     _users = _fetchUsers();
//   }

//   Future<List<Map<String, dynamic>>> _fetchUsers() async {
//     try {
//       QuerySnapshot querySnapshot = await _firestore.collection('users').get();
//       return querySnapshot.docs
//           .map((doc) => doc.data() as Map<String, dynamic>)
//           .toList();
//     } catch (e) {
//       print('Error fetching hostels: $e');
//       return [];
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Map<String, dynamic>>>(
//         future: _users, builder: (context, snapshot) {});
//   }
// }
