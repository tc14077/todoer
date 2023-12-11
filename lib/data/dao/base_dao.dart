import 'package:drift/drift.dart';
import 'package:todoer/data/database/app_database.dart';
import 'package:todoer/data/models/base_table.dart';

extension FindById<Table extends HasResultSet, Row>
    on ResultSetImplementation<Table, Row> {
  Selectable<Row> findById(int id) {
    return select()
      ..where((row) {
        final idColumn = columnsByName['id'];
        if (idColumn == null) {
          throw ArgumentError.value(
              this, 'this', 'Must be a table with an id column');
        }
        if (idColumn.type != DriftSqlType.int) {
          throw ArgumentError('Column `id` is not an integer');
        }
        return idColumn.equals(id);
      });
  }

  Selectable<Row> findByIds(Set<int> ids) {
    return select()
      ..where((row) {
        final idColumn = columnsByName['id'];
        if (idColumn == null) {
          throw ArgumentError.value(
              this, 'this', 'Must be a table with an id column');
        }
        if (idColumn.type != DriftSqlType.int) {
          throw ArgumentError('Column `id` is not an integer');
        }
        return idColumn.isIn(ids);
      });
  }
}

extension DeleteById<TableDsl extends Table, D> on TableInfo<TableDsl, D> {
  DeleteStatement<TableDsl, D> deleteById(int id) {
    return delete()
      ..where((row) {
        final idColumn = columnsByName['id'];
        if (idColumn == null) {
          throw ArgumentError.value(
              this, 'this', 'Must be a table with an id column');
        }
        if (idColumn.type != DriftSqlType.int) {
          throw ArgumentError('Column `id` is not an integer');
        }
        return idColumn.equals(id);
      });
  }
}

extension UpdateById<TableDsl extends Table, D> on TableInfo<TableDsl, D> {
  UpdateStatement<TableDsl, D> updateById(int id) {
    return update()
      ..where((row) {
        final idColumn = columnsByName['id'];
        if (idColumn == null) {
          throw ArgumentError.value(
              this, 'this', 'Must be a table with an id column');
        }
        if (idColumn.type != DriftSqlType.int) {
          throw ArgumentError('Column `id` is not an integer');
        }
        return idColumn.equals(id);
      });
  }
}

class BaseDao<K extends BaseTable, R> {
  final AppDatabase appDatabase;
  final ResultSetImplementation<K, R> table;

  BaseDao({required this.appDatabase, required this.table});

  Future<List<R>> findAll() {
    final query = appDatabase.select(table);
    return query.get();
  }

  Stream<List<R>> findAllAsStream() {
    final query = appDatabase.select(table);
    return query.watch();
  }

  Stream<R?> findByIdAsStream(int id) {
    final query = table.findById(id);
    return query.watchSingle();
  }

  Future<R> findById(int id) {
    return table.findById(id).getSingle();
  }

  Future<List<R>> findByIds(Set<int> ids) {
    return table.findByIds(ids).get();
  }

  // insert
  Future<int> insertSingle(Insertable<R> entry) {
    return (table as TableInfo).insertOne(entry);
  }

  // insert
  Future<void> insertMultiple(List<Insertable<R>> rs) {
    return (table as TableInfo).insertAll(rs);
  }

  // insert
  Future<int> updateSingle(int id, Insertable<R> entry) {
    return (table as TableInfo).updateById(id).write(entry);
  }

  // // Update(onConflict: OnConflictStrategy.ignore)
  // Future<int> updateSingle(T t);

  // // Update(onConflict: OnConflictStrategy.ignore)
  // Future<int> updateMultiple(List<T> ts);

  // // delete
  // Future<int> deleteMultiple(List<T> ts);

  Future<int> deleteSingle(int id) async {
    return (table as TableInfo).deleteById(id).go();
  }

  Future<int> deleteAll() {
    return (table as TableInfo).deleteAll();
  }

  // // transaction
  // Future<void> upsertSingle(T newModel) async {
  //   final oldModel = await findById(newModel.id);
  //   if (oldModel == null) {
  //     await insertSingle(newModel);
  //   } else {
  //     await updateSingle(newModel);
  //   }
  // }

  // // transaction
  // Future<void> upsertMultiple(List<T> newModels) async {
  //   final newModelsids = newModels.map((model) => model.id).toList();
  //   final oldModels = await findByIds(newModelsids);
  //   final oldModelsIds = oldModels.map((model) => model.id).toList();
  //   List<T> modelsUpdate = [];
  //   List<T> modelsInsert = [];
  //   newModels.forEach((model) {
  //     oldModelsIds.contains(model.id)
  //         ? modelsUpdate.add(model)
  //         : modelsInsert.add(model);
  //   });
  //   await insertMultiple(modelsInsert);
  //   await updateMultiple(modelsUpdate);
  // }
}
