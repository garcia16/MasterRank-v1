import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart';


class Storage {
  final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

var storageimage = FirebaseStorage.instance.ref();
  Future<void> uploadFile(
    String filePath,
    String fileName,
  ) async {
    File file = File(filePath);
    try {
      //await storage.ref(fileName).putFile(file);
      UploadTask task = storage.ref(fileName).putFile(file);
    
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }
  
}