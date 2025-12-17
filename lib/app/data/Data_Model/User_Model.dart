class UserCommission {
  final String? id; // ✅ nullable
  final String userId;
  final int totalDelivery;
  final int totalAssignedParcel;
  final int totalAmount;
  final DateTime createdAt;
  final String agentType;

  UserCommission({
    this.id, // ✅ named & nullable
    required this.userId,
    required this.totalDelivery,
    required this.totalAssignedParcel,
    required this.totalAmount,
    required this.createdAt,
    required this.agentType,
  });

  factory UserCommission.fromJson(Map<String, dynamic> json) {
    return UserCommission(
      id: json['id'], // can be null
      userId: json['user_id'] ?? '',
      totalDelivery: json['total_delivery'] ?? 0,
      totalAssignedParcel: json['total_assigned_parcel'] ?? 0,
      totalAmount: json['total_money_amount'] ?? 0,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      agentType: json['agent_type'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'total_delivery': totalDelivery,
      'total_assigned_parcel': totalAssignedParcel,
      'total_money_amount': totalAmount,
      'created_at': createdAt.toIso8601String(),
      'agent_type': agentType,
    };
  }
}
