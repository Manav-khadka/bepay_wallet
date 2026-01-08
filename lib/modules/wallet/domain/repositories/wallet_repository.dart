import '../models/wallet_model.dart';

abstract class WalletRepository {
  Future<WalletModel> getWalletData();
  Future<List<ServiceModel>> getServices();
  Future<void> toggleBalanceVisibility(bool isVisible);
}
