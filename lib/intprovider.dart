import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final normalprovider = Provider((ref) {
  return "normal";
});

final intprovider = StateProvider((ref) {
  return "normalint";
});
