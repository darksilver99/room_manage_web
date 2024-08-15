import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ConfigRecord extends FirestoreRecord {
  ConfigRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "store_ios_link" field.
  String? _storeIosLink;
  String get storeIosLink => _storeIosLink ?? '';
  bool hasStoreIosLink() => _storeIosLink != null;

  // "store_android_link" field.
  String? _storeAndroidLink;
  String get storeAndroidLink => _storeAndroidLink ?? '';
  bool hasStoreAndroidLink() => _storeAndroidLink != null;

  // "contact" field.
  List<String>? _contact;
  List<String> get contact => _contact ?? const [];
  bool hasContact() => _contact != null;

  void _initializeFields() {
    _storeIosLink = snapshotData['store_ios_link'] as String?;
    _storeAndroidLink = snapshotData['store_android_link'] as String?;
    _contact = getDataList(snapshotData['contact']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('config');

  static Stream<ConfigRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ConfigRecord.fromSnapshot(s));

  static Future<ConfigRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ConfigRecord.fromSnapshot(s));

  static ConfigRecord fromSnapshot(DocumentSnapshot snapshot) => ConfigRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ConfigRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ConfigRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ConfigRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ConfigRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createConfigRecordData({
  String? storeIosLink,
  String? storeAndroidLink,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'store_ios_link': storeIosLink,
      'store_android_link': storeAndroidLink,
    }.withoutNulls,
  );

  return firestoreData;
}

class ConfigRecordDocumentEquality implements Equality<ConfigRecord> {
  const ConfigRecordDocumentEquality();

  @override
  bool equals(ConfigRecord? e1, ConfigRecord? e2) {
    const listEquality = ListEquality();
    return e1?.storeIosLink == e2?.storeIosLink &&
        e1?.storeAndroidLink == e2?.storeAndroidLink &&
        listEquality.equals(e1?.contact, e2?.contact);
  }

  @override
  int hash(ConfigRecord? e) => const ListEquality()
      .hash([e?.storeIosLink, e?.storeAndroidLink, e?.contact]);

  @override
  bool isValidKey(Object? o) => o is ConfigRecord;
}
