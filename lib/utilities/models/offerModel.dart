class OfferModel {
  final String id;
  final String offerName;
  final String offerType;
  final String normalPrice;
  final String newPrice;
  final String offerFilePath;
  //class with offerings
  //class redeem products

  OfferModel({
    required this.id,
    required this.offerType,
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
      'offerType': offerType,
    };
  }
}
