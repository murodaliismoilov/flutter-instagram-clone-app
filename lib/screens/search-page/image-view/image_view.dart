import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:isolate';
import 'dart:ui';
import 'package:permission_handler/permission_handler.dart';

class ImageView extends StatelessWidget {
  ImageView({super.key, required this.imageUrl});
  final String imageUrl;

  final ReceivePort _receivePort = ReceivePort();

  static downloadingCallback(id, status, progress) {
    SendPort? sendPort = IsolateNameServer.lookupPortByName("downloading");
    sendPort!.send([id, status, progress]);
  }

  @override
  Widget build(BuildContext context) {
    IsolateNameServer.registerPortWithName(
        _receivePort.sendPort, "downloading");

    FlutterDownloader.registerCallback(downloadingCallback);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 15,
            top: 20,
            child: TextButton(
              onPressed: () async {
                final status = await Permission.storage.request();
                if (status.isGranted) {
                  final externalDir = await getExternalStorageDirectory();
                  final id = await FlutterDownloader.enqueue(
                    url: imageUrl,
                    savedDir: externalDir!.path,
                    showNotification: true,
                    openFileFromNotification: true,
                  );
                } else {
                  print("Permission deined");
                }
              },
              child: Text(
                'Download',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
