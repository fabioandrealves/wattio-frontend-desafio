import 'package:desafio_frontend_wattio/infra/cubit/account_value_cubit.dart';
import 'package:desafio_frontend_wattio/infra/cubit/offer_cubit.dart';
import 'package:desafio_frontend_wattio/ui/style/percentage_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EconomyCard extends StatelessWidget {
  const EconomyCard({super.key});

  Widget _buildVerticalSpacing({
    required double factor,
    required double height,
  }) => SizedBox(height: height * factor.percent());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final accountValue = context.watch<AccountValueCubit>().state;
    final selectedOffer = context.watch<OfferCubit>().state;

    if (selectedOffer == null) return SizedBox.shrink();

    final percentDiscount = selectedOffer.discount / 100;
    final monthyEconomy = accountValue * percentDiscount;
    final yearEconomy = monthyEconomy * 12;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: screenSize.height * 2.00.percent(),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(
                  'Minha economia anual será de até',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                _buildVerticalSpacing(factor: 0.50, height: screenSize.height),
                Text(
                  'R\$ ${yearEconomy.toStringAsFixed(2).replaceAll('.', ',')}',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
                _buildVerticalSpacing(factor: 0.50, height: screenSize.height),
                Text.rich(
                  TextSpan(
                    text: 'Em média ',
                    style: TextStyle(fontSize: 18, color: Colors.green[900]),
                    children: [
                      TextSpan(
                        text:
                            'R\$ ${monthyEconomy.toStringAsFixed(2).replaceAll('.', ',')}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const TextSpan(text: ' por mês*'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
