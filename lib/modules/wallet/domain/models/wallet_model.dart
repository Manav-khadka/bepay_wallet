import 'package:equatable/equatable.dart';

class WalletModel extends Equatable {
  final String balance;
  final String currency;
  final bool isVisible;
  final List<TransactionModel> recentTransactions;

  const WalletModel({
    required this.balance,
    required this.currency,
    this.isVisible = true,
    this.recentTransactions = const [],
  });

  WalletModel copyWith({
    String? balance,
    String? currency,
    bool? isVisible,
    List<TransactionModel>? recentTransactions,
  }) {
    return WalletModel(
      balance: balance ?? this.balance,
      currency: currency ?? this.currency,
      isVisible: isVisible ?? this.isVisible,
      recentTransactions: recentTransactions ?? this.recentTransactions,
    );
  }

  @override
  List<Object?> get props => [balance, currency, isVisible, recentTransactions];
}

class TransactionModel extends Equatable {
  final String id;
  final String type;
  final String amount;
  final String date;
  final String status;

  const TransactionModel({
    required this.id,
    required this.type,
    required this.amount,
    required this.date,
    required this.status,
  });

  @override
  List<Object?> get props => [id, type, amount, date, status];
}

class ServiceModel extends Equatable {
  final String id;
  final String title;
  final String icon;
  final bool isEnabled;

  const ServiceModel({
    required this.id,
    required this.title,
    required this.icon,
    this.isEnabled = true,
  });

  @override
  List<Object?> get props => [id, title, icon, isEnabled];
}
