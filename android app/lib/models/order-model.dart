class Order {
  final Map<String, Map<String, String>> payment;
  final int mobile;
  final String note;
  final String status;
  final String img;
  final DateTime orderedData;
  final DateTime estDelivery;
  final DateTime deliverDate;
  final Map<String, Map<String, String>> address;
  final int price;
  final List<Map<String, dynamic>> items;

  Order(
      {this.price,
      this.mobile,
      this.address,
      this.deliverDate,
      this.estDelivery,
      this.note,
      this.img,
      this.orderedData,
      this.payment,
      this.status,
      this.items});
}
