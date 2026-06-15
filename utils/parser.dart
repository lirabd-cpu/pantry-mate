class Parser {
  static Map<String, dynamic> parse(String text) {
    text = text.toLowerCase();

    double qty = 1;
    String unit = "pcs";

    final num = RegExp(r'\d+');
    if (num.hasMatch(text)) {
      qty = double.parse(num.firstMatch(text)!.group(0)!);
    }

    if (text.contains("kg")) unit = "kg";
    if (text.contains("l")) unit = "L";

    String item = text
        .replaceAll(RegExp(r'\d+'), '')
        .replaceAll(unit, '')
        .replaceAll("add", "")
        .trim();

    String category = categorize(item);

    return {
      "item": item,
      "quantity": qty,
      "unit": unit,
      "category": category
    };
  }

  static String categorize(String item) {
    if (item.contains("rice") || item.contains("চাল")) return "Grains";
    if (item.contains("milk")) return "Dairy";
    if (item.contains("egg")) return "Protein";
    if (item.contains("oil")) return "Spices";
    return "Others";
  }
}
