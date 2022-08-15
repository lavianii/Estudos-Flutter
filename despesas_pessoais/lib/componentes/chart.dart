import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransection;

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double total = 0.0;
      for (int i = 0; i < recentTransection.length; i++) {
        bool sameDay = recentTransection[i].date.day == weekDay.day;
        bool sameMonth = recentTransection[i].date.day == weekDay.month;
        bool sameYear = recentTransection[i].date.day == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          total += recentTransection[i].value;
        }
      }

      DateFormat.E().format(weekDay)[0];
      return {
        'dia': DateFormat.E().format(weekDay)[0],
        'value': total,
      };
    });
  }

  const Chart(this.recentTransection, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: [],
      ),
    );
  }
}
