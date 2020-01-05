import 'package:flutter/material.dart';
import 'package:flutter_qr_scanner/qr_scanner_camera.dart';
import 'package:provider/provider.dart';

import 'bloc.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  bool _camState = false;

  _qrCallback(String code) {
    setState(() {
      _camState = false;
    });
  }

  _scanCode() {
    setState(() {
      _camState = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _scanCode();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<Scan>(context);
    return Scaffold(
      key: bloc.keys,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: QRScannerCamera(
              onError: (context, error) => Text(
                error.toString(),
                style: TextStyle(color: Colors.red),
              ),
              qrCodeCallback: (code) {
                bloc.toggle(code.toString());
              },
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 2.0),
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListView.builder(
                    itemCount: bloc.getList().length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {},
                        leading: IconButton(
                          icon: Icon(Icons.flare,size: 32.0,),
                          onPressed: () {},
                          color: bloc.getList().values.toList()[index]
                              ? Colors.red
                              : Colors.grey,
                        ),
                        title: Text(
                            bloc.getList().keys.toList()[index].toString()),
                      );
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
