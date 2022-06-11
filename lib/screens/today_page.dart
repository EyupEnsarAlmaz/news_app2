import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app2/core/response.dart';
import 'package:news_app2/screens/detail_page.dart';
import '../model/article.dart';
import '../theme/custom_page.dart';

class TodayPage extends StatefulWidget {
  const TodayPage({Key? key}) : super(key: key);

  @override
  State<TodayPage> createState() => _MainPageState();
}

class _MainPageState extends State<TodayPage> with TickerProviderStateMixin {
  List<ArticleModel> articles = <ArticleModel>[];

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    return Scaffold(
      appBar: appBar(
        title: Padding(
          padding: EdgeInsets.all(AppPadding.padding),
          child: AppTheme.todayTitle,
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.38,
              child: _mainUpNews(),
            ),
            SizedBox(
              child: middleTabBar(tabController),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.38,
              child: _tabbarSelectedNews(),
            ),
          ],
        ),
      ),
    );
  }

  ListView _mainUpNews() {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: articles.length,
        shrinkWrap: true,
        itemExtent: 410,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(
                          description: articles[index].description ?? "",
                          baslik: articles[index].title ?? "",
                          icerik: articles[index].content ?? "",
                          img: articles[index].urlToImage ?? "",
                          date: articles[index].publishedAt ?? "",
                        )),
              );
            },
            child: Card(
              elevation: 10,
              margin: AppTheme.marginAllApp,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Stack(children: [
                CachedNetworkImage(
                  imageUrl: articles[index].urlToImage!,
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.23,
                  fit: BoxFit.fill,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(strokeWidth: 0.2),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error_outline),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(articles[index].title ?? "",
                              maxLines: 1,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(articles[index].author ?? "",
                              maxLines: 1,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        const Align(
                            alignment: Alignment.bottomRight,
                            child: Icon(Icons.chevron_right)),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          );
        });
  }

  TabBar middleTabBar(TabController tabController) {
    return TabBar(
        indicatorColor: Colors.white,
        isScrollable: true,
        labelPadding: const EdgeInsets.only(left: 20, right: 20),
        labelColor: Colors.red.shade600,
        unselectedLabelColor: Colors.grey,
        controller: tabController,
        tabs: const [
          Text("Business"),
          Text("Entertainment"),
          Text("Health"),
          Text("Newspaper")
        ]);
  }

  ListView _tabbarSelectedNews() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: articles.length,
        shrinkWrap: true,
        itemExtent: 270,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(
                          description: articles[index].description ?? "",
                          date: articles[index].publishedAt ?? "",
                          baslik: articles[index].title ?? "",
                          icerik: articles[index].content ?? "",
                          img: articles[index].urlToImage ?? "",
                        )),
              );
            },
            child: Card(
              elevation: 10,
              margin: AppTheme.marginAllApp,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Stack(children: [
                CachedNetworkImage(
                  imageUrl: articles[index].urlToImage!,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(strokeWidth: 0.2),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error_outline),
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.23,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(articles[index].title ?? "",
                              maxLines: 1,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(articles[index].author ?? "",
                              maxLines: 1,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ),
                        const Align(
                            alignment: Alignment.bottomRight,
                            child: Icon(Icons.chevron_right)),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          );
        });
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {});
  }
}
