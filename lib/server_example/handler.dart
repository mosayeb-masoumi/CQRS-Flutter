import 'package:cqrs_examples/server_example/query.dart';
import 'package:cqrs_examples/server_example/repository.dart';

import 'data_model.dart';

class DataQueryHandler {
  DataQuery _dataQuery = FetchDataQuery();

  Future<List<DataModel>> executeQuery(DataQuery query) async {
    return await query.dataList();
  }
}
