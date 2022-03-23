import 'package:customerservicescheduler/models/purchased_fragrance.dart';

class Purchased {
  String address = '';
  String sideNote = '';
  String status = '';
  String assignTo = '';
  DateTime orderDate;
  String customerType = '';
  List<PurchasedFragrance> purchasedFragrances = [];

  Purchased.fromModel(Map<String, dynamic> data)
      : address = data['address'] ?? '',
        sideNote = data['sideNote'] ?? '',
        status = data['status'] ?? '',
        assignTo = data['assignTo'] ?? '',
        orderDate = DateTime.parse(data['orderDate'].toDate().toString()),
        customerType = data['customerType'] ?? '',
        purchasedFragrances = data['details']
                ?.map<PurchasedFragrance>(
                    (data) => PurchasedFragrance.fromModel(data))
                ?.toList() ??
            <PurchasedFragrance>[];

  Map<String, dynamic> toJson() => {
        'address': address,
        'sideNote': sideNote,
        'status': status,
        'assignTo': assignTo,
        'orderDate': orderDate,
        'customerType': customerType,
        'purchasedFragrances':
            purchasedFragrances.map((frag) => frag.toJson()).toList()
      };
}
