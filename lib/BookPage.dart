import 'package:bootcamp_book_explore/res/dimentions.dart';
import 'package:flutter/material.dart';

import 'res/bookinfo.dart';
import 'res/colors.dart';

late int bookId;

class BookPage extends StatefulWidget {
  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    bookId = 0;
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (bookId == 0) {
      bookId = ModalRoute.of(context)!.settings.arguments as int;
    }
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
          ),
          actions: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "+ Add to wishlist",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: MyColors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ],
            ),
            SizedBox(
              width: Dims.side,
            ),
          ]),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.white.withOpacity(1),
              Colors.white.withOpacity(0)
            ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.35,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add to Cart",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Image.asset(
                          "assets/images/icons/mdi_cart-variant-white.png")
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: MyColors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: Dims.side / 2, vertical: 10),
            child: Image.asset(
              BooksInfo[bookId]["cover"],
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 75,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Dims.side),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        BooksInfo[bookId]["authurPicture"],
                        width: 48,
                        height: 48,
                      ),
                      SizedBox(
                        width: Dims.side / 2,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                BooksInfo[bookId]["bookname"],
                                maxLines: 2,
                                style: TextStyle(
                                    color: MyColors.green, fontSize: 20),
                              ),
                              Text(
                                BooksInfo[bookId]["authur"],
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: List.generate(
                                  BooksInfo[bookId]["rate"],
                                  (index) => Icon(
                                    Icons.star_rate,
                                    size: 16,
                                    color: MyColors.orange,
                                  ),
                                ),
                              ),
                              Row(
                                children: List.generate(
                                  5 -
                                      int.parse(
                                          BooksInfo[bookId]["rate"].toString()),
                                  (index) => Icon(
                                    Icons.star_border,
                                    size: 16,
                                    color: MyColors.grey,
                                  ),
                                ),
                              ),
                              Text(
                                "|",
                                style: TextStyle(
                                    color: MyColors.grey, fontSize: 14),
                              ),
                              Text(
                                " " + BooksInfo[bookId]["read"] + " " + "Reads",
                                style: TextStyle(
                                    color: MyColors.grey, fontSize: 12),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "\$" + BooksInfo[bookId]["price"].toString(),
                    style: TextStyle(color: MyColors.orange, fontSize: 20),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Dims.side),
            child: Column(
              children: [
                TabBar(
                  tabs: [
                    Tab(text: "About"),
                    Tab(text: "Reviews"),
                    Tab(text: "Author")
                  ],
                  labelColor: Colors.black,
                  indicatorColor: MyColors.orange,
                  indicatorSize: TabBarIndicatorSize.tab,
                  unselectedLabelColor: MyColors.grey,
                  controller: _tabController,
                ),
                Container(
                  height: 250,
                  child: TabBarView(controller: _tabController, children: [
                    Text(BooksInfo[bookId]["about"],
                        style: TextStyle(color: MyColors.grey, fontSize: 16)),
                    Text(BooksInfo[bookId]["about"],
                        style: TextStyle(color: MyColors.grey, fontSize: 16)),
                    Text(BooksInfo[bookId]["about"],
                        style: TextStyle(color: MyColors.grey, fontSize: 16))
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
