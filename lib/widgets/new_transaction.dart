import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  Function addTransaction;
  NewTransaction(this.addTransaction);
  trasact() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);
    if (title.isEmpty || amount <= 0) {
      return;
    }
    addTransaction(titleController.text, double.parse(amountController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: 'title'),
            onSubmitted: (_)=>trasact(),
          ),
          TextField(
            decoration: InputDecoration(labelText: 'amount'),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            controller: amountController,
            onSubmitted: (_) {
              trasact();
            },
          ),
          FlatButton(
            textColor: Colors.purple,
            child: Text('submit'),
            onPressed: trasact,
          ),
        ],
      ),
    );
  }
}
