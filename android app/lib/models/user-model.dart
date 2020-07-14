class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final int number;
  final bool isAdmin;
  final List<Map<String, String>> address;
  final List<Object> orders;
  final List<Object> favourite;
  final List<Object> customProducts;
  final DateTime date;

  User(
      {this.address,
      this.customProducts,
      this.date,
      this.email,
      this.favourite,
      this.id,
      this.isAdmin,
      this.name,
      this.number,
      this.orders,
      this.password});
}
