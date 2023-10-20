class RewardModel {
  String id;
  String vendorName;
  final String offerName;
  final String normalPrice;
  final String newPrice;
  final String offerFilePath;
  final int offerUses = 0;
  String? savings;

  //class with offerings
  //class redeem products

  RewardModel(
      {required this.id,
      required this.vendorName,
      required this.normalPrice,
      required this.newPrice,
      required this.offerName,
      required this.offerFilePath,
      this.savings});

  toJson() {
    return {
      'id': id,
      'vendorName': vendorName,
      'offerName': offerName,
      'normalPrice': normalPrice,
      'newPrice': newPrice,
      'offerFilePath': offerFilePath,
      'offerUses': offerUses,
      'savings': (double.tryParse(normalPrice)! - double.tryParse(newPrice)!)
          .toString()
    };
  }

  factory RewardModel.fromJson(Map<String, dynamic> json) => RewardModel(
      id: json['id'],
      vendorName: json['vendorName'],
      normalPrice: json['normalPrice'],
      newPrice: json['newPrice'],
      offerName: json['offerName'],
      offerFilePath: json['offerFilePath'],
      savings: json['savings']);
}
