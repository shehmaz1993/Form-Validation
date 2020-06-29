import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<FormPage> {
  var formkey=GlobalKey<FormState>();
  var name=TextEditingController();
  var phone=TextEditingController();
  var address=TextEditingController();
  void handleSubmit(){
    if(formkey.currentState.validate())
      formkey.currentState.save();

  }
  void  handleReset(){
    name.clear();
    phone.clear();
    address.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
             appBar: AppBar(title: Text("Form validation")),
              body:ListView(
                 children: <Widget>[
                   Padding(
                     padding:EdgeInsets.all((20.0)),
                     child: Form(
                         key: formkey,
                         child:Column(
                           children: <Widget>[
                             TextFormField(
                               controller: name,
                               decoration: InputDecoration(
                                 labelText: "Enter name"
                               ),

                             validator: (value){
                                 if(value.length==0)
                                   return
                                     ("Name is required");
                                 return null;
                             },
                               onSaved: (value){

                               },

                             ),
                             TextFormField(
                               controller: phone,
                               keyboardType: TextInputType.number,
                               maxLength: 11,
                               decoration: InputDecoration(
                                   labelText: "Enter phone number"
                               ),

                               validator:(value){
                                 if(value.length<11)
                                   return "11 digit phone number is required";
                                 return null;
                               },
                               onSaved: (value){

                               },

                             ),
                             TextFormField(
                               controller: address,
                               decoration: InputDecoration(
                                   labelText: "Enter Address"
                               ),

                               validator: (value){
                                 if(value.length==0)
                                   return "Address is required";
                                 return null;
                               }

                               //onSaved: (value){

                             ),
                             Row(
                               children: <Widget>[
                                 RaisedButton(
                                    color: Colors.blue,
                                   child:Text("Submit"),
                                  onPressed:handleSubmit ,
                                 ),
                                 RaisedButton(
                                     color: Colors.white,
                                     child:Text("Reset"),
                                   onPressed: handleReset,
                                 )
                               ],
                             )
                           ],
                         )
                     ),
                   )
                 ],
             )
    );
  }
}
