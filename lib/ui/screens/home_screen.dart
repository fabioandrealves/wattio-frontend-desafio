import 'package:desafio_frontend_wattio/ui/style/percentage_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../infra/cubit/account_value_cubit.dart';
import '../../infra/cubit/offers_cubit.dart';
import '../../infra/cubit/show_economy_cubit.dart';
import '../../infra/cubit/show_offers_cubit.dart';
import '../../infra/logger/custom_logger.dart';
import '../../models/cooperative.dart';
import '../style/text_styles.dart';
import '../widgets/economy_card.dart';
import '../widgets/energy_app_button.dart';
import '../widgets/offer_card.dart';
import '../widgets/slider_component.dart';
import '../widgets/text_form_field_search_results.dart';

class HomeScreen extends StatelessWidget {
  final List<CooperativeModel> cooperativeList;

  const HomeScreen({super.key, required this.cooperativeList});

  Widget _buildVerticalSpacing({
    required double factor,
    required double height,
  }) => SizedBox(height: height * factor.percent());

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: screenSize.height * 10.00.percent()),
        child: Column(
          children: [
            SizedBox(
              width: screenSize.width * 80.00.percent(),
              child: Text(
                'O valor médio mensal da minha conta de energia é:',
                style: TextStyles.headerTextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            _buildVerticalSpacing(factor: 5.00, height: screenSize.height),
            TextFormFieldSearchResults(),
            _buildVerticalSpacing(factor: 1.00, height: screenSize.height),
            SliderComponent(),
            _buildVerticalSpacing(factor: 1.00, height: screenSize.height),
            EnergyAppButton(
              onPressed: () {
                CustomLogger.logWarning('onpressed');
                final accountValue = context.read<AccountValueCubit>().state;
                context.read<OffersCubit>().updateOffers(
                  cooperatives: cooperativeList,
                  accountValue: accountValue,
                );
                context.read<ShowOffersCubit>().showOffers(show: true);
              },
              text: "Calcular Ofertas!",
            ),
            _buildVerticalSpacing(factor: 1.00, height: screenSize.height),
            BlocBuilder<ShowOffersCubit, bool>(
              builder: (context, showOffers) {
                if (!showOffers) return SizedBox.shrink();
                return BlocBuilder<OffersCubit, List<CooperativeModel>>(
                  builder: (context, offers) {
                    CustomLogger.logWarning(offers.toString());
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: offers.length,
                      itemBuilder:
                          (context, index) =>
                              OfferCard(cooperativeModel: offers[index]),
                    );
                  },
                );
              },
            ),
            _buildVerticalSpacing(factor: 1.00, height: screenSize.height),
            EnergyAppButton(
              onPressed:
                  () => context.read<ShowEconomyCubit>().show(show: true),
              text: "Calcular economia!",
            ),
            _buildVerticalSpacing(factor: 1.00, height: screenSize.height),
            BlocBuilder<ShowEconomyCubit, bool>(
              builder: (context, show) {
                return show ? EconomyCard() : SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
