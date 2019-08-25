import 'dart:io';

import 'package:flutter/material.dart';
import 'package:device_info/device_info.dart';
import 'package:read_device_info/ui/main_page.dart';

class ShowInfo extends StatefulWidget {
  @override
  _ShowInfoState createState() => _ShowInfoState();
}

class _ShowInfoState extends State<ShowInfo> {
  bool readingInfo = false;
//iOS
  String iOSidentifierForVendor;
  String iOSlocalizedModel;
  String iOSname;
  String iOSsystemName;
  String iOSsystemVersion;
  String iOSutsname;
  String iOSmachine;
  String iOSnodename;
  String iOSrelease;
  String iOSsysname;
  String iOSIsPhysicalDevice;
  String iOSversion;
  String iOSModel;

//Android
  String androidId = '';
  String androidandroidId = '';
  String androidBoard = '';
  String androidBootloader = '';
  String androidBrand = '';
  String androidDevice = '';
  String androidDisplay = '';
  String androidHardware = '';
  String androidHost = '';
  String androidManufacturer = '';
  String androidTags = '';
  String androidType = '';
  String androidModel = '';
  String androidVersionRelease = '';
  String androidVersionsdkInt = '';

  @override
  void initState() {
    super.initState();
    readingInfo = true;
    readDeviceInfomation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Device Infomation'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: readingInfo
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : deviceInfo(),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.gamepad,
          size: 40.0,
          color: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SCFMain()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget deviceInfo() {
    if (Platform.isAndroid) {
      return Center(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white.withOpacity(0.5))),
          child: Column(
            children: <Widget>[
              uiRow('ID:', androidId, 20),
              Divider(
                height: 5,
                color: Colors.white,
              ),
              uiRow('Android ID:', androidandroidId, 20),
              Divider(
                height: 5,
                color: Colors.white,
              ),
              uiRow('Board:', androidBoard, 20),
              Divider(
                height: 5,
                color: Colors.white,
              ),
              uiRow('Boot Loader:', androidBootloader, 20),
              Divider(
                height: 5,
                color: Colors.white,
              ),
              uiRow('Brand:', androidBrand, 20),
              Divider(
                height: 5,
                color: Colors.white,
              ),
              uiRow('Device:', androidDevice, 20),
              Divider(
                height: 5,
                color: Colors.white,
              ),
              uiRow('Display', androidDisplay, 20),
              Divider(
                height: 5,
                color: Colors.white,
              ),
              uiRow('Hardware:', androidHardware, 20),
              Divider(
                height: 5,
                color: Colors.white,
              ),
              uiRow('Host:', androidHost, 20),
              Divider(
                height: 5,
                color: Colors.white,
              ),
              uiRow('Manufacturer:', androidManufacturer, 20),
              Divider(
                height: 5,
                color: Colors.white,
              ),
              uiRow('Tags:', androidTags, 20),
              Divider(
                height: 5,
                color: Colors.white,
              ),
              uiRow('Type:', androidType, 20),
              Divider(
                height: 5,
                color: Colors.white,
              ),
              uiRow('Model:', androidModel, 20),
              Divider(
                height: 5,
                color: Colors.white,
              ),
              uiRow('Version Release:', androidVersionRelease, 20),
              Divider(
                height: 5,
                color: Colors.white,
              ),
              uiRow('Version SDK:', androidVersionsdkInt, 20),
            ],
          ),
        ),
      );
    } else if (Platform.isIOS) {
      return Center(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white.withOpacity(0.5))),
          child: Column(
            children: <Widget>[
              uiRow('IdentifierForVendor:', iOSidentifierForVendor, 20),
              Divider(
                height: 5,
                color: Colors.white,
              ),
              uiRow('Localized Model:', iOSlocalizedModel, 20),
              Divider(
                height: 5,
                color: Colors.white,
              ),
              uiRow('Name:', iOSname, 20),
              Divider(
                height: 5,
                color: Colors.white,
              ),
              uiRow('System Name:', iOSsystemName, 20),
              Divider(
                height: 5,
                color: Colors.white,
              ),
              uiRow('System Version:', iOSsystemVersion, 20),
              Divider(
                height: 5,
                color: Colors.white,
              ),
              uiRow('utsname:', iOSutsname, 20),
              Divider(
                height: 5,
                color: Colors.white,
              ),
              uiRow('machine', iOSmachine, 20),
              Divider(
                height: 5,
                color: Colors.white,
              ),
              uiRow('nodename:', iOSnodename, 20),
              Divider(
                height: 5,
                color: Colors.white,
              ),
              uiRow('Release:', iOSrelease, 20),
              Divider(
                height: 5,
                color: Colors.white,
              ),
              uiRow('sysname:', iOSsysname, 20),
              Divider(
                height: 5,
                color: Colors.white,
              ),
              uiRow('Version:', iOSversion, 20),
              Divider(
                height: 5,
                color: Colors.white,
              ),
              uiRow('Model:', iOSModel, 20),
            ],
          ),
        ),
      );
    } else {
      return Center(
        child: Text('Not Support'),
      );
    }
  }

  Widget uiRow(String item, String data, double size) {
    return Row(
      children: <Widget>[
        uiRowCell(1, item, size),
        uiRowCell(2, data, size),
      ],
    );
  }

  Widget uiRowCell(int flex, String data, double size) {
    return Expanded(
      flex: flex,
      child: Container(
        child: uiText(data, size),
      ),
    );
  }

  Widget uiText(String data, double size) {
    return Text(
      data,
      style: TextStyle(
        fontSize: size,
      ),
    );
  }

  readDeviceInfomation() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      setState(() {
        iOSidentifierForVendor = iosInfo.identifierForVendor;
        iOSlocalizedModel = iosInfo.localizedModel;
        iOSname = iosInfo.name;
        iOSsystemName = iosInfo.systemName;
        iOSsystemVersion = iosInfo.systemVersion;
        iOSutsname = iosInfo.utsname.toString();
        iOSmachine = iosInfo.utsname.machine;
        iOSnodename = iosInfo.utsname.nodename;
        iOSrelease = iosInfo.utsname.release;
        iOSsysname = iosInfo.utsname.sysname;
        iOSversion = iosInfo.utsname.version;
        iOSModel = iosInfo.model;
        readingInfo = false;
      });
    } else if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      setState(() {
        androidId = androidInfo.id;
        androidandroidId = androidInfo.androidId;
        androidBoard = androidInfo.board;
        androidBootloader = androidInfo.bootloader;
        androidBrand = androidInfo.brand;
        androidDevice = androidInfo.device;
        androidDisplay = androidInfo.display;
        androidHardware = androidInfo.hardware;
        androidHost = androidInfo.host;
        androidManufacturer = androidInfo.manufacturer;
        androidTags = androidInfo.tags;
        androidType = androidInfo.type;
        androidModel = androidInfo.model;
        androidVersionRelease = androidInfo.version.release;
        androidVersionsdkInt = androidInfo.version.sdkInt.toString();
        readingInfo = false;
      });
    } else {
      // showInfoDialog('Not support');
      setState(() {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: new Text('Not support'),
                actions: <Widget>[
                  new FlatButton(
                    child: new Text('Close'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        readingInfo = false;
                      });
                    },
                  ),
                ],
              );
            });
      });
    }
  }
}
