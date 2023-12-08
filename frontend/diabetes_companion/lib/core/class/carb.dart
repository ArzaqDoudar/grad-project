class Carb {
  Carb({
    required this.name,
    required this.weight,
    required this.amount,
    required this.carbweight,
    this.weightDescription,
  });
  final String name;
  final int weight;
  String? weightDescription;
  int amount;
  int carbweight;
}
