import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return
        // ListView builder for long lists or unknown length list
        // ListView children for shorter lists
        transactions.isEmpty
            ? LayoutBuilder(builder: (ctx, constraints) {
                return Column(
                  children: <Widget>[
                    Text(
                      'No transactions added yet',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      // separator
                      height: 20,
                    ),
                    Container(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/waiting.png',
                        fit: BoxFit.cover, // takes height of parent
                      ),
                    ),
                  ],
                );
              })
            : ListView.builder(
                // column with scrollview and infinite height (height of parent)
                itemBuilder: (ctx, index) {
                  // called for every new list item

                  return TransactionItem(
                      transaction: transactions[index], deleteTx: deleteTx);
                },
                itemCount: transactions.length,
                // children: transactions.map((transactions[index]) {
                //   return
                // }).toList(),
              );
  }
}
