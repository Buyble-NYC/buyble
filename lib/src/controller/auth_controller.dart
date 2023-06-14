import 'dart:io';

import 'package:buyble_real/src/model/b_user.dart';
import 'package:buyble_real/src/repository/user_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  Rx<BUser> myUser = BUser().obs;

  Future<BUser?> login(String uid) async {
    BUser? data = await UserRepository.loginByUid(uid);
    if( data != null ){
      myUser(data);
    }
    return data;
  }

  signup(BUser newUser, XFile? imageFile) async {
    if (imageFile == null) {
      String docId = await UserRepository.signup(newUser);
      myUser(newUser.copyWith(docId: docId));

    } else {
      UploadTask task = uploadXFile(imageFile,
          '${newUser.uid}/profile.${imageFile.path.split('.').last}'); //근데 jpg아닐수도 있어서 케이스 돌리셈
      task.snapshotEvents.listen((event) async {
        if( event.bytesTransferred == event.totalBytes && event.state == TaskState.success ){
          var downloadUrl =await  event.ref.getDownloadURL();
          var updatedUserData = newUser.copyWith( thumbnail : downloadUrl );
          String docId = await UserRepository.signup(updatedUserData);
          myUser(updatedUserData.copyWith(docId: docId));



        }
      });

    }
  }

  uploadXFile(XFile filee, String fileName) {
    var f = File(filee.path);
    var ref = FirebaseStorage.instance.ref().child("users").child(fileName);
    final metadata = SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': filee.path});
    return ref.putFile(f, metadata);
  }
}
