class CheckoutModel  {
  CheckoutModel ({
    required this.status,
    required this.message,
    required this.data,
  });
  late final bool status;
  late final String message;
  late final Data data;

  CheckoutModel .fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.checks,
    required this.wallet,
    required this.basePrice,
    required this.discountAmount,
    required this.priceAfterDiscount,
    required this.taxAmount,
    required this.shippingFees,
    required this.walletAmount,
    required this.walletBalance,
    required this.remainingBalance,
    required this.finalTotal,
  });
  late final Checks checks;
  late final Wallet wallet;
  late final String basePrice;
  late final String discountAmount;
  late final String priceAfterDiscount;
  late final String taxAmount;
  late final String shippingFees;
  late final String walletAmount;
  late final String walletBalance;
  late final String remainingBalance;
  late final String finalTotal;

  Data.fromJson(Map<String, dynamic> json){
    checks = Checks.fromJson(json['checks']);
    wallet = Wallet.fromJson(json['wallet']);
    basePrice = json['base_price'];
    discountAmount = json['discount_amount'];
    priceAfterDiscount = json['price_after_discount'];
    taxAmount = json['tax_amount'];
    shippingFees = json['shipping_fees'];
    walletAmount = json['wallet_amount'];
    walletBalance = json['wallet_balance'];
    remainingBalance = json['remaining_balance'];
    finalTotal = json['final_total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['checks'] = checks.toJson();
    _data['wallet'] = wallet.toJson();
    _data['base_price'] = basePrice;
    _data['discount_amount'] = discountAmount;
    _data['price_after_discount'] = priceAfterDiscount;
    _data['tax_amount'] = taxAmount;
    _data['shipping_fees'] = shippingFees;
    _data['wallet_amount'] = walletAmount;
    _data['wallet_balance'] = walletBalance;
    _data['remaining_balance'] = remainingBalance;
    _data['final_total'] = finalTotal;
    return _data;
  }
}

class Checks {
  Checks({
    required this.hasDiscount,
    required this.hasTax,
    required this.hasShipping,
    required this.canUseWallet,
    required this.needsPayment,
  });
  late final bool hasDiscount;
  late final bool hasTax;
  late final bool hasShipping;
  late final bool canUseWallet;
  late final bool needsPayment;

  Checks.fromJson(Map<String, dynamic> json){
    hasDiscount = json['has_discount'];
    hasTax = json['has_tax'];
    hasShipping = json['has_shipping'];
    canUseWallet = json['can_use_wallet'];
    needsPayment = json['needs_payment'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['has_discount'] = hasDiscount;
    _data['has_tax'] = hasTax;
    _data['has_shipping'] = hasShipping;
    _data['can_use_wallet'] = canUseWallet;
    _data['needs_payment'] = needsPayment;
    return _data;
  }
}

class Wallet {
  Wallet({
    required this.currentBalance,
    required this.usedAmount,
    required this.remainingBalance,
  });
  late final String currentBalance;
  late final String usedAmount;
  late final String remainingBalance;

  Wallet.fromJson(Map<String, dynamic> json){
    currentBalance = json['current_balance'];
    usedAmount = json['used_amount'];
    remainingBalance = json['remaining_balance'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['current_balance'] = currentBalance;
    _data['used_amount'] = usedAmount;
    _data['remaining_balance'] = remainingBalance;
    return _data;
  }
}