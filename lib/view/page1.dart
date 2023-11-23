import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/provider/top_scorer_provider.dart';
import 'package:state_management/view/page2.dart';

class GoalCount extends ConsumerWidget {
  const GoalCount({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> playersNames = [
      'LIONAL MESSI',
      'CRISTIANO RONALDO',
      'NEYMAR JR'
    ];
    List<dynamic> goalsWatch = [
      ref.watch(messiProvider),
      ref.watch(ronaldoProvider),
      ref.watch(neymarProvider),
    ];
    List<dynamic> goalsRead = [
      ref.read(messiProvider.notifier),
      ref.read(ronaldoProvider.notifier),
      ref.read(neymarProvider.notifier),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Goal Count and update'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TopScorer(),
                    ));
              },
              icon: const Icon(Icons.arrow_forward))
        ],
      ),
      body: ListView.builder(
        itemCount: playersNames.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(playersNames[index]),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(goalsWatch[index].toString()),
              IconButton(
                  onPressed: () {
                    goalsRead[index].state++;
                  },
                  icon: const Icon(Icons.add)),
            ],
          ),
        ),
      ),
    );
  }
}
