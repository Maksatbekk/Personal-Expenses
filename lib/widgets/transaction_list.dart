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
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: FittedBox(
                    child: Text('\$${transactions[index].amount}'),
                  ),
                ),
              ),
              title: Text(
                transactions[index].title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              subtitle: Text(DateFormat.yMMMd().format(transactions[index].date)),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
