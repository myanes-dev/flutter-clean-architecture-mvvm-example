import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_2022/ui/const/dimens.dart';
import 'package:flutter_clean_architecture_2022/ui/screens/history/history_results_bloc.dart';

class HistoryResultsScreen extends StatelessWidget {
  HistoryResultsScreen({Key? key}) : super(key: key);

  final HistoryResultsBloc _bloc = HistoryResultsBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('History Results')),
      body: BlocBuilder<HistoryResultsBloc, HistoryResultsState>(
          bloc: _bloc,
          builder: (_, state) {
            if (state.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: state.results
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(Dimens.MARGIN_M),
                        child: Center(child: Text(e.isSuccess.toString())),
                      ))
                  .toList(),
            );
          }),
    );
  }
}
