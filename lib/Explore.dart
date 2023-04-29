import 'package:bootcamp_book_explore/Cart.dart';
import 'package:bootcamp_book_explore/res/MyRectPaginator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bootcamp_book_explore/res/colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';

import 'BookPage.dart';
import 'res/bookinfo.dart';
import 'res/dimentions.dart';
import 'res/processbar.dart';

final search_controller = TextEditingController();

class explore extends StatefulWidget {
  @override
  State<explore> createState() => _exploreState();
}

class _exploreState extends State<explore> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    bookId = 0;
    _tabController = TabController(length: CategoryNames.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56.0),
            child: SafeArea(
              top: true,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // direction: Axis.vertical,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/icons/mdi_bell-notification.png"),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Image(
                                      image: AssetImage(
                                          "assets/images/icons/clarity_notification-outline-badged.png")),
                                )
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: Image(
                                image: AssetImage(
                                    "assets/images/icons/fluent_scan-dash-28-filled.png"),
                              )),
                        ),
                        Expanded(
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0)),
                            child: TextField(
                              onTap: () {
                                if (search_controller.selection ==
                                    TextSelection.fromPosition(TextPosition(
                                        offset: search_controller.text.length -
                                            1))) {}
                              },
                              controller: search_controller
                                ..selection = TextSelection.fromPosition(
                                    TextPosition(
                                        offset: search_controller.text.length)),
                              autocorrect: false,
                              keyboardType: TextInputType.text,
                              onChanged: (searchtext) {
                                // if (searchtext == '') {
                                //   searchResult.value = 'خالی';
                                // } else {
                                // searchResult.value = searchtext;
                                // }

                                // print('input:' '${searchResult.value}');
                              },
                              showCursor: false,
                              cursorColor: Color(0xff0f1825),
                              cursorHeight: 5.0,
                              cursorWidth: 1.0,
                              textAlign: TextAlign.start,
                              // textDirection: TextDirection.rtl,
                              decoration: const InputDecoration(
                                filled: true,
                                label: Image(
                                    image: AssetImage(
                                        "assets/images/icons/ri_search-line.png")),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                // hintText: 'جستجو...',
                                // hintTextDirection: TextDirection.rtl,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 15.0),
                          child: Image(
                            image: AssetImage(
                                "assets/images/icons/heroicons-solid_menu-alt-2.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )),
        body: ListView(children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.26,
            child: Padding(
              padding: EdgeInsets.fromLTRB(Dims.side, 10.0, Dims.side, 10.0),
              child: Swiper(
                itemCount: ExploreSwiper.length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(fit: StackFit.expand, children: [
                    Image.asset(
                      ExploreSwiper[index]["image"],
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Wrap(
                        spacing: 0,
                        direction: Axis.vertical,
                        alignment: WrapAlignment.start,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.height * 0.3,
                            child: Text(
                              ExploreSwiper[index]["info"],
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              height: 30,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Explore",
                                  style: TextStyle(
                                      color: MyColors.orangelight,
                                      fontSize: 12),
                                ),
                                style: ElevatedButton.styleFrom(
                                    elevation: 0.0,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5))),
                              ))
                        ],
                      ),
                    )
                  ]);
                },
                autoplay: false,
                pagination: MySwiperPagination(
                  alignment: Alignment(0, 1.6),
                  builder: MyRectSwiperPaginationBuilder(
                    space: 4.0,
                    size: Size(15, 15),
                    activeSize: Size(65.0, 15.0),
                    color: MyColors.inactive_grey,
                    activeColor: MyColors.orange,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: Dims.side),
            child: Text(
              "Categories",
              style: TextStyle(
                  color: MyColors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          TabBar(
            padding:
                EdgeInsets.only(left: Dims.side - 10, top: 10.0, bottom: 10.0),
            labelPadding: EdgeInsets.symmetric(horizontal: 10),
            isScrollable: true,
            tabs: List.generate(
                CategoryNames.length, (index) => Text(CategoryNames[index])),
            labelColor: MyColors.grey,
            indicatorColor: MyColors.orange,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3,
            unselectedLabelColor: MyColors.grey,
            controller: _tabController,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: Dims.side),
                scrollDirection: Axis.vertical,
                itemCount: Categories.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.5,
                    crossAxisSpacing: 15),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(context, "/BookPage",
                        arguments: Categories[index]["id"] as int),
                    child: Card(
                        elevation: 0.0,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.5)),
                                  child: Image.asset(
                                    "${Categories[index]["bookimage"]}",
                                    isAntiAlias: true,
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          Categories[index]["bookname"],
                                          maxLines: 2,
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                              color: MyColors.green),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Categories[index]["authur"],
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: MyColors.grey),
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Row(
                                          children: List.generate(
                                            My_Wishlist[index]["rate"],
                                            (index) => Icon(
                                              Icons.star_rate,
                                              size: 12,
                                              color: MyColors.orange,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: List.generate(
                                            5 -
                                                int.parse(My_Wishlist[index]
                                                        ["rate"]
                                                    .toString()),
                                            (index) => Icon(
                                              Icons.star_border,
                                              size: 12,
                                              color: MyColors.grey,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )),
                  );
                }),
          ),
        ]),
      ),
    );
  }
}
