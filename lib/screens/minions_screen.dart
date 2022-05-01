import 'dart:developer';

import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_demo/helpers/constantes.dart';
import 'package:flutterfire_demo/models/minion.dart';
import 'package:flutterfire_demo/widgets/add_minion_dialog.dart';

class MinionsScreen extends StatefulWidget {
  @override
  _MinionsScreenState createState() => _MinionsScreenState();
}

class _MinionsScreenState extends State<MinionsScreen> {
  FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Minions'),
          actions: [
            remoteConfig.getBool(btn_pos)
                ? SizedBox()
                : IconButton(
                    iconSize: remoteConfig.getDouble(btn_thickness),
                    icon: Icon(Icons.add),
                    onPressed: () => showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AddMinion(width: widthScreen(context));
                        }))
          ],
        ),
        body: FirestoreBuilder<MinionQuerySnapshot>(
          ref: minionsRef,
          builder: (BuildContext context,
              AsyncSnapshot<MinionQuerySnapshot> snapshot, Widget? child) {
            if (snapshot.hasError) {
              log(snapshot.error.toString());
              return Center(child: Text('An error has occured!'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData) {
              return Center(
                child: Text("No Data!"),
              );
            }

            MinionQuerySnapshot minionSnapshot = snapshot.requireData;

            return new ListView.builder(
              itemCount: minionSnapshot.docs.length,
              itemBuilder: (context, index) {
                Minion minion = minionSnapshot.docs[index].data;
                return new ListTile(
                  title: new Text(
                    minion.name!.toString(),
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
              },
            );
          },
        ),
        floatingActionButton: remoteConfig.getBool(btn_pos)
            ? FloatingActionButton(
                child: Icon(Icons.add,
                    size: remoteConfig.getDouble(btn_thickness)),
                onPressed: () => showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return AddMinion(width: widthScreen(context));
                    }),
              )
            : SizedBox());
  }
}
