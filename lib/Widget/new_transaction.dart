import 'package:flutter/material.dart';
import 'package:hisab_kitab/Widget/user_transaction.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  NewTransaction(this.addTx);

  void submitted() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    addTx(titleController.text, double.parse(amountController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 30,
        child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    //onChanged: (value) => titleInput=value,
                    controller: titleController,
                    onSubmitted: (_) => submitted(),
                    decoration: InputDecoration(
                      labelText: 'Title',
                    ),
                  ),
                  TextField(
                      //onChanged: (value) => amountInput=value,
                      controller: amountController,
                      keyboardType: TextInputType.number,
                      //not using
                      onSubmitted: (_) => submitted(),
                      decoration: InputDecoration(
                        labelText: 'Amount',
                      )),
                  FlatButton(
                    onPressed: () {
                      //passing reference to the function
                      submitted();
                    },
                    child: Text(
                      "Add Transaction",
                    ),
                    textColor: Colors.blue,
                  )
                ])));
  }
}
