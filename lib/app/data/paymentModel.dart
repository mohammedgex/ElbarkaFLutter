class paymentModel {
  int? id;
  int? reservationId;
  int? userId;
  String? amount;
  String? paymentStatus;
  String? remainingAmount;
  String? paymentType;
  String? createdAt;
  String? updatedAt;

  paymentModel(
      {this.id,
      this.reservationId,
      this.userId,
      this.amount,
      this.paymentStatus,
      this.remainingAmount,
      this.paymentType,
      this.createdAt,
      this.updatedAt});

  paymentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reservationId = json['reservation_id'];
    userId = json['user_id'];
    amount = json['amount'];
    paymentStatus = json['payment_status'];
    remainingAmount = json['remaining_amount'];
    paymentType = json['payment_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}
