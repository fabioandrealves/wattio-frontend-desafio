import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../infra/cubit/account_value_cubit.dart';
import '../../infra/cubit/selected_offer_cubit.dart';

class SliderComponent extends StatelessWidget {
  const SliderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountValueCubit, double>(
      builder: (BuildContext context, double accountValue) {
        return SliderTheme(
          data: SliderTheme.of(context).copyWith(
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 26.0),
          ),
          child: Slider(
            min: 1000,
            max: 100000,
            divisions: 99,
            inactiveColor: Colors.white.withOpacity(0.5),
            activeColor: Color(0xffa6c8ff),
            thumbColor: Color(0xffa6c8ff),
            value: accountValue,
            onChanged: (value) {
              context.read<AccountValueCubit>().updateValue(value);
              context.read<SelectedOfferCubit>().selectOffer(null);
            },
          ),
        );
      },
    );
  }
}
