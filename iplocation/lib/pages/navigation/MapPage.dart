import 'dart:io';
import 'package:flutter/material.dart';
import 'package:iplocation/components/my_textfield.dart';
import 'package:simple_animated_button/elevated_layer_button.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final TextEditingController _ipController = TextEditingController();
  final Map<String, int> _ports = {
    'SSH': 22,
    'HTTP': 80,
    'FTP': 21,
    'HTTPS': 443,
    'SMTP': 25,
    'DNS': 53,
    'POP3': 110,
  };
  List<Map<String, dynamic>> _openPorts = [];
  bool _isScanning = false;

  Future<void> _scanPorts(String ipAddress) async {
    setState(() {
      _openPorts.clear();
      _isScanning = true;
    });

    for (var entry in _ports.entries) {
      final service = entry.key;
      final port = entry.value;
      try {
        final socket = await Socket.connect(ipAddress, port,
            timeout: Duration(seconds: 1));
        socket.destroy();
        setState(() {
          _openPorts.add({'service': service, 'port': port});
        });
      } catch (e) {
        // Port is closed or unreachable
      }
    }

    setState(() {
      _isScanning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 23.0, right: 23.0),
                child: MyTextfield(
                    hintText: "Enter IP address here",
                    obscureText: false,
                    controller: _ipController),
              ),

              const SizedBox(height: 20),
              ElevatedLayerButton(
                onClick: _isScanning
                    ? null
                    : () {
                        final ip = _ipController.text.trim();
                        if (ip.isNotEmpty) {
                          _scanPorts(ip);
                        }
                      },
                buttonHeight: 60,
                buttonWidth: 270,
                animationDuration: const Duration(milliseconds: 200),
                animationCurve: Curves.ease,
                topDecoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(),
                ),
                topLayerChild: Text(_isScanning ? 'Scanning...' : 'Scan Ports'),
                baseDecoration: BoxDecoration(
                  color: Colors.green,
                  border: Border.all(),
                ),
              ),
              const SizedBox(height: 20),
              _isScanning
                  ? CircularProgressIndicator()
                  : _openPorts.isNotEmpty
                      ? SizedBox(
                          height: screenHeight / 2,
                          child: ListView.builder(
                            itemCount: _openPorts.length,
                            itemBuilder: (context, index) {
                              final portInfo = _openPorts[index];
                              return Card(
                                color: Colors.white,
                                elevation: 5,
                                margin: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                child: ListTile(
                                  leading: Icon(
                                    Icons.network_check,
                                    color: Colors.green,
                                  ),
                                  title: Text(
                                    '${portInfo['service']} (Port ${portInfo['port']})',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  subtitle: Text(
                                    'Status: Open',
                                    style: TextStyle(
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : SizedBox(
                          height: screenHeight / 2,
                          child: Center(
                            child: Text(
                              'No open ports found.',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
              SizedBox(height: 20), // Add some padding at the bottom
            ],
          ),
        ),
      ),
    );
  }
}
