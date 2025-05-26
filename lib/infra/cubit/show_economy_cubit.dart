import 'package:flutter_bloc/flutter_bloc.dart';

class ShowEconomyCubit extends Cubit<bool> {
  ShowEconomyCubit() : super(false);
  void show({required bool show}) => emit(show);
}
