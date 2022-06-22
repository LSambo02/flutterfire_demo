import 'package:flutter/material.dart';

class MinionCard extends StatelessWidget {
  String? minionName, minionTrait;
  MinionCard(this.minionName, this.minionTrait, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.yellow,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2.5,
            height: 200,
            child: Ink.image(
              image: AssetImage('assets/minions.png'),
            ),
          ),
          ListTile(
            title: RichText(
              text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  text: 'Hi, I\'m ',
                  children: [
                    TextSpan(
                        text: '${minionName!}',
                        style: TextStyle(fontWeight: FontWeight.w600))
                  ]),
            ),
            subtitle: RichText(
              text: TextSpan(
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                  text: 'I love ',
                  children: [
                    TextSpan(
                        text: '${minionTrait!}',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600))
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
