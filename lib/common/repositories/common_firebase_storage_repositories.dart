import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//This defines a Riverpod Provider that creates instances of
//CommonFirebaseStorageRepository. It initializes the repository
//with an instance of FirebaseStorage.
final commonFirebaseStorageRepositoryProvider = Provider(
  (ref) => CommonFirebaseStorageRepository(
    firebaseStorage: FirebaseStorage.instance,
  ),
);

// This class encapsulates the functionality related to Firebase
// Storage operations.
class CommonFirebaseStorageRepository {
  final FirebaseStorage firebaseStorage;
  CommonFirebaseStorageRepository({
    required this.firebaseStorage,
  });

  Future<String> storeFileToFirebase(String ref, File file) async {
    //It uses putFile method of firebaseStorage.ref().child(ref) to
    //upload the file to Firebase Storage. This method returns an UploadTask.
    UploadTask uploadTask = firebaseStorage.ref().child(ref).putFile(file);

    //This waits for the upload task to complete and returns a TaskSnapshot
    //once the upload is finished.
    TaskSnapshot snap = await uploadTask;

    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
}
