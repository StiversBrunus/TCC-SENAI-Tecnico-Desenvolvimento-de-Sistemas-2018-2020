class CreditCard {
  final String cardNumber;
  final String cardName;
  final String cardDate;
  final String cardCvv;

  CreditCard({
    this.cardNumber,
    this.cardName,
    this.cardDate,
    this.cardCvv,
  });

  Map<String, dynamic> toJson() => {
    'card_number': cardNumber,
    'card_cvv': cardCvv,
    'card_expiration_date': cardDate,
    'card_holder_name': cardName
  };

}
