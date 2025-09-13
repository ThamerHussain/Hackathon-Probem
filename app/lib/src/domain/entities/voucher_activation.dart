class VoucherActivationEntity {
  final String voucher;
  final String ssoUserId;
  final String accountId;

  const VoucherActivationEntity({
    required this.voucher,
    required this.ssoUserId,
    required this.accountId,
  });
}
