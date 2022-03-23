import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customerservicescheduler/models/client_records.dart';
import 'package:flutter/material.dart';

class ClientRecordsProvider with ChangeNotifier {
  late ClientRecords clientRecords;

  bool dontExist = false;
  bool displaySpinner = false;
  bool displayRecords = false;

  ClientRecordsProvider() {
    clientRecords = ClientRecords();
  }

  getClientRecords(String phoneNumber) {
    print(phoneNumber);
    String uniqueId = phoneNumber.substring(1);

    FirebaseFirestore.instance
        .collection('Orders')
        .doc(uniqueId)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        var data = documentSnapshot.data() as Map<String, dynamic>;
        dontExist = false;
        displayRecords = true;
        clientRecords = ClientRecords.fromModel(data);
      } else {
        print('Document does not exist on the database');
        displayRecords = false;
        dontExist = true;
      }
      displaySpinner = false;
      notifyListeners();
    });
  }
}
