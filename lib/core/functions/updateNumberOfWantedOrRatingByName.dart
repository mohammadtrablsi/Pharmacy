import 'package:cloud_firestore/cloud_firestore.dart';

import '../../data/hive/boxes/boxes.dart';



dynamic updateNumberOfWantedOrRatingByName(int state,String medicineName, var newNumber) async {
  String fieldCollectionName='';
  if(state==1){
    fieldCollectionName='numberOfWanted';
  }else{
    fieldCollectionName='rated';
  }
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  try {
    QuerySnapshot querySnapshot = await firestore
        .collection('Medicines')
        .where('fullName', isEqualTo: medicineName)
        .get();

    if (querySnapshot.docs.length == 1) {
      QueryDocumentSnapshot medicineSnapshot = querySnapshot.docs.first;
      String medicineId = medicineSnapshot.id;

      // Explicitly cast the data to Map<String, dynamic>
      Map<String, dynamic>? data = medicineSnapshot.data() as Map<String, dynamic>?;

      // Use null-aware operator to access data safely
      var oldNumber = data?[fieldCollectionName];
      var updatedNumber = state==1?oldNumber! + newNumber:(oldNumber! + newNumber)/2;
      await firestore.collection('Medicines').doc(medicineId).update({
        fieldCollectionName: updatedNumber,
      });
      print('Medicine quantity updated successfully');
    } else {
      // Handle case where there are multiple medicines with the same name or no medicine found
      print('Error: Found ${querySnapshot.docs.length} medicines with name $medicineName');
    }
  } catch (error) {
    print('Error updating medicine quantity: $error');
    throw error;
  }
}