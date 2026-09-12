import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class AviatorScreen extends StatefulWidget {
  @override
  _AviatorScreenState createState() => _AviatorScreenState();
}

class _AviatorScreenState extends State<AviatorScreen> {
  double multiplier = 1.00;
  bool isCrashed = false;
  bool hasBet = false;
  double balance = 1000;
  late IO.Socket socket;

  @override
  void initState() {
    super.initState();
    socket = IO.io('https://casino-backend-97u4.onrender.com', 
      IO.OptionBuilder().setTransports(['websocket']).build());
    socket.on('aviator:multiplier', (data) {
      setState(() => multiplier = double.parse(data['multiplier'].toString()));
    });
    socket.on('aviator:crash', (data) {
      setState(() => isCrashed = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Aviator')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${multiplier.toStringAsFixed(2)}x', 
              style: TextStyle(fontSize: 60, color: isCrashed ? Colors.red : Colors.white)),
            SizedBox(height: 20),
            Text('Balance: ₹$balance', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: hasBet ? null : () {
                setState(() { balance -= 100; hasBet = true; });
              },
              child: Text('BET ₹100'),
            ),
          ],
        ),
      ),
    );
  }
}
