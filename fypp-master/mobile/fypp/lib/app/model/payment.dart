import 'package:fypp/app/model/bundle.dart';
import 'package:fypp/app/model/photographer.dart';
import 'package:fypp/app/model/user.dart';

class Payment {
  final int id;
  final double amount;
  final String cardNumber;
  final String cardCvv;
  final String cardExpirationDate;
  final String cardHolderName;
  final Map<String, dynamic> customer;
  final Map<String, dynamic> billing;
  final List<Bundle> bundles;

  Payment({
    this.id,
    this.amount,
    this.cardNumber,
    this.cardCvv,
    this.cardExpirationDate,
    this.cardHolderName,
    this.customer,
    this.billing,
    this.bundles,
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'amount': amount,
    'card_number': cardNumber,
    'card_cvv': cardCvv,
    'card_expiration_date': cardExpirationDate,
    'card_holder_name': cardHolderName,
    'customer': {
      customer
    },
    'billing': {
      billing
    },
    'items': bundles
  };

}
