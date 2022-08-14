// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class UserSetting extends DataClass implements Insertable<UserSetting> {
  final AppThemeOption selectedLanguage;
  UserSetting({required this.selectedLanguage});
  factory UserSetting.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return UserSetting(
      selectedLanguage: $UserSettingsTable.$converter0.mapToDart(
          const StringType().mapFromDatabaseResponse(
              data['${effectivePrefix}selected_language']))!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    {
      final converter = $UserSettingsTable.$converter0;
      map['selected_language'] =
          Variable<String>(converter.mapToSql(selectedLanguage)!);
    }
    return map;
  }

  UserSettingsCompanion toCompanion(bool nullToAbsent) {
    return UserSettingsCompanion(
      selectedLanguage: Value(selectedLanguage),
    );
  }

  factory UserSetting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserSetting(
      selectedLanguage:
          serializer.fromJson<AppThemeOption>(json['selectedLanguage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'selectedLanguage': serializer.toJson<AppThemeOption>(selectedLanguage),
    };
  }

  UserSetting copyWith({AppThemeOption? selectedLanguage}) => UserSetting(
        selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      );
  @override
  String toString() {
    return (StringBuffer('UserSetting(')
          ..write('selectedLanguage: $selectedLanguage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => selectedLanguage.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserSetting && other.selectedLanguage == this.selectedLanguage);
}

class UserSettingsCompanion extends UpdateCompanion<UserSetting> {
  final Value<AppThemeOption> selectedLanguage;
  const UserSettingsCompanion({
    this.selectedLanguage = const Value.absent(),
  });
  UserSettingsCompanion.insert({
    required AppThemeOption selectedLanguage,
  }) : selectedLanguage = Value(selectedLanguage);
  static Insertable<UserSetting> custom({
    Expression<AppThemeOption>? selectedLanguage,
  }) {
    return RawValuesInsertable({
      if (selectedLanguage != null) 'selected_language': selectedLanguage,
    });
  }

  UserSettingsCompanion copyWith({Value<AppThemeOption>? selectedLanguage}) {
    return UserSettingsCompanion(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (selectedLanguage.present) {
      final converter = $UserSettingsTable.$converter0;
      map['selected_language'] =
          Variable<String>(converter.mapToSql(selectedLanguage.value)!);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserSettingsCompanion(')
          ..write('selectedLanguage: $selectedLanguage')
          ..write(')'))
        .toString();
  }
}

class $UserSettingsTable extends UserSettings
    with TableInfo<$UserSettingsTable, UserSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserSettingsTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _selectedLanguageMeta =
      const VerificationMeta('selectedLanguage');
  @override
  late final GeneratedColumnWithTypeConverter<AppThemeOption, String?>
      selectedLanguage = GeneratedColumn<String?>(
              'selected_language', aliasedName, false,
              type: const StringType(), requiredDuringInsert: true)
          .withConverter<AppThemeOption>($UserSettingsTable.$converter0);
  @override
  List<GeneratedColumn> get $columns => [selectedLanguage];
  @override
  String get aliasedName => _alias ?? 'user_settings';
  @override
  String get actualTableName => 'user_settings';
  @override
  VerificationContext validateIntegrity(Insertable<UserSetting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    context.handle(_selectedLanguageMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  UserSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    return UserSetting.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $UserSettingsTable createAlias(String alias) {
    return $UserSettingsTable(attachedDatabase, alias);
  }

  static TypeConverter<AppThemeOption, String> $converter0 =
      const AppThemeOptionConverter();
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $UserSettingsTable userSettings = $UserSettingsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [userSettings];
}
