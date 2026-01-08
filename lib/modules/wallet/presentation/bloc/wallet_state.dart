import 'package:equatable/equatable.dart';
import '../../domain/models/wallet_model.dart';

abstract class WalletState extends Equatable {
  const WalletState();

  @override
  List<Object?> get props => [];
}

class WalletInitial extends WalletState {
  const WalletInitial();
}

class WalletLoading extends WalletState {
  const WalletLoading();
}

class WalletLoaded extends WalletState {
  final WalletModel wallet;
  final List<ServiceModel> services;
  final String selectedTab;

  const WalletLoaded({
    required this.wallet,
    required this.services,
    this.selectedTab = 'Services',
  });

  WalletLoaded copyWith({
    WalletModel? wallet,
    List<ServiceModel>? services,
    String? selectedTab,
  }) {
    return WalletLoaded(
      wallet: wallet ?? this.wallet,
      services: services ?? this.services,
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }

  @override
  List<Object?> get props => [wallet, services, selectedTab];
}

class WalletError extends WalletState {
  final String message;

  const WalletError(this.message);

  @override
  List<Object?> get props => [message];
}
