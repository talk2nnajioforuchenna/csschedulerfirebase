import 'package:customerservicescheduler/components/table_text.dart';
import 'package:flutter/material.dart';

import '../../models/purchased_fragrance.dart';

class PurchasedFragrances extends StatelessWidget {
  final List<PurchasedFragrance> fragrances;
  const PurchasedFragrances({Key? key, required this.fragrances})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        const TableRow(children: [
          Text(
            'Fragrance Name',
            style: TextStyle(color: Colors.red),
          ),
          Text(
            'Quantity',
            style: TextStyle(color: Colors.red),
          ),
          Text(
            'Price',
            style: TextStyle(color: Colors.red),
          ),
        ]),
        for (var i = 0; i < fragrances.length; i++)
          TableRow(children: [
            TableText(text: fragrances[i].fragranceName),
            TableText(text: fragrances[i].quantity.toString()),
            TableText(text: fragrances[i].price.toString()),
          ])
      ],
    );
  }
}
