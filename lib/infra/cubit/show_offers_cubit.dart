import 'package:flutter_bloc/flutter_bloc.dart';

class ShowOffersCubit extends Cubit<bool> {
  ShowOffersCubit() : super(false);

  void showOffers({required bool show}) => emit(show);
}
