class OfferModel {
  final String offerName;
  final String offerType;
  final String normalPrice;
  final String newPrice;
  final String offerFilePath;
  //class with offerings
  //class redeem products

  OfferModel({
    required this.offerType,
    required this.normalPrice,
    required this.newPrice,
    required this.offerName,
    required this.offerFilePath,
  });

  toJson() {
    return {
      'offerName': offerName,
      'normalPrice': normalPrice,
      'newPrice': newPrice,
      'offerFilePath': offerFilePath,
      'offerType': offerType,
    };
  }
}
