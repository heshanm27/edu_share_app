import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';



class UserController extends GetxController{
  // final user= OrgUser(OrganizationName: OrganizationName, OrganizationShortName: OrganizationShortName, ContactNo: ContactNo, Email: Email, Address: Address)

   Future<String> checkUserType(String id) async {
     CollectionReference user = FirebaseFirestore.instance.collection('user');
     var userDoc = await user.doc(id).get();


      return userDoc['userRole'];

   }
}