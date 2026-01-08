import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/wallet_repository.dart';
import 'wallet_event.dart';
import 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final WalletRepository repository;

  WalletBloc({required this.repository}) : super(const WalletInitial()) {
    on<LoadWalletData>(_onLoadWalletData);
    on<ToggleBalanceVisibility>(_onToggleBalanceVisibility);
    on<LoadServices>(_onLoadServices);
    on<ChangeTab>(_onChangeTab);
  }

  Future<void> _onLoadWalletData(
    LoadWalletData event,
    Emitter<WalletState> emit,
  ) async {
    emit(const WalletLoading());
    try {
      final wallet = await repository.getWalletData();
      final services = await repository.getServices();
      emit(WalletLoaded(wallet: wallet, services: services));
    } catch (e) {
      emit(WalletError(e.toString()));
    }
  }

  Future<void> _onToggleBalanceVisibility(
    ToggleBalanceVisibility event,
    Emitter<WalletState> emit,
  ) async {
    if (state is WalletLoaded) {
      final currentState = state as WalletLoaded;
      final newVisibility = !currentState.wallet.isVisible;

      await repository.toggleBalanceVisibility(newVisibility);

      emit(
        currentState.copyWith(
          wallet: currentState.wallet.copyWith(isVisible: newVisibility),
        ),
      );
    }
  }

  Future<void> _onLoadServices(
    LoadServices event,
    Emitter<WalletState> emit,
  ) async {
    if (state is WalletLoaded) {
      final currentState = state as WalletLoaded;
      try {
        final services = await repository.getServices();
        emit(currentState.copyWith(services: services));
      } catch (e) {
        emit(WalletError(e.toString()));
      }
    }
  }

  Future<void> _onChangeTab(ChangeTab event, Emitter<WalletState> emit) async {
    if (state is WalletLoaded) {
      final currentState = state as WalletLoaded;
      emit(currentState.copyWith(selectedTab: event.tabName));
    }
  }
}
