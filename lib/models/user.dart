import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String uid;
  final String photoUrl;
  final String username;
  final String? name;
  final String? bio;
  final String? locationCountry;
  final String? locationCity;
  final String? phoneNumber;
  final String? website;
  final List? educationExperiences;
  final List? workExperiences;
  final List followers;
  final List following;

  const User({
    required this.username,
    required this.uid,
    required this.photoUrl,
    required this.email,
    required this.followers,
    required this.following,
    this.name,
    this.bio,
    this.locationCountry,
    this.locationCity,
    this.phoneNumber,
    this.website,
    this.educationExperiences,
    this.workExperiences,
  });

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot["username"],
      uid: snapshot["uid"],
      email: snapshot["email"],
      photoUrl: snapshot["photoUrl"],
      followers: snapshot["followers"],
      following: snapshot["following"],
      name: snapshot["name"],
      bio: snapshot["bio"],
      locationCountry: snapshot["locationCountry"],
      locationCity: snapshot["locationCity"],
      phoneNumber: snapshot["phoneNumber"],
      website: snapshot["website"],
      educationExperiences: snapshot["educationExperiences"],
      workExperiences: snapshot["workExperiences"],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "photoUrl": photoUrl,
        "followers": followers,
        "following": following,
        "name": name,
        "bio": bio,
        "locationCountry": locationCountry,
        "locationCity": locationCity,
        "phoneNumber": phoneNumber,
        "website": website,
        "educationExperiences": educationExperiences,
        "workExperiences": workExperiences,
      };
}
