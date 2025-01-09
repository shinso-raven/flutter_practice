import 'package:convertidor_criptomoneda/Controllers/cripto_converter_controller.dart';
import 'package:convertidor_criptomoneda/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedCurrency = 'DOP';

  CriptoConverterController _controller = CriptoConverterController();

  DropdownButton<String> getAndroidDropDownButton() {
    List<DropdownMenuItem<String>> dropDownItems = [];

    for (String currency in currencyList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );

      dropDownItems.add(newItem);
    }

    var dropDownButton = DropdownButton(
        value: selectedCurrency,
        items: dropDownItems,
        onChanged: (value) {
          setState(() {
            selectedCurrency = value;
            _controller.UpdateSelectedCurrency(value ?? "");
            _controller.UpdateEquivalences();
          });
        });

    return dropDownButton;
  }

  CupertinoPicker getIosCupertinoPicker() {
    List<Text> pickerItems = [];

    for (String currency in currencyList) {
      var text = Text(currency);

      pickerItems.add(text);
    }

    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32,
      children: pickerItems,
      onSelectedItemChanged: (value) {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cripto converter"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BitCoinCard(
              bitcoin: criptoList[0],
              currency: _controller.SelectedCurrency(),
              equivalence: _controller.BTCEquivalence),
          BitCoinCard(
              bitcoin: criptoList[1],
              currency: _controller.SelectedCurrency(),
              equivalence: _controller.ETHEquivalence),
          BitCoinCard(
              bitcoin: criptoList[2],
              currency: _controller.SelectedCurrency(),
              equivalence: _controller.LTCEquivalence),
          //CurrencyPicker
          Container(
              height: 150,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30),
              color: Colors.lightBlue,
              child: getAndroidDropDownButton())
        ],
      ),
    );
  }
}

class BitCoinCard extends StatelessWidget {
  BitCoinCard(
      {super.key,
      required this.bitcoin,
      required this.currency,
      required this.equivalence});

  String bitcoin = "BTC";
  String currency = "USD";

  double equivalence = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 15),
          child: Text(
            "1 $bitcoin = $equivalence $currency",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
