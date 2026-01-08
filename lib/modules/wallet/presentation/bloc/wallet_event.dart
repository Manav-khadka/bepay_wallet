import 'package:equatable/equatable.dart';

abstract class WalletEvent extends Equatable {
  const WalletEvent();

  @override
  List<Object?> get props => [];
}

class LoadWalletData extends WalletEvent {
  const LoadWalletData();
}

class ToggleBalanceVisibility extends WalletEvent {
  const ToggleBalanceVisibility();
}

class LoadServices extends WalletEvent {
  const LoadServices();
}

class ChangeTab extends WalletEvent {
  final String tabName;

  const ChangeTab(this.tabName);

  @override
  List<Object?> get props => [tabName];
}
