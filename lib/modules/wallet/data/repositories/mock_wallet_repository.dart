import '../../domain/models/wallet_model.dart';
import '../../domain/repositories/wallet_repository.dart';

class MockWalletRepository implements WalletRepository {
  @override
  Future<WalletModel> getWalletData() async {
    // Simulate API delay
    await Future.delayed(const Duration(seconds: 1));

    return const WalletModel(
      balance: '1450.08',
      currency: 'USD',
      isVisible: true,
      recentTransactions: [
        TransactionModel(
          id: '1',
          type: 'Received',
          amount: '0.5 BTC',
          date: '2024-01-08',
          status: 'completed',
        ),
        TransactionModel(
          id: '2',
          type: 'Sent',
          amount: '0.2 ETH',
          date: '2024-01-07',
          status: 'completed',
        ),
      ],
    );
  }

  @override
  Future<List<ServiceModel>> getServices() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return const [
      ServiceModel(
        id: '1',
        title: 'Scan QR & pay\nvia crypto',
        icon: 'scan_and_pay',
      ),
      ServiceModel(id: '2', title: 'Cashout', icon: 'cashout'),
      ServiceModel(id: '3', title: 'Send gift', icon: 'send_gift'),
      ServiceModel(id: '4', title: 'Bitcoin\nloan', icon: 'bitcoin_loan'),
      ServiceModel(id: '5', title: 'Travel booking', icon: 'travel_booking'),
      ServiceModel(id: '6', title: 'Gift cards', icon: 'gift_card'),
      ServiceModel(id: '7', title: 'Gold', icon: 'gold'),
      ServiceModel(id: '8', title: 'Real estate', icon: 'real_estate'),
      ServiceModel(id: '9', title: 'Finance', icon: 'finance'),
    ];
  }

  @override
  Future<void> toggleBalanceVisibility(bool isVisible) async {
    await Future.delayed(const Duration(milliseconds: 100));
  }
}
