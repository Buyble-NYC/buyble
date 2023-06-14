import 'package:buyble_real/src/model/b_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {

  static Future<BUser?> loginByUid(String uid) async {
    print("uid is " + uid);

    var user = await FirebaseFirestore.instance
        .collection("users")
        .where("uid", isEqualTo: uid)
        .get();

    if (user.size == 0) {
      return null;
    } else {
      print(" user is " + user.toString());
      return BUser.fromJson(user.docs.first.data());
    }
  }

  static Future<String> signup(BUser newUser) async {

    try {
      DocumentReference drf = await FirebaseFirestore.instance
          .collection("users")
          .add(newUser.toMap());
      return drf.id;
    } catch (e) {
      print(e);
      return "fail";
    }


  }




}
