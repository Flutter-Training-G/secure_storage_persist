import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const _keyCounter = 'counter';

class CounterStore {
  static final _storage = FlutterSecureStorage();
  static late final int counter;

  static void storeCounter(int counter) async {
    await _storage.write(key: _keyCounter, value: counter.toString());
  }

  static Future<void> retrieveCounter() async {
    var counterTemp = await _storage.read(key: _keyCounter) ?? "0";
    counter = int.tryParse(counterTemp) ?? 0;
  }
}
