import 'package:flutter/material.dart';
import '../model/article.dart';
import '../theme/custom_page.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

String _newYorkPath = "assets/newyork.png";
String _newsIconPath = "assets/newsicon.png";
String _gizmidoIconPath = "assets/gizmoda.png";
String _yahoIconPath = "assets/yaho.png";
String _voxIconPath = "assets/vox.png";

class _NewsPageState extends State<NewsPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
        appBar: appBar(
          title: Padding(
            padding: EdgeInsets.all(AppPadding.padding),
            child: AppTheme.newsTitle,
          ),
        ),
        body: SizedBox(
            width: MediaQuery.of(context).size.width * 1,
            height: MediaQuery.of(context).size.height,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _tabBar(tabController),
                  _textbuttonSeeall(),
                ],
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.33,
                  child: _upListviewbuilder()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _trashText(),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.28,
                  child: _discoveryGridView())
            ])));
  }

  TabBar _tabBar(TabController tabController) {
    return TabBar(
        indicatorColor: Colors.white,
        isScrollable: true,
        labelColor: Colors.red.shade600,
        unselectedLabelColor: Colors.grey,
        controller: tabController,
        tabs: const [
          Text("Featured",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Text("Popular",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        ]);
  }

  TextButton _textbuttonSeeall() {
    return TextButton(
      onPressed: () {},
      child: const Text(
        "See All",
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  ListView _upListviewbuilder() {
    return ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Card(
              margin: const EdgeInsets.only(left: 10),
              elevation: 5,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Stack(children: [
                Image.asset(
                  NewsPageModel().timespath,
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.26,
                  fit: BoxFit.fill,
                ),
              ]),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Text(
                "February 2021",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 3, top: 8.0),
                  child: Image.asset(_newYorkPath, width: 10, height: 10),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    "New York Times",
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                ),
              ],
            )
          ]);
        });
  }

  Row _trashText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Discovery",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "See All",
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }

  GridView _discoveryGridView() {
    return GridView.count(
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(15)),
          width: 170,
          height: 200,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 8.0, bottom: 20, right: 10, top: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(_newsIconPath),
                  const Text(
                    "Newsweek",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Breaking News, Latest News and Videos",
                    style: TextStyle(color: Colors.white),
                  ),
                ]),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(15)),
          width: 170,
          height: 200,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 8.0, bottom: 20, right: 10, top: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(_gizmidoIconPath),
                  const Text(
                    "Gizmodo",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "We come from the future",
                    style: TextStyle(color: Colors.white),
                  ),
                ]),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 13, 32, 13),
              borderRadius: BorderRadius.circular(15)),
          width: 170,
          height: 200,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 8.0, bottom: 20, right: 10, top: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(_voxIconPath),
                  const Text(
                    "Vox.com",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Understand the News",
                    style: TextStyle(color: Colors.white),
                  ),
                ]),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 60, 2, 71),
              borderRadius: BorderRadius.circular(15)),
          width: 170,
          height: 200,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 8.0, bottom: 20, right: 10, top: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(_yahoIconPath),
                  const Text(
                    "Yahoo Life",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Yaho Life is your source for style, beatuy...",
                    style: TextStyle(color: Colors.white),
                  ),
                ]),
          ),
        ),
      ],
    );
  }
}
