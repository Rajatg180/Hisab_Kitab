import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
 
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
 
  void submitted() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    //accesing the property of NewTransaction class using widget.
    widget.addTx(titleController.text, double.parse(amountController.text));
    Navigator.of(context).pop(); 
  }

  @override
  Widget build(BuildContext context) {
    return  Card(
        elevation: 10,
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
                    textColor: Colors.orange,
                  )
                ])));
  }
}
