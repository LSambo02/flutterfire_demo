// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minion.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class MinionCollectionReference
    implements MinionQuery, FirestoreCollectionReference<MinionQuerySnapshot> {
  factory MinionCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$MinionCollectionReference;

  static Minion fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Minion.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Minion value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  MinionDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<MinionDocumentReference> add(Minion value);
}

class _$MinionCollectionReference extends _$MinionQuery
    implements MinionCollectionReference {
  factory _$MinionCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$MinionCollectionReference._(
      firestore.collection('minions').withConverter(
            fromFirestore: MinionCollectionReference.fromFirestore,
            toFirestore: MinionCollectionReference.toFirestore,
          ),
    );
  }

  _$MinionCollectionReference._(
    CollectionReference<Minion> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Minion> get reference =>
      super.reference as CollectionReference<Minion>;

  @override
  MinionDocumentReference doc([String? id]) {
    return MinionDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<MinionDocumentReference> add(Minion value) {
    return reference.add(value).then((ref) => MinionDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$MinionCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class MinionDocumentReference
    extends FirestoreDocumentReference<MinionDocumentSnapshot> {
  factory MinionDocumentReference(DocumentReference<Minion> reference) =
      _$MinionDocumentReference;

  DocumentReference<Minion> get reference;

  /// A reference to the [MinionCollectionReference] containing this document.
  MinionCollectionReference get parent {
    return _$MinionCollectionReference(reference.firestore);
  }

  @override
  Stream<MinionDocumentSnapshot> snapshots();

  @override
  Future<MinionDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String? name,
    String? trait,
    String? skill,
    int? age,
  });

  Future<void> set(Minion value);
}

class _$MinionDocumentReference
    extends FirestoreDocumentReference<MinionDocumentSnapshot>
    implements MinionDocumentReference {
  _$MinionDocumentReference(this.reference);

  @override
  final DocumentReference<Minion> reference;

  /// A reference to the [MinionCollectionReference] containing this document.
  MinionCollectionReference get parent {
    return _$MinionCollectionReference(reference.firestore);
  }

  @override
  Stream<MinionDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return MinionDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<MinionDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return MinionDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? name = _sentinel,
    Object? trait = _sentinel,
    Object? skill = _sentinel,
    Object? age = _sentinel,
  }) async {
    final json = {
      if (name != _sentinel) "name": name as String?,
      if (trait != _sentinel) "trait": trait as String?,
      if (skill != _sentinel) "skill": skill as String?,
      if (age != _sentinel) "age": age as int?,
    };

    return reference.update(json);
  }

  Future<void> set(Minion value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is MinionDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class MinionDocumentSnapshot extends FirestoreDocumentSnapshot {
  MinionDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Minion> snapshot;

  @override
  MinionDocumentReference get reference {
    return MinionDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Minion? data;
}

abstract class MinionQuery implements QueryReference<MinionQuerySnapshot> {
  @override
  MinionQuery limit(int limit);

  @override
  MinionQuery limitToLast(int limit);

  MinionQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  MinionQuery whereTrait({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  MinionQuery whereSkill({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  MinionQuery whereAge({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  });

  MinionQuery orderByName({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    MinionDocumentSnapshot? startAtDocument,
    MinionDocumentSnapshot? endAtDocument,
    MinionDocumentSnapshot? endBeforeDocument,
    MinionDocumentSnapshot? startAfterDocument,
  });

  MinionQuery orderByTrait({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    MinionDocumentSnapshot? startAtDocument,
    MinionDocumentSnapshot? endAtDocument,
    MinionDocumentSnapshot? endBeforeDocument,
    MinionDocumentSnapshot? startAfterDocument,
  });

  MinionQuery orderBySkill({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    MinionDocumentSnapshot? startAtDocument,
    MinionDocumentSnapshot? endAtDocument,
    MinionDocumentSnapshot? endBeforeDocument,
    MinionDocumentSnapshot? startAfterDocument,
  });

  MinionQuery orderByAge({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    MinionDocumentSnapshot? startAtDocument,
    MinionDocumentSnapshot? endAtDocument,
    MinionDocumentSnapshot? endBeforeDocument,
    MinionDocumentSnapshot? startAfterDocument,
  });
}

class _$MinionQuery extends QueryReference<MinionQuerySnapshot>
    implements MinionQuery {
  _$MinionQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Minion> reference;

  MinionQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Minion> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return MinionQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<MinionDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: MinionDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return MinionQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<MinionQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<MinionQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  MinionQuery limit(int limit) {
    return _$MinionQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  MinionQuery limitToLast(int limit) {
    return _$MinionQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  MinionQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$MinionQuery(
      reference.where(
        'name',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  MinionQuery whereTrait({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$MinionQuery(
      reference.where(
        'trait',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  MinionQuery whereSkill({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$MinionQuery(
      reference.where(
        'skill',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  MinionQuery whereAge({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  }) {
    return _$MinionQuery(
      reference.where(
        'age',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  MinionQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MinionDocumentSnapshot? startAtDocument,
    MinionDocumentSnapshot? endAtDocument,
    MinionDocumentSnapshot? endBeforeDocument,
    MinionDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('name', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$MinionQuery(query, _collection);
  }

  MinionQuery orderByTrait({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MinionDocumentSnapshot? startAtDocument,
    MinionDocumentSnapshot? endAtDocument,
    MinionDocumentSnapshot? endBeforeDocument,
    MinionDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('trait', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$MinionQuery(query, _collection);
  }

  MinionQuery orderBySkill({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MinionDocumentSnapshot? startAtDocument,
    MinionDocumentSnapshot? endAtDocument,
    MinionDocumentSnapshot? endBeforeDocument,
    MinionDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('skill', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$MinionQuery(query, _collection);
  }

  MinionQuery orderByAge({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MinionDocumentSnapshot? startAtDocument,
    MinionDocumentSnapshot? endAtDocument,
    MinionDocumentSnapshot? endBeforeDocument,
    MinionDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('age', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$MinionQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$MinionQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class MinionQuerySnapshot
    extends FirestoreQuerySnapshot<MinionQueryDocumentSnapshot> {
  MinionQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Minion> snapshot;

  @override
  final List<MinionQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<MinionDocumentSnapshot>> docChanges;
}

class MinionQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements MinionDocumentSnapshot {
  MinionQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Minion> snapshot;

  @override
  MinionDocumentReference get reference {
    return MinionDocumentReference(snapshot.reference);
  }

  @override
  final Minion data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Minion _$MinionFromJson(Map<String, dynamic> json) => Minion(
      name: json['name'] as String?,
      trait: json['trait'] as String?,
      skill: json['skill'] as String?,
      age: json['age'] as int?,
    );

Map<String, dynamic> _$MinionToJson(Minion instance) => <String, dynamic>{
      'name': instance.name,
      'trait': instance.trait,
      'skill': instance.skill,
      'age': instance.age,
    };
