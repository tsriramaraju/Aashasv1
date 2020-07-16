class Order {
  final Map<String, Map<String, String>> payment;
  final String mobile;
  final String note;
  final String status;
  final DateTime orderedData;
  final DateTime estDelivery;
  final DateTime deliverDate;
  final Map<String, Map<String, String>> address;
  final Map<String, Map<String, double>> price;
  final List<Map<String, dynamic>> items;

  Order(
      {this.price,
      this.mobile,
      this.address,
      this.deliverDate,
      this.estDelivery,
      this.note,
      this.orderedData,
      this.payment,
      this.status,
      this.items});
}
