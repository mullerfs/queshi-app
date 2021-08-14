import 'package:flutter/material.dart';

class WalletForm extends StatefulWidget {
  final void Function(String, String, String, String, double, double, String,
      String, String, String) onSubmit;

  WalletForm({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  _WalletFormState createState() => _WalletFormState();
}

class _WalletFormState extends State<WalletForm> {
  final operationController = TextEditingController();

  final tickerController = TextEditingController();

  final ticker_typeController = TextEditingController();

  final strategyController = TextEditingController();

  final amountController = TextEditingController();

  final entry_priceController = TextEditingController();

  final entry_dateController = TextEditingController();

  final currencyController = TextEditingController();

  final exchangeController = TextEditingController();

  final housController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                  controller: operationController,
                  decoration: InputDecoration(labelText: 'operation')),
              TextField(
                  controller: tickerController,
                  decoration: InputDecoration(labelText: 'ticker')),
              TextField(
                  controller: ticker_typeController,
                  decoration: InputDecoration(labelText: 'ticker_type')),
              TextField(
                  controller: strategyController,
                  decoration: InputDecoration(labelText: 'strategy')),
              TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'amount')),
              TextField(
                  controller: entry_priceController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'entry_price')),
              TextField(
                  controller: entry_dateController,
                  decoration: InputDecoration(labelText: 'entry_date')),
              TextField(
                  controller: currencyController,
                  decoration: InputDecoration(labelText: 'currency')),
              TextField(
                  controller: exchangeController,
                  decoration: InputDecoration(labelText: 'exchange')),
              TextField(
                  controller: housController,
                  decoration: InputDecoration(labelText: 'house')),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    child: Text("Salvar Operação",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Theme.of(context).accentColor)),
                    onPressed: () {
                      widget.onSubmit(
                          operationController.text,
                          tickerController.text,
                          ticker_typeController.text,
                          strategyController.text,
                          double.tryParse(amountController.text) ?? 0.0,
                          double.tryParse(entry_priceController.text) ?? 0.0,
                          entry_dateController.text,
                          currencyController.text,
                          exchangeController.text,
                          housController.text);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
