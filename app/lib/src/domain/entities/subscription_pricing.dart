class SubscriptionPricingEntity {
  final int price;
  final double usdPrice;
  final bool recommended;
  final String commitmentPeriod;
  final String planName;
  final String offerId;
  final String description;
  final String localizedDescription;
  final String details;
  final String localizedDetails;

  const SubscriptionPricingEntity({
    required this.price,
    required this.usdPrice,
    required this.recommended,
    required this.commitmentPeriod,
    required this.planName,
    required this.offerId,
    required this.description,
    required this.localizedDescription,
    required this.details,
    required this.localizedDetails,
  });
}
