import 'dart:math';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:queshi/components/wallet_form.dart';
import 'package:queshi/components/wallet_list.dart';
import 'package:queshi/constants/assets_record.dart';
import 'package:queshi/models/asset.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Asset> assets = assets_record.map((item) {
    return Asset(
      operation: item['operation'].toString(),
      id: int.parse(item['id'].toString()),
      ticker: item['ticker'].toString(),
      ticker_type: item['ticker_type'].toString(),
      amount: double.parse(item['amount'].toString()),
      entry_price: double.parse(item['entry_price'].toString()),
      entry_date: item['entry_date'].toString(),
      currency: item['currency'].toString(),
      strategy: item['strategy'].toString(),
      exchange: item['exchange'].toString(),
      house: item['house'].toString(),
    );
  }).toList();

  _addAsset(
      String operation,
      String ticker,
      String ticker_type,
      String strategy,
      double amount,
      double entry_price,
      String entry_date,
      String currency,
      String exchange,
      String house) {
    final newAsset = Asset(
        operation: operation,
        id: Random().nextDouble().toInt(),
        ticker: ticker,
        ticker_type: ticker_type,
        amount: amount,
        entry_price: entry_price,
        entry_date: DateFormat('yyyy-mm-dd').format(DateTime.now()),
        currency: currency,
        strategy: strategy,
        exchange: exchange,
        house: house);
    setState(() {
      assets.add(newAsset);
      print("parametro amount: $amount");
      print("amount: ${newAsset.amount}");
    });
    Navigator.of(context).pop();
  }

  _openWalletFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return WalletForm(onSubmit: _addAsset);
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title').tr(),
      ),
      body: HomeScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openWalletFormModal(context),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget HomeScreen() {
    return WalletList(assets: assets);
  }

  Widget MontlyInvestmentChart() {
    return Card(
      child: Text('Grafico'),
      elevation: 5,
    );
  }
}
