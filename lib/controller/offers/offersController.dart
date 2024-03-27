import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class OffersController extends GetxController{
  Future<List<DocumentSnapshot>> fetchFireStore(String collectionName) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Query documents where either hasOffer1 or hasOffer2 is true
    QuerySnapshot querySnapshot1 = await firestore
        .collection(collectionName)
        .where('hasOffer1', isEqualTo: true)
        .get();

    // Query documents where hasOffer2 is true
    QuerySnapshot querySnapshot2 = await firestore
        .collection(collectionName)
        .where('hasOffer2', isEqualTo: true)
        .get();

    // Combine the two query snapshots into a single list
    List<DocumentSnapshot> combinedList = [];

    // Add documents from the first query snapshot
    combinedList.addAll(querySnapshot1.docs);

    // Add documents from the second query snapshot
    for (DocumentSnapshot doc in querySnapshot2.docs) {
      // Check if the document ID already exists in the combined list
      bool found = false;
      for (DocumentSnapshot existingDoc in combinedList) {
        if (doc.id == existingDoc.id) {
          found = true;
          break;
        }
      }
      // Add the document to the combined list only if it's not already present
      if (!found) {
        combinedList.add(doc);
      }
    }

    return combinedList;
  }
}