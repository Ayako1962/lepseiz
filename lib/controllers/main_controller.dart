import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:lepseiz/controllers/auth_controller.dart';
import 'package:lepseiz/screens/medicine_reminder.dart';

import '../utils/utils.dart';

class MainController extends GetxController {
  var firestore;
  static MainController get to => Get.find();
  //creating tables(collection)
  var triggers = <String, dynamic>{}.obs;
  var medicineReminder = <String, dynamic>{}.obs;
  var seizureTrack = <String, dynamic>{}.obs;
//varables to list content
  var triggersSelectedId = "".obs;
  var medicineReminderSelectedId = "".obs;
  var seizureTrackSelectedId = "".obs;
  @override
  void onReady() {
    super.onReady();
    firestore = FirebaseFirestore.instance;
    //reactive list
   
  }

  //creating triggers
  createTriggers(triggerContent) async {
    Utils.showLoading(message: "adding a trigger");
    var userId = AuthController.to.firebaseUser.value?.uid;
    try {
      await firestore
          .collection('Triggers')
          .add({"userId": userId, "triggerContent": triggerContent,'created':DateTime.now().millisecondsSinceEpoch});
      Utils.showSuccess("success");
    } catch (e) {
      Utils.showError('failed to add. try again');
    }
    Utils.dismissLoader();
  }

  //Creating medicine reminders
  createMedicineReminder(reminderTime, medicineName) async {
    Utils.showLoading(message: "creating medicine reminder");
    var userId = AuthController.to.firebaseUser.value?.uid;
    try {
      await firestore.collection('MedicineReminder').add({
        "userId": userId,
        "reminderTime": reminderTime,
        "medicineName": medicineName,'created':DateTime.now().millisecondsSinceEpoch
      });
      Utils.showSuccess("success");
    } catch (e) {
      Utils.showError('Failed to add. try again');
    }
      Utils.dismissLoader();
  }

  //Creating Seizure track
  createSeizureTrack(month, year, count) async {
    Utils.showLoading(message: "Creating seizure track");
    var userId = AuthController.to.firebaseUser.value?.uid;
    try {
      await firestore.collection('SeizureTrack').add({
        "userId": userId,
        "month": month,
        "year": year,
        "count": count,'created':DateTime.now().millisecondsSinceEpoch
      });
      Utils.showSuccess("success");
    } catch (e) {
      Utils.showError('Failed to add. try again');
    }
      Utils.dismissLoader();
  }

  //updating triggers
  updateTriggers(triggerContent) async {
    Utils.showLoading(message: "Editing a trigger");
    var userId = AuthController.to.firebaseUser.value?.uid;
    try {
      await firestore
          .collection('Triggers')
          .doc(triggersSelectedId.value)
          .update({ "triggerContent": triggerContent});
      Utils.showSuccess("success");
    } catch (e) {
      print(e);
      Utils.showError('Failed to edit. try again');
    }
      Utils.dismissLoader();
  }

  //updating medicine reminders
  updateMedicineReminder(reminderTime, medicineName) async {
    Utils.showLoading(message: "Editing medicine reminder");
    var userId = AuthController.to.firebaseUser.value?.uid;
    try {
      await firestore.collection('MedicineReminder').doc(medicineReminderSelectedId.value).update({
        "userId": userId,
        "reminderTime": reminderTime,
        "medicineName": medicineName,
      });
      Utils.showSuccess("success");
    } catch (e) {
      Utils.showError('Failed to edit. try again');
    }
      Utils.dismissLoader();
  }

  //updating Seizure track
  updateSeizureTrack(month, year, count) async {
    Utils.showLoading(message: "Editing seizure track");
    var userId = AuthController.to.firebaseUser.value?.uid;
    try {
      await firestore.collection('SeizureTrack').doc(seizureTrackSelectedId.value).update({
        "userId": userId,
        "month": month,
        "year": year,
        "count": count,
      });
      Utils.showSuccess("success");
    } catch (e) {
      Utils.showError('Failed to edit. try again');
    }
      Utils.dismissLoader();
  }

  //deleting triggers
  deleteTriggers(id) async {
    Utils.showLoading(message: "Deleting a trigger");
    var userId = AuthController.to.firebaseUser.value?.uid;
    try {
      await firestore.collection('Triggers').doc(id).delete();
      Utils.showSuccess("success");
    } catch (e) {
      Utils.showError('Failed to delete. try again');
    }
      Utils.dismissLoader();
  }

  //Deleting medicine reminders
  deleteMedicineReminder(id) async {
    Utils.showLoading(message: "Deleting medicine reminder");
    var userId = AuthController.to.firebaseUser.value?.uid;
    try {
      await firestore.collection('MedicineReminder').doc(id).delete();
      Utils.showSuccess("success");
    } catch (e) {
      Utils.showError('Failed to delete. try again');
    }
      Utils.dismissLoader();
  }

  //Deleting Seizure track
  deleteSeizureTrack(id) async {
    Utils.showLoading(message: "Deleting seizure track");
    var userId = AuthController.to.firebaseUser.value?.uid;
    try {
      await firestore.collection('SeizureTrack').doc(id).delete();
      Utils.showSuccess("success");
    } catch (e) {
      Utils.showError('Failed to delete. try again');
    }
      Utils.dismissLoader();
  }

  // Fetch livestream
  Stream<Map<String, dynamic>> triggersStream() {
    var ref = FirebaseFirestore.instance.collection('Triggers').where('userId', isEqualTo: AuthController.to.auth.currentUser.uid).orderBy('created').snapshots();
    var data = <String, dynamic>{};
    return ref.map((list) {
      
    return {for (var element in list.docs) element.id:element.data()};
    });
  }
 

  Stream<Map<String, dynamic>> medicineReminderStream() {
    var ref =
        FirebaseFirestore.instance.collection('MedicineReminder').where('userId', isEqualTo: AuthController.to.auth.currentUser.uid).orderBy('created').snapshots();
    return ref.map((list) {
     return {for (var element in list.docs) element.id:element.data()};
    });
  }

  Stream<Map<String, dynamic>> seizureTrackStream() {
    var ref = FirebaseFirestore.instance.collection('SeizureTrack').where('userId', isEqualTo: AuthController.to.auth.currentUser.uid).orderBy('created').snapshots();
    return ref.map((list) {
      return {for (var element in list.docs) element.id:element.data()};
    });
  }
  

  //Select Item Id
  selectTrigger(id) {
    triggersSelectedId.value = id;
    update();
  }

   //Select Item Id
  selectMedicineReminder(id) {
    medicineReminderSelectedId.value = id;
    update();
  }

     //Select Item Id
  selectSeizureTrack(id) {
    seizureTrackSelectedId.value = id;
    update();
  }
}
