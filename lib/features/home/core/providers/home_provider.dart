import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:thatnightin/features/home/core/database/home_db.dart';
import 'package:thatnightin/features/home/core/services/home_service.dart';

// Home service provider : manages state of football-api calls
final homeServiceProvider = Provider<HomeService>((ref) => HomeService());

// Home DB provider : manages state of firebase methods
final homeDBProvider = Provider<HomeDb>((ref) => HomeDb());

// Loading state for image upload
final imageLoadingProvider = StateProvider<bool>((ref) => false);

// Image upload
class ImageController {
  final Ref ref;

  ImageController(this.ref);

  final ImagePicker _picker = ImagePicker();

  // Pick Image
  Future<XFile?> pickImage() async {
    try {
      ref.read(imageLoadingProvider.notifier).state = true;

      final XFile? pickedImage = await _picker.pickImage(
        source: ImageSource.gallery,
      );

      if(pickedImage != null){
        ref.read(pickedImageProvider.notifier).state = pickedImage;
      }
    } catch (e) {
      // Something went wrong
    }finally{
      ref.read(imageLoadingProvider.notifier).state = false;
    }
  }
}

// Holds picked image till upload
final pickedImageProvider = StateProvider<XFile?>((ref) => null);

// Controller provider
final imageControllerProvider = Provider<ImageController>(
  (ref) => ImageController(ref),
);
