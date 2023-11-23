import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_management/provider/top_scorer_provider.dart';
import 'package:state_management/view/page3.dart';

class TopScorer extends ConsumerWidget {
  const TopScorer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Map<String, dynamic>> players = [
      {'name': 'CRISTIANO RONALDO', 'goals': ref.watch(ronaldoProvider)},
      {'name': 'LIONAL MESSI', 'goals': ref.watch(messiProvider)},
      {'name': 'NEYMAR JR', 'goals': ref.watch(neymarProvider)},
    ];
    players.sort((a, b) => (b['goals']).compareTo(a['goals']));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Scorer'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GoldenBoot(list: players),
                    ));
              },
              icon: const Icon(Icons.arrow_forward))
        ],
      ),
      body: ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(players[index]['name'].toString()),
            trailing: Text('${players[index]['goals']}'),
          );
        },
      ),
    );
  }
}
