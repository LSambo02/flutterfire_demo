import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

// This has yet to be created..."
part 'minion.g.dart';

@JsonSerializable(explicitToJson: true)
class Minion {
  final String? name;
  final String? trait;
  final String? skill;
  final int? age;

  Minion(
      {required this.name,
      required this.trait,
      required this.skill,
      required this.age});

  factory Minion.fromJson(Map<String, dynamic> json) => _$MinionFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MinionToJson(this);
}

//
@Collection<Minion>('minions')
final minionsRef = MinionCollectionReference();
