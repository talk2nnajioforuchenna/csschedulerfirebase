import 'package:customerservicescheduler/components/key_value_widget.dart';
import 'package:customerservicescheduler/models/purchased.dart';
import 'package:customerservicescheduler/views/checkPurchaseHistoryWidget/purchased_fragrances.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PurchasedWidget extends StatelessWidget {
  final Purchased purchased;
  const PurchasedWidget({
    Key? key,
    required this.purchased,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String date = DateFormat('dd MMM, yyy').format(purchased.orderDate);
    double fontSize = 14;
    return ExpansionTile(
      title: Text(date),
      children: [
        KeyValueWidget(
          title: 'Customer Type',
          value: purchased.customerType,
          fontSize: fontSize,
        ),
        KeyValueWidget(
          title: 'Assign To',
          value: purchased.assignTo,
          fontSize: fontSize,
        ),
        KeyValueWidget(
          title: 'Address',
          value: purchased.address,
          fontSize: fontSize,
        ),
        KeyValueWidget(
          title: 'Status',
          value: purchased.status,
          fontSize: fontSize,
        ),
        KeyValueWidget(
          title: 'Side Note',
          value: purchased.sideNote,
          fontSize: fontSize,
        ),
        const SizedBox(
          height: 15,
        ),
        PurchasedFragrances(
          fragrances: purchased.purchasedFragrances,
        ),
      ],
      tilePadding: const EdgeInsets.all(6),
    );
  }
}
