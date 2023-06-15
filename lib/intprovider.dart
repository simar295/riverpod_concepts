import 'package:riverpod/riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final normalprovider = Provider((ref) {
  return "simarprovided";
});

final intprovider = StateProvider((ref) {
  return "simarstateprovided";
});
