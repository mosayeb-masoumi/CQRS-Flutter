
import 'package:cqrs_examples/server_example/repository.dart';
import 'package:flutter/material.dart';

import 'data_model.dart';
import 'handler.dart';

class SeverScreen extends StatefulWidget {
  const SeverScreen({super.key});

  @override
  State<SeverScreen> createState() => _SeverScreenState();
}

class _SeverScreenState extends State<SeverScreen> {
  final DataQueryHandler _queryHandler = DataQueryHandler();

  @override
  Widget build(BuildContext context) {
    return IServerScreen(
      queryHandler: _queryHandler,
    );
  }
}

class IServerScreen extends StatefulWidget {
  final DataQueryHandler queryHandler;
  const IServerScreen({super.key, required this.queryHandler});

  @override
  State<IServerScreen> createState() => _IServerScreenState();
}

class _IServerScreenState extends State<IServerScreen> {

  late DataQueryHandler _queryHandler;
  late Future<List<DataModel>> _dataFuture;

  @override
  void initState() {
    super.initState();
    _queryHandler = widget.queryHandler;
    _dataFuture = _queryHandler.executeQuery(FetchDataQuery());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CQRS API Example')),
      body: Center(
        child: FutureBuilder<List<DataModel>>(
          future: _dataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final dataList = snapshot.data ?? [];
              return ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(dataList[index].title),
                    subtitle: Text(dataList[index].body),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}