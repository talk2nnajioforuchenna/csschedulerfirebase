import 'package:customerservicescheduler/components/key_value_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/client_records_provider.dart';
import 'purchaed_widget.dart';

class DisplayPurchaseHistory extends StatefulWidget {
  const DisplayPurchaseHistory({Key? key}) : super(key: key);

  @override
  State<DisplayPurchaseHistory> createState() => _DisplayPurchaseHistoryState();
}

class _DisplayPurchaseHistoryState extends State<DisplayPurchaseHistory> {
  @override
  Widget build(BuildContext context) {
    ClientRecordsProvider crp = Provider.of<ClientRecordsProvider>(context);

    crp.clientRecords.purchases.sort((a, b) => a
        .orderDate.millisecondsSinceEpoch
        .compareTo(b.orderDate.millisecondsSinceEpoch));
    return !crp.displayRecords
        ? Container()
        : Container(
            margin: const EdgeInsets.all(10),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      KeyValueWidget(
                          title: 'Client Name',
                          value: crp.clientRecords.clientName),
                      const SizedBox(
                        height: 20,
                      ),
                      KeyValueWidget(
                          title: 'Client Phone Number',
                          value: crp.clientRecords.clientPhoneNumber),
                      const SizedBox(
                        height: 20,
                      ),
                      for (var i = 0;
                          i < crp.clientRecords.purchases.length;
                          i++)
                        PurchasedWidget(
                            purchased: crp.clientRecords.purchases[i]),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
