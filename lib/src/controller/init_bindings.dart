import 'package:buyble_real/src/controller/auth_controller.dart';
import 'package:buyble_real/src/controller/bottom_controller.dart';
import 'package:get/get.dart';

class InitBindings extends Bindings {

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(BottomController(), permanent:  true );
    Get.put(AuthController(), permanent:  true );
  }
}