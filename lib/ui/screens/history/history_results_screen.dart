import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_2022/core/config/di.dart';
import 'package:flutter_clean_architecture_2022/ui/const/dimens.dart';
import 'package:flutter_clean_architecture_2022/ui/screens/history/history_results_bloc.dart';

class HistoryResultsScreen extends StatelessWidget {
  HistoryResultsScreen({Key? key}) : super(key: key);

  final HistoryResultsBloc _bloc = getIt();

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
                .map(
                  (game) => Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: Dimens.MARGIN_M,
                      vertical: Dimens.MARGIN_S,
                    ),
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(Dimens.MARGIN_M),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              game.id,
                            ),
                          ),
                          Text(
                            "${game.roundsOKcount.toString()}/${game.roundsCount}",
                          ),
                          IconButton(
                            onPressed: () => _bloc.onRemoveGameClick(game.id),
                            icon: const Icon(Icons.delete_forever_rounded),
                          )
                        ],
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}
