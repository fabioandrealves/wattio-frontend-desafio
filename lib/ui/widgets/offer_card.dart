import 'package:desafio_frontend_wattio/ui/style/percentage_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../infra/cubit/offer_cubit.dart';
import '../../infra/cubit/offers_cubit.dart';
import '../../models/cooperative.dart';
import '../style/text_styles.dart';

class OfferCard extends StatelessWidget {
  final CooperativeModel cooperativeModel;

  const OfferCard({super.key, required this.cooperativeModel});

  Widget _buildVerticalSpacing({
    required double factor,
    required double height,
  }) => SizedBox(height: height * factor.percent());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return BlocBuilder<OffersCubit, List<CooperativeModel>>(
      builder: (context, offer) {
        final isSelected = context.select<OfferCubit, bool>(
          (cubit) => cubit.state == offer,
        );
        return GestureDetector(
          onTap: () {
            context.read<OfferCubit>().selectOffer(cooperativeModel);
          },
          child: Card(
            color: isSelected ? Colors.orange : Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cooperativeModel.name,
                    style: TextStyles.offerCardNameTextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                  _buildVerticalSpacing(
                    factor: 0.50,
                    height: screenSize.height,
                  ),
                  Text(
                    'Desconto: ${cooperativeModel.discount.toStringAsFixed(1)}%',
                    style: TextStyles.offerCardDiscountTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: isSelected ? Colors.white70 : Colors.black54,
                    ),
                  ),
                  Text(
                    'Tipo: ${cooperativeModel.typeCustomer}',
                    style: TextStyles.offerCardDiscountTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: isSelected ? Colors.white70 : Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
