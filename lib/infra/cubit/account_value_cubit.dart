import 'package:flutter_bloc/flutter_bloc.dart';

class AccountValueCubit extends Cubit<double> {
  AccountValueCubit() : super(1000);

  void updateValue(double valor) => emit(valor);
}
