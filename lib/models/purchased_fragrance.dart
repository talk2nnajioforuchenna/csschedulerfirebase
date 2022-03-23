class PurchasedFragrance {
  String fragranceName = '';
  String formNumber = '';
  int price = 0;
  int quantity = 0;

  PurchasedFragrance.fromModel(Map<String, dynamic> data)
      : fragranceName = data['fragranceName'],
        formNumber = data['formNumber'].toString(),
        quantity = int.parse(data['quantity'].toString()),
        price = int.parse(data['price'].toString());

  Map<String, dynamic> toJson() => {
        'fragranceName': fragranceName,
        'formNumber': formNumber,
        'price': price,
        'quantity': quantity,
      };
}
