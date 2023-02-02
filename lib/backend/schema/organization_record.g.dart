// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrganizationRecord> _$organizationRecordSerializer =
    new _$OrganizationRecordSerializer();

class _$OrganizationRecordSerializer
    implements StructuredSerializer<OrganizationRecord> {
  @override
  final Iterable<Type> types = const [OrganizationRecord, _$OrganizationRecord];
  @override
  final String wireName = 'OrganizationRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, OrganizationRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.users;
    if (value != null) {
      result
        ..add('users')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  OrganizationRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrganizationRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'users':
          result.users.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$OrganizationRecord extends OrganizationRecord {
  @override
  final String? name;
  @override
  final BuiltList<DocumentReference<Object?>>? users;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$OrganizationRecord(
          [void Function(OrganizationRecordBuilder)? updates]) =>
      (new OrganizationRecordBuilder()..update(updates))._build();

  _$OrganizationRecord._({this.name, this.users, this.ffRef}) : super._();

  @override
  OrganizationRecord rebuild(
          void Function(OrganizationRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrganizationRecordBuilder toBuilder() =>
      new OrganizationRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrganizationRecord &&
        name == other.name &&
        users == other.users &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, name.hashCode), users.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrganizationRecord')
          ..add('name', name)
          ..add('users', users)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class OrganizationRecordBuilder
    implements Builder<OrganizationRecord, OrganizationRecordBuilder> {
  _$OrganizationRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<DocumentReference<Object?>>? _users;
  ListBuilder<DocumentReference<Object?>> get users =>
      _$this._users ??= new ListBuilder<DocumentReference<Object?>>();
  set users(ListBuilder<DocumentReference<Object?>>? users) =>
      _$this._users = users;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  OrganizationRecordBuilder() {
    OrganizationRecord._initializeBuilder(this);
  }

  OrganizationRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _users = $v.users?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrganizationRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrganizationRecord;
  }

  @override
  void update(void Function(OrganizationRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrganizationRecord build() => _build();

  _$OrganizationRecord _build() {
    _$OrganizationRecord _$result;
    try {
      _$result = _$v ??
          new _$OrganizationRecord._(
              name: name, users: _users?.build(), ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'users';
        _users?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OrganizationRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
