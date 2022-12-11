import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransationItem extends StatefulWidget {
  const TransationItem({
    Key? key,
    required this.transaction,
    required this.delete,
  }) : super(key: key);

  final Transaction transaction;
  final Function delete;

  @override
  _TransationItemState createState() => _TransationItemState();
}

class _TransationItemState extends State<TransationItem> {
  Color? _bgColor;

  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.blue,
      Colors.black,
      Colors.lightBlue
    ];
    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${widget.transaction.amount}'),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(DateFormat.yMMMd().format(widget.transaction.date)),
        trailing: MediaQuery.of(context).size.width > 360
            ? TextButton.icon(
                icon: const Icon(
                  Icons.delete,
                ),
                label: const Text("Delete"),
                style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).errorColor),
                onPressed: () => widget.delete(widget.transaction.id),
              )
            : IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                onPressed: () => widget.delete(widget.transaction.id),
              ),
      ),
    );
  }
}
