import 'package:drift/drift.dart';

import '../data/dao/base_dao.dart';
import '../data/models/base_table.dart';

abstract class BasePersistRepository<T extends BaseTable, R> {
  final BaseDao<T, R> dao;

  BasePersistRepository(this.dao);

  Future<List<R>> getAllItems() {
    return dao.findAll();
  }

  Stream<List<R>> getAllItemsAsStream() {
    return dao.findAllAsStream();
  }

  Stream<R?> getItemByIdAsStream(int id) {
    return dao.findByIdAsStream(id);
  }

  Future<R?> getItemById(int id) {
    return dao.findById(id);
  }

  Future<int> createItem(Insertable<R> entry){
    return dao.insertSingle(entry);
  }

  Future<int> deleteItemById(int id){
    return dao.deleteSingle(id);
  }

  Future<int> deleteAllItems(){
    return dao.deleteAll();
  }
}