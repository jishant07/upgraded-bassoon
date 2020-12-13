import 'package:flutter/material.dart';
import 'package:sms/sms.dart';

class SMSPage extends StatefulWidget {
  @override
  _SMSPageState createState() => _SMSPageState();
}

class _SMSPageState extends State<SMSPage> {
  void functionDialog(String msg, String sender){
    showDialog(context: context,
    barrierDismissible: true,
    builder: (BuildContext context){
      return AlertDialog(
        content: Text(msg),
        title: Text(sender),
      );
    });
  }
  @override
  void initState() {
    super.initState();
    SmsReceiver receiver = new SmsReceiver();
    receiver.onSmsReceived.listen((SmsMessage msg) {
      functionDialog(msg.body, msg.sender);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SMS Page"),
      ),
      body: Center(
        child: Text("SMS Page reached"),
      ),
    );
  }
}

