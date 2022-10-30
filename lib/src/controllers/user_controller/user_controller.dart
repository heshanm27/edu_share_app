import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_share_app/src/models/user_model/User.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';



class UserController extends GetxController{
  // final user= OrgUser(OrganizationName: OrganizationName, OrganizationShortName: OrganizationShortName, ContactNo: ContactNo, Email: Email, Address: Address)
    late UserModel User;
   Future<UserModel> checkUserType(String id) async {
     CollectionReference<Map<String, dynamic>> user = FirebaseFirestore.instance.collection('user');
     var userDoc = await user.doc(id).get();
      User = UserModel.fromJson(userDoc.data()!);

      return User;
   }
}