import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoldenBoot extends ConsumerWidget {
  final List<Map<String, dynamic>?> list;
  const GoldenBoot({super.key, required this.list});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Golden Boot Winner'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${list[0]!["name"]} is the GOLDEN BOOT winner!!'.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ));
  }
}
