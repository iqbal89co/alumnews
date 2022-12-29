import 'dart:typed_data';
import 'package:alumnews/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:alumnews/models/user.dart' as model;
import 'package:alumnews/resources/storage_methods.dart';
import 'dart:convert';

class AuthMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get user details
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(documentSnapshot);
  }

  // Signing Up User

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required Uint8List file,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          file != null) {
        // registering user in auth with email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);

        model.User _user = model.User(
          username: username,
          uid: cred.user!.uid,
          photoUrl: photoUrl,
          email: email,
          bio: '',
          followers: [],
          following: [],
        );

        // adding user in our database
        await _firestore
            .collection("users")
            .doc(cred.user!.uid)
            .set(_user.toJson());

        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  // logging in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Edit Profile
  Future<String> editProfileUser({
    required String username,
    required String email,
    required String name,
    String? bio,
    String? locationCountry,
    String? locationCity,
    String? phoneNumber,
    String? website,
  }) async {
    String res = "Some error Occurred";
    try {
      User currentUser = _auth.currentUser!;
      if (email.isNotEmpty || username.isNotEmpty || name.isNotEmpty) {
        model.User _user = model.User(
          uid: currentUser.uid,
          username: username,
          email: email,
          name: name,
          photoUrl: currentUser.photoURL ?? '',
          bio: bio ?? '',
          locationCountry: locationCountry ?? '',
          locationCity: locationCity ?? '',
          phoneNumber: phoneNumber ?? '',
          website: website ?? '',
        );
        return jsonEncode(_user);

        // adding user in our database
        await _firestore
            .collection("users")
            .doc(currentUser.uid)
            .set(_user.toJson());

        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }
}
