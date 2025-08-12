class DonationItem {
  final String id;
  final String name;
  final String description;
  final double amount;
  final String currency;

  DonationItem({
    required this.id,
    required this.name,
    required this.description,
    required this.amount,
    required this.currency,
  });

  @override
  String toString() {
    return 'DonationItem{id: $id, name: $name, description: $description, amount: $amount, currency: $currency}';
  }
}
