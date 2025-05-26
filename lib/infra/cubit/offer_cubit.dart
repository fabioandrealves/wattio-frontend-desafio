import 'package:desafio_frontend_wattio/models/cooperative.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfferCubit extends Cubit<CooperativeModel?> {
  OfferCubit() : super(null);

  void selectOffer(CooperativeModel? offer) => emit(offer);
}
