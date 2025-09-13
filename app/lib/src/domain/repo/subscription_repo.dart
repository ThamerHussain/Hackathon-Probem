import 'package:hackathon/src/domain/entities/distribution_place.dart';
import 'package:hackathon/src/domain/entities/subscription_pricing.dart';
import 'package:hackathon/src/domain/entities/voucher_activation.dart';

abstract class SubscriptionRepo {
  Future<List<SubscriptionPricingEntity>> getSubscriptionPrices();

  Future<List<DistributionPlaceEntity>> getDistributionPlaces();

  Future<bool> activateVoucher(VoucherActivationEntity voucherActivation);
}
