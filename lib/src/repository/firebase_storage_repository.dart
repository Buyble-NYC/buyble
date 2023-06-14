


import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageRepository {

  static UploadTask uploadFile(File file, String fileName, String uid ) {

    UploadTask uploadTask;

    // Create a Reference to the file
    Reference ref = FirebaseStorage.instance
        .ref()
        .child('user/$uid')
        .child('/$fileName.jpg');

    uploadTask = ref.putFile(file);
    return uploadTask;
  }





}