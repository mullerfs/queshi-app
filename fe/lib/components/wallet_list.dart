import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:queshi/models/asset.dart';

class WalletList extends StatelessWidget {
  final List<Asset> assets;

  const WalletList({required this.assets});

  @override
  Widget build(BuildContext context) {
    return assets.isEmpty
        ? Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "Nenhum registro na carteira encontrado",
                  style: Theme.of(context).textTheme.headline6,
                ),
                Image.asset('assets/images/position_list.png')
              ],
            ),
          )
        : ListView.builder(
            itemCount: assets.length,
            itemBuilder: (ctx, index) {
              final item = assets[index];
              return WalletItem(asset: item);
            });
  }
}

class WalletItem extends StatelessWidget {
  final Asset asset;

  const WalletItem({
    Key? key,
    required this.asset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).primaryColor,
                width: 2,
              ),
            ),
            padding: EdgeInsets.all(5),
            child: Text("R\$ ${asset.entry_amount.toStringAsFixed(2)}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Theme.of(context).primaryColor,
                )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                asset.ticker,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[900],
                ),
              ),
              Text(
                asset.ticker_type,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700],
                ),
              ),
              Text(
                "Estratégia: ${asset.strategy}",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Text(
                "Entrada: ${DateFormat('dd/MM/yyyy').format(DateTime.parse(asset.entry_date))}",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
