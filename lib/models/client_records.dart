import 'purchased.dart';

class ClientRecords {
  String uniqueId = '';
  String clientName = '';
  String clientPhoneNumber = '';
  List<Purchased> purchases = [];

  ClientRecords();

  void setUniqueId(value) {
    if (uniqueId == '') {
      try {
        uniqueId = value['phoneNumber'][0].toString();
      } catch (e) {
        uniqueId == '';
      }
    }
  }

  void setClientName(value) {
    if (clientName == '' || clientName == 'Unknown') {
      clientName = value['customerName'];
    }
  }

  void setPhoneNumber() {
    clientPhoneNumber = '0' + uniqueId;
  }

  ClientRecords.fromModel(Map<String, dynamic> data) {
    data.forEach((key, value) {
      setUniqueId(value);
      setClientName(value);
      setPhoneNumber();
      Purchased purchased = Purchased.fromModel(value);
      purchases.add(purchased);
    });
  }

  Map<String, dynamic> toJson() => {
        'uniqueId': uniqueId,
        'clientName': clientName,
        'clientPhoneNumber': clientPhoneNumber,
        'purchases': purchases.map((order) => order.toJson()).toList()
      };
}
