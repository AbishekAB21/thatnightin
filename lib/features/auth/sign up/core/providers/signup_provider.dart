import 'package:riverpod/riverpod.dart';

final ifNameEnteredProvider = StateProvider<bool>((ref) => false);
final enterednameProvider = StateProvider<String>((ref) => '');