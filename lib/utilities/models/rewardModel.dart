class RewardModel {
  final String id;
  final String offerName;
  final String normalPrice;
  final String newPrice;
  final String offerFilePath;
  final int offerUses = 0;
  //class with offerings
  //class redeem products

  RewardModel({
    required this.id,
    required this.normalPrice,
    required this.newPrice,
    required this.offerName,
    required this.offerFilePath,
  });

  toJson() {
    return {
      'id': id,
      'offerName': offerName,
      'normalPrice': normalPrice,
      'newPrice': newPrice,
      'offerFilePath': offerFilePath,
      'offerUses': offerUses,
    };
  }
}
