import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fun_trip_v2/api_connect/booking_rest_client.dart';
import 'package:fun_trip_v2/model/booking_model.dart';
import 'package:fun_trip_v2/model/user_model.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<BookingModel> data = [];

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => _initData(),
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: data.map((e) => card(e)).toList(),
        ),
      ),
    );
  }

  Future<void> _initData() async {
    final restApi = BookRestApi(Dio());
    try {
      var result = await restApi.getAllBooking();
      setState(() {
        data = result.data
            .where((element) =>
                element.driverName?.toLowerCase() ==
                UserModel.currentUser?.userName?.toLowerCase())
            .toList();
      });
    } on DioError catch (err) {
      log('Error while fetching history ${err.message}');
      return;
    }
  }

  Card card(BookingModel model) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(7),
      color: Colors.white,
      shadowColor: Colors.blueGrey,
      // elevation: 5,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading:
                  Icon(Icons.album, color: Colors.green.shade500, size: 40),
              title: const Text(
                "Travel success",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Destination: ${model.address!}',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Text(
              '${model.cost}\$',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Mr ${model.driverName} thanks for you serving'),
            const SizedBox(height: 15),
            Text(
              'You arrived at ${model.endTime}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  children: [
                    TextButton(
                      child: const Text(
                        'Details',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {/* ... */},
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.blue,
                    )
                  ],
                ),
                const SizedBox(width: 5),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
