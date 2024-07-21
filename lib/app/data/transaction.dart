class Transaction {
  final int? id;
  final String sender;
  final double amount;
  final String image;
  final String date;

  Transaction( { this.id,required this.sender, required this.amount, required this.image, required this.date});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sender': sender,
      'amount': amount,
      'image': image,
      'date': date,
    };
  }
}
