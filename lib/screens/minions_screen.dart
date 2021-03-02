import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_demo/helpers/constantes.dart';
import 'package:flutterfire_demo/services/firestore_service.dart';
import 'package:flutterfire_demo/widgets/add_minion_dialog.dart';

class MinionsScreen extends StatefulWidget {
  @override
  _MinionsScreenState createState() => _MinionsScreenState();
}

class _MinionsScreenState extends State<MinionsScreen> {
  FirestoreService firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minions'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    return AddMinion(width: widthScreen(context));
                  }))
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.minions.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Occorreu um erro');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: Text("SEM DADOS"),
            );
          }
          return new ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              return new ListTile(
                title: new Text(
                  document.data()['nome'],
                  style: TextStyle(fontSize: 20),
                ),
                leading: CircleAvatar(
                  radius: 30,
                  child: Image.asset(
                    'assets/minions.png',
                  ),
                ),
                subtitle: Divider(
                  thickness: 2,
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
