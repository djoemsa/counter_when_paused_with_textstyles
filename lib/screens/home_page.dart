import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sprint_2_01/styles/fonts.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  Timer? timer;
  int count = 0;

  bool isRunning = false;

  List<String> listFontStyle = [
    'teko',
    'pacifico',
    'oswald',
  ];

  String? _dropDownValue = 'teko';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    timer = Timer.periodic(Duration(seconds: 1), (tm) {
      if (isRunning) {
        setState(() {
          count++;
        });
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      isRunning = false;
      print('resumed');
    } else if (state == AppLifecycleState.detached) {
      print('detached');
    } else if (state == AppLifecycleState.paused) {
      isRunning = true;
      print('paused');
    } else if (state == AppLifecycleState.inactive) {
      print('inactive');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Text(
              "Angka 0 dibawah ini akan berjalan apabila Aplikasi dalam \"Paused\" State",
              style: fontListMap[_dropDownValue]?.copyWith(fontSize: 20),
            ),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 10),
              DropdownButton(
                  value: _dropDownValue,
                  items: listFontStyle
                      .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: fontListMap[e]?.copyWith(fontSize: 20),
                          )))
                      .toList(),
                  onChanged: (String? item) {
                    setState(() {
                      _dropDownValue = item;
                    });
                  }),
              Spacer(flex: 3),
              Text(
                count.toString(),
                style: fontListMap[_dropDownValue],
              ),
              Spacer(flex: 10),
            ],
          )
        ],
      ),
    );
  }
}
