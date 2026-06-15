class Item {
  final String name;
  final double quantity;
  final String unit;
  final String category;
  final String date;

  Item({
    required this.name,
    required this.quantity,
    required this.unit,
    required this.category,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "quantity": quantity,
      "unit": unit,
      "category": category,
      "date": date,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      name: map["name"],
      quantity: map["quantity"],
      unit: map["unit"],
      category: map["category"],
      date: map["date"],
    );
  }
}
