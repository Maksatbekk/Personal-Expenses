// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.transactions, {super.key});

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: transactions.isEmpty? Column(
        children: <Widget>[
          Text(
          "No transactions added yet!", 
          style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: Image.asset('assets/images/waiting.png', 
            fit: BoxFit.cover,)
          )
        ],
      ) : ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
              child: Row(children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 2)),
              padding: const EdgeInsets.all(10),
              child: Text(
                '\$${transactions[index].amount.toStringAsFixed(1)}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  transactions[index].title,
                  style: Theme.of(context).textTheme.titleLarge
                ),
                Text(
                  DateFormat().format(transactions[index].date),
                  style: const TextStyle(fontSize: 16),
                )
              ],
            )
          ]));
        },
        itemCount: transactions.length,
      ),
    );
  }
}
