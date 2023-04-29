import 'package:flutter/material.dart';
import 'package:bootcamp_book_explore/res/colors.dart';
import 'package:dotted_border/dotted_border.dart';

import 'res/bookinfo.dart';
import 'res/dimentions.dart';
import 'res/processbar.dart';

final search_controller = TextEditingController();

class MyLibrary extends StatefulWidget {
  @override
  State<MyLibrary> createState() => _MyLibraryState();
}

class _MyLibraryState extends State<MyLibrary> {
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
                              onChanged: (searchtext) {},
                              showCursor: false,
                              cursorColor: Color(0xff0f1825),
                              cursorHeight: 5.0,
                              cursorWidth: 1.0,
                              textAlign: TextAlign.start,
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
          Padding(
            padding: EdgeInsets.only(left: Dims.side, top: 20.0, bottom: 20.0),
            child: Text(
              "Hi Ali,",
              style: TextStyle(color: MyColors.green, fontSize: 17.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: Dims.side, bottom: 10.0),
            child: Text(
              "My Library",
              style: TextStyle(
                  color: MyColors.green,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 250,
            child: GridView.builder(
              padding: EdgeInsets.fromLTRB(Dims.side, 0.0, 0.0, 0.0),
              scrollDirection: Axis.horizontal,
              itemCount: My_Library.length + 1,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1.7,
                  mainAxisSpacing: 10.0),
              itemBuilder: (context, index) {
                if (index < My_Library.length) {
                  return GestureDetector(
                    onTap: () {},
                    child: Card(
                        elevation: 0.0,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.5)),
                                child: Image.asset(
                                  "${My_Library[index]["bookimage"]}",
                                  isAntiAlias: true,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Row(
                                children: [
                                  Text(
                                    My_Library[index]["bookname"],
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  processbar(
                                    processed: My_Library[index]
                                        ["readingProcess"],
                                    currentwith: 80.0,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  );
                } else {
                  return GestureDetector(
                    onTap: () {},
                    child: Card(
                        elevation: 0.0,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: DottedBorder(
                          strokeWidth: 1.0,
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(8.0),
                          dashPattern: const [8, 4],
                          color: MyColors.grey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                child: Icon(
                                  Icons.add,
                                  size: 30,
                                  color: MyColors.grey,
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                'Discover More',
                                style: TextStyle(
                                  color: MyColors.grey,
                                ),
                              )
                            ],
                          ),
                        )),
                  );
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(Dims.side, 30, Dims.side, 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Wishlist",
                  style: TextStyle(color: MyColors.orange, fontSize: 24.0),
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                                color: MyColors.inactive_grey, width: 1))),
                    child: Text(
                      "See More",
                      style: TextStyle(color: MyColors.orange),
                    ))
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: Dims.side),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: My_Wishlist.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.7,
                ),
                itemBuilder: (context, index) {
                  {
                    {
                      return GestureDetector(
                        onTap: () {},
                        child: Card(
                            elevation: 0.0,
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Row(
                              children: [
                                Container(
                                  width: 80.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.5)),
                                  child: Image.asset(
                                    "${My_Wishlist[index]["bookimage"]}",
                                    isAntiAlias: true,
                                    width: double.infinity,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      10.0, 20.0, 0.0, 20.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            My_Wishlist[index]["bookname"],
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                                color: MyColors.green),
                                          ),
                                          Text(
                                            My_Wishlist[index]["authur"],
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold,
                                                color: MyColors.grey),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: Row(
                                              children: <Widget>[
                                                Row(
                                                  children: List.generate(
                                                    My_Wishlist[index]["rate"],
                                                    (index) => Icon(
                                                      Icons.star_rate,
                                                      size: 15,
                                                      color: MyColors.orange,
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  children: List.generate(
                                                    5 -
                                                        int.parse(
                                                            My_Wishlist[index]
                                                                    ["rate"]
                                                                .toString()),
                                                    (index) => Icon(
                                                      Icons.star_border,
                                                      size: 15,
                                                      color: MyColors.grey,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      );
                    }
                  }
                },
              ),
            ),
          )
        ]),
      ),
    );
  }
}
