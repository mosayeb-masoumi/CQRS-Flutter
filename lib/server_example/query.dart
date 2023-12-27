import 'data_model.dart';

abstract class DataQuery {
  Future<List<DataModel>> dataList();
}