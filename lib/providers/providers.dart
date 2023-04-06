import 'package:flutter_riverpod/flutter_riverpod.dart';

final tabProvider = StateNotifierProvider<TabNotifier, int>((ref) {
  return TabNotifier();
});

class TabNotifier extends StateNotifier<int> {
  TabNotifier() : super(0);

  set setTab(int index) => state = index;
}
