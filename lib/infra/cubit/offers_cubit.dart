import 'package:desafio_frontend_wattio/models/cooperative.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OffersCubit extends Cubit<List<CooperativeModel>> {
  OffersCubit() : super([]);

  void updateOffers({
    required List<CooperativeModel> cooperatives,
    required double accountValue,
  }) {
    final ofertasFiltradas =
        cooperatives.where((coop) {
          final min = coop.monthlyValue.min ?? 0;
          final max = coop.monthlyValue.max ?? double.infinity;
          return accountValue >= min && accountValue <= max;
        }).toList();

    emit(ofertasFiltradas);
  }
}
