import 'dart:io';

import 'package:csv/csv.dart';
import 'package:dio/dio.dart';
import 'package:latlong/latlong.dart';
import 'package:path_provider/path_provider.dart';

class ApiManager {
  static const String FILE_NAME = r'VNP14IMGTDL_NRT_Global_24h.csv';
  static const FILE_DOWNLOAD_URL =
      r'https://firms.modaps.eosdis.nasa.gov/data/active_fire/viirs/csv/VNP14IMGTDL_NRT_Global_24h.csv';

  static Future<List> getFiresPosition() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = '${dir.path}/$FILE_NAME';

    if (!(await File(path).exists())) {
      print('file does not exist');
      await Dio().download(FILE_DOWNLOAD_URL, path);
    }

    final csvLines = await File(path).readAsLines();
    print(csvLines.length);

    final List<LatLng> positions = [];

    for (var i = 1; i < csvLines.length - 1; i++) {
      positions.add(LatLng(double.tryParse(csvLines[i].split(',')[0]),
          double.tryParse(csvLines[i].split(',')[1])));
    }

    return positions;
  }
}
