import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPercentage;

  const ChartBar(
    this.label, 
    this.spendingAmount, 
    this.spendingPercentage, 
    {super.key}
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        FittedBox(
          child: Text('\$${spendingAmount.toStringAsFixed(0)}')
        ),
        const SizedBox(
          height: 4
        ),
        SizedBox(
          height: 60,
          width: 10,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.deepPurple, width: 1.0),
                  color: const Color.fromARGB(98, 153, 189, 175),
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPercentage,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              )
          ],),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(label),
      ]
    );
  }
}
