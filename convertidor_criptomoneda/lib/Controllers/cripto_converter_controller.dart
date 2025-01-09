import 'package:convertidor_criptomoneda/data.dart';
import 'package:convertidor_criptomoneda/services/coin_api.dart';

class CriptoConverterController {
  CoinApi _coinService = CoinApi();

  String? _selectedCurrency = 'DOP';

  double BTCEquivalence = 0;
  double ETHEquivalence = 0;
  double LTCEquivalence = 0;

  CriptoConverterController() {
    UpdateEquivalences();
  }

  String SelectedCurrency() => _selectedCurrency ?? "";

  void UpdateSelectedCurrency(String currency) {
    _selectedCurrency = currency;
  }

  final CoinApi _apiService = CoinApi();

  Future<void> UpdateEquivalences() async {
// Map<String, dynamic> response = await  apiService.

    BTCEquivalence =
        await _apiService.getExchangeRate(SelectedCurrency(), criptoList[0]);
    ETHEquivalence =
        await _apiService.getExchangeRate(SelectedCurrency(), criptoList[1]);
    LTCEquivalence =
        await _apiService.getExchangeRate(SelectedCurrency(), criptoList[2]);
  }
}
