import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'organization_record.g.dart';

abstract class OrganizationRecord
    implements Built<OrganizationRecord, OrganizationRecordBuilder> {
  static Serializer<OrganizationRecord> get serializer =>
      _$organizationRecordSerializer;

  String? get name;

  BuiltList<DocumentReference>? get users;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(OrganizationRecordBuilder builder) => builder
    ..name = ''
    ..users = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('organization');

  static Stream<OrganizationRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<OrganizationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  OrganizationRecord._();
  factory OrganizationRecord(
          [void Function(OrganizationRecordBuilder) updates]) =
      _$OrganizationRecord;

  static OrganizationRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createOrganizationRecordData({
  String? name,
}) {
  final firestoreData = serializers.toFirestore(
    OrganizationRecord.serializer,
    OrganizationRecord(
      (o) => o
        ..name = name
        ..users = null,
    ),
  );

  return firestoreData;
}
