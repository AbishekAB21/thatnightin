
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:thatnightin/features/home/core/services/home_service.dart';


// Home service provider : manages state of football-api calls
final homeServiceProvider = Provider<HomeService>((ref)=> HomeService());