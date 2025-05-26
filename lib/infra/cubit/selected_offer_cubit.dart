import 'package:flutter_bloc/flutter_bloc.dart';

class SelectedOfferCubit extends Cubit<int?> {
  SelectedOfferCubit() : super(null);

  void selectOffer(int? index) => emit(index);
}
