import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

// This doesn't exist yet...! See "Next Steps"
part 'minion.g.dart';

@JsonSerializable(explicitToJson: true)
class Minion {
  final String name;
  final String trait;
  final String skill;
  final int age;

  Minion(
      {required this.name,
      required this.trait,
      required this.skill,
      required this.age});
}

@Collection<Minion>('minions')
final minionsRef = MinionCollectionReference();
