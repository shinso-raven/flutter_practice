import 'package:convertidor_criptomoneda/services/coin_api.dart';

class CriptoConverterController {
  CoinApi _coinService = CoinApi();

  String? _selectedCurrency = 'DOP';

  double BTCEquivalence = 0;
  double ETHEquivalence = 0;
  double LTCEquivalence = 0;

  String SelectedCurrency() => _selectedCurrency ?? "";

  void UpdateSelectedCurrency(String currency) {
    _selectedCurrency = currency;
  }

  void UpdateEquivalences() {}
}
