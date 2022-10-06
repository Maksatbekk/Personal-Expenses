import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  const NewTransaction(this.addNewTx, {super.key});

  final Function addNewTx;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addNewTx(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              //onChanged: (val) {
              //titleInput = val;
              //},
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              //onChanged: (val) => amountInput = val,
            ),
            SizedBox(
              height: 60,
              child: Row(
                children: [
                  const Text(
                    'No date chosen!',
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                      child: const Text('Choose date',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      onPressed: () {})
                ],
              ),
            ),
            ElevatedButton(
              onPressed: submitData,
              child: const Text(
                'Add transaction',
                style: TextStyle(
                    color: Color.fromARGB(255, 252, 250, 250),
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
