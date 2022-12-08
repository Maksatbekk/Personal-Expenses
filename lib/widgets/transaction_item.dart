import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransationItem extends StatelessWidget {
  const TransationItem({
    Key? key,
    required this.transaction,
    required this.delete,
  }) : super(key: key);

  final Transaction transaction;
  final Function delete;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${transaction.amount}'),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(DateFormat.yMMMd().format(transaction.date)),
        trailing: MediaQuery.of(context).size.width > 360
            ? TextButton.icon(
                icon: const Icon(
                  Icons.delete,
                ),
                label: const Text("Delete"),
                style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).errorColor),
                onPressed: () => delete(transaction.id),
              )
            : IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                onPressed: () => delete(transaction.id),
              ),
      ),
    );
  }
}
