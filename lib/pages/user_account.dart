import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:commerce/read_data.dart/get_user_email.dart';
import 'package:commerce/read_data.dart/get_user_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserAccount extends StatefulWidget {
  UserAccount({super.key});

  @override
  State<UserAccount> createState() => _UserAccountState();
}

class _UserAccountState extends State<UserAccount> {
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  //document id
  List<String> docIDs = [];
  //get docIDs
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('info').orderBy('age',descending: true).get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference);
            docIDs.add(document.reference.id);
          }),
        );
  }

  // @override
  // void initState() {
  //   getDocId();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:Theme.of(context).colorScheme.secondary,
          actions: [
            IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))
          ],
        ),
        body: Column(
          children: [
            Center(child: Text("Logged In As:" + user.email!)),
            Expanded(
                child: FutureBuilder(
              future: getDocId(),
              builder: (context, snapshot) {
                return ListView.builder(
                    itemCount: docIDs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: GetUserName(documentId: docIDs[index]),
                          subtitle: GetUserEmail(documentId: docIDs[index]),
                          tileColor: Theme.of(context).colorScheme.secondary,
                        ),
                      );
                    });
              },
            )),
          ],
        ));
  }
}
