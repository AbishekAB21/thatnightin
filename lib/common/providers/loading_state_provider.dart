import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Use this widget for loading state purposes.

final loadingProvider = StateProvider<bool>((ref) => false);