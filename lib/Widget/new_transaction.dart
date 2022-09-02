import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
 
  final Function addTx;
  NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? selectedDate;
 
  void _submitted() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || selectedDate==null) {
      return;
    }
    //accesing the property of NewTransaction class using widget.
    widget.addTx(titleController.text, double.parse(amountController.text),selectedDate);
    Navigator.of(context).pop(); 
  }
  void _prsentDatePicker(){
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2022), 
      lastDate: DateTime.now(),
      ).then((value)  {if(value==null){
      return;
    }
    setState(() {
      selectedDate=value;
      
    });
    
    });
  }

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Card(
          elevation: 10,
          child: Container(
              //padding: EdgeInsets.all(),
              //to voide overlapping of keey board with input widget 
              padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: MediaQuery.of(context).viewInsets.bottom+10 ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      //onChanged: (value) => titleInput=value,
                      controller: titleController,
                      onSubmitted: (_) => _submitted(),
                      decoration: InputDecoration(
                        labelText: 'Title',
                      ),
                    ),
                    TextField(
                        //onChanged: (value) => amountInput=value,
                        controller: amountController,
                        keyboardType: TextInputType.number,
                        //not using
                        onSubmitted: (_) => _submitted(),
                        decoration: InputDecoration(
                          labelText: 'Amount',
                        )),
                    Container(
                      height: 70,
                      child: Row(
                        children: <Widget>[
                          Expanded(child: Text(selectedDate==null?"No Date Chosen !":"Picked Date :"+DateFormat.yMd().format(selectedDate as DateTime))),
                          FlatButton(textColor: Colors.orange,
                            onPressed: 
                          (() {
                            _prsentDatePicker();
                            
                          }), child: Text("Chose Date",style: TextStyle(fontWeight: FontWeight.bold),)),
                        ],
                      ),
                    ),
                    
                    RaisedButton(
                      onPressed: () {
                        //passing reference to the function
                        _submitted();
                      },
                      
                      
                      color: Colors.orange,
                      child: Text(
                        "Add Transaction",style: TextStyle(color: Colors.white),
                      ),
                      
                    )
                  ]))),
    );
  }
}
