import 'package:flutter/material.dart';

import '../theme/custom_page.dart';

class DetailPage extends StatefulWidget {
  String baslik, icerik, img, date, description;
  DetailPage(
      {required this.baslik,
      required this.icerik,
      required this.img,
      required this.date,
      required this.description,
      Key? key})
      : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}


class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: Padding(
            padding: EdgeInsets.all(AppPadding.padding),
            child: const Text("News Detail")),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "${widget.description}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image.network(
            widget.img,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("${widget.date}"),
              )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text("${widget.icerik}"),
            ),
          ))
        ]),
      ),
    );
  }
}
