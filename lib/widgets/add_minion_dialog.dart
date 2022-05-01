import 'package:flutter/material.dart';
import 'package:flutterfire_demo/services/firestore_service.dart';

import '../models/minion.dart';

class AddMinion extends StatelessWidget {
  double width;
  String minionName = '';
  FirestoreService firestoreService = FirestoreService();
  TextEditingController minionNameController = TextEditingController();

  AddMinion({
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        title: Center(child: Text('ADICIONAR MINION')),
        content: Container(
            width: width,
            height: 100,
            child: TextField(
              onChanged: (value) => minionName = value,
              decoration: InputDecoration(hintText: 'Nome do Minion a criar'),
            )),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ButtonTheme(
                height: 40,
                minWidth: 30,
                child: Container(
                  margin: EdgeInsets.only(right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            'ADICIONAR',
                          ),
                          onPressed: () async {
                            if (minionName != null) {
                              Minion minion = Minion(
                                  name: minionName,
                                  age: 12,
                                  skill: 'Sing',
                                  trait: 'Gums');
                              String _message =
                                  await firestoreService.addMinion(minion);
                              print(_message);
                              Navigator.pop(context);
                            }
                          }),
                      SizedBox(
                        width: width / 40,
                      ),
                      RaisedButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Text(
                            'FECHAR',
                          ),
                          onPressed: () => Navigator.pop(context)),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
