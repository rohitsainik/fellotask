import 'package:fellotask/model/newsModel.dart';
import 'package:fellotask/repo/fetchNews.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> with AutomaticKeepAliveClientMixin{
  List<Newapi> newsData = [];
  ScrollController _scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    getData();
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        setState(() {
          isLoading = true;
          var start = newsData.length;
          getMoreData(start);
        });

      }
    });
  }

  // Get data for first time
  getData() async {
    var data = await getNewsData(1) ;
    setState(() {
      newsData.addAll(data!);
    });
    print(newsData);
  }

  // get Pagination data
  getMoreData(start) async{
    var data = (await getNewsData(start))!;
    setState(() {
      newsData.addAll(data);
      isLoading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: SafeArea(
        child: buidBody(),
      )
    );
  }
// App Bar
  buildAppbar(){
    return AppBar(
      centerTitle: false,
      backgroundColor: Colors.transparent,
      title: Text('News App',style: GoogleFonts.pattaya(fontWeight: FontWeight.w400,color: Colors.black,fontSize: 25),),
      elevation: 0.0,
    );

  }

  //App body
  buidBody(){
    return Stack(
      children: [
        ListView.builder(
            addAutomaticKeepAlives: true,
            controller: _scrollController,
            itemCount: newsData.length,itemBuilder: (_, index) {
          return index == newsData.length ? _buildProgressIndicator() : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text('Published On : ${DateFormat('yyyy-MM-dd').format(newsData[index].publishedAt)}',style: GoogleFonts.poppins(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w300),)
                ,Text(newsData[index].title.toString(),style: GoogleFonts.poppins(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),textAlign: TextAlign.justify,),
                Container(
                  margin: const EdgeInsets.only(top: 10,bottom: 4),
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                          image: NetworkImage(newsData[index].imageUrl.toString()),
                          fit: BoxFit.cover
                      ),
                      borderRadius:BorderRadius.circular(10)
                  ),
                  width: MediaQuery.of(context).size.width,
                ),
                Text(
                  newsData[index].summary.toString(),              style: GoogleFonts.poppins(fontWeight: FontWeight.w400,color: Colors.grey
                ),
                  textAlign: TextAlign.justify,
                ),
                Padding(padding: const EdgeInsets.only(left: 2,right: 2),child: Divider(),)
              ],
            ),
          );
        }),
        isLoading ? Positioned(top: 0,child: Container(height: 10,child: LinearProgressIndicator())) : Container(),
        newsData.length != 0 ? Container() : Center(child: CircularProgressIndicator())
      ],
    );

  }
  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 00,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
