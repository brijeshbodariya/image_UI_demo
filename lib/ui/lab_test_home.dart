import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_ui_demo/constant/constants.dart';
import 'package:image_ui_demo/model/feature_lab.dart';
import 'package:image_ui_demo/model/full_body_check.dart';
import 'package:image_ui_demo/model/health_check_categories.dart';
import 'package:image_ui_demo/model/health_check_up_home.dart';
import 'package:image_ui_demo/model/image_carousel.dart';
import 'package:image_ui_demo/model/pathology_tests.dart';
import 'package:image_ui_demo/model/radiologist_tests.dart';
import 'package:image_ui_demo/utility/utils.dart';

class LabTest extends StatefulWidget {
  const LabTest({Key? key}) : super(key: key);

  @override
  _LabTestState createState() => _LabTestState();
}

class _LabTestState extends State<LabTest> {
  int _currentIndex = 0;

  List<String>? carouselImageList;

  List<PathologyTests>? pathologyTestList;

  List<RadiologyTests>? radiologyTestList;

  List<HealthCheckCategories>? healthCategoriesList;

  List<FullBodyCheck>? fullBodyCheckList;

  List<HealthCheckUpHome>? healthCheckHomeList;

  List<FeatureLab>? featureLabList;

  List<ImageCarousel>? carouselList;

  CarouselSlider? carouselSlider;

  double? height;
  double? width;

  ScrollController? _scrollController;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();

    _scrollController!.addListener(() => setState(() {}));

    carouselImageList = Constants.getCarouselList();

    healthCategoriesList = Constants.getHealthCategoriesList();

    pathologyTestList = Constants.getPathologyTestList();

    radiologyTestList = Constants.getRadiologyTestList();

    fullBodyCheckList = Constants.getFullBodyCheckTestList();

    healthCheckHomeList = Constants.getFullCheckHomeTestList();

    featureLabList = Constants.getFeatureLabTestList();
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                leading: Container(),
                expandedHeight: 230,
                pinned: false,
                backgroundColor: const Color(0xFF04668c),
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Padding(
                    padding: const EdgeInsets.only(
                        top: 40.0, left: 10.0, right: 10.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 24.0),
                                  child: const Text('Ghaziabaad',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20)),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 2.0),
                                  child: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.blueGrey[200],
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                const Icon(Icons.supervisor_account,
                                    color: Colors.white, size: 25),
                                const SizedBox(width: 24.0),
                                const Icon(Icons.notifications_none,
                                    color: Colors.white, size: 25),
                                const SizedBox(width: 24.0),
                                InkWell(
                                    onTap: () {},
                                    child: const Icon(
                                      Icons.shopping_cart,
                                      color: Colors.white,
                                      size: 25,
                                    )),
                              ],
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15.0),
                          height: 42.0,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                          ),
                          padding: const EdgeInsets.only(right: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search Tests (CBC,D3,etc.)",
                              prefixIcon: const Icon(Icons.search),
                              hintStyle: TextStyle(
                                  color: Colors.grey[400], fontSize: 13.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  titlePadding: const EdgeInsets.only(bottom: 60.0, left: 24.0),
                  title: const Text(
                    "Lab Tests",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 22),
                  ),
                ),
              ),
              SliverPadding(
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    _buildSliverList(),
                  ),
                ),
                padding:
                    const EdgeInsets.only(top: 30.0, left: 8.0, right: 8.0),
              ),
            ],
          ),
          _buildBookLabTest()
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          color: Colors.white,
          height: 65.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                '1 Test Selected',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
                      vertical: 12.0, horizontal: 16.0)),
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFF04668c)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text(
                      'GO TO CART',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBookLabTest() {
    bool isAndroid = Utils.isAndroidPlatform();
    double sliverOffset = 6.0;
    if (isAndroid) sliverOffset = 28.0;
    final double defaultTopMargin = 235.0 - sliverOffset;

    double top = defaultTopMargin;
    double scale = 1.0;
    if (_scrollController!.hasClients) {
      double offset = _scrollController!.offset;
      top -= offset;
    }

    return Positioned(
      top: top,
      child: Transform(
        transform: Matrix4.identity()..scale(scale),
        alignment: Alignment.center,
        child: Container(
          height: 80.0,
          margin: const EdgeInsets.only(left: 8.0, right: 8.0),
          width: MediaQuery.of(context).size.width - 16.0,
          child: Card(
            elevation: 2.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Text(
                        'Book Lab Tests with Prescription',
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Save 50%',
                          style: TextStyle(
                              fontSize: 12.0, color: Colors.blueGrey[700]),
                        ),
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  SizedBox(
                    height: 35,
                    width: 100,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.lightBlue[400]),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                      ),
                      child: const Text(
                        'UPLOAD',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildSliverList() {
    return [
      Column(
        children: <Widget>[
          const SizedBox(
            height: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              carouselSlider = CarouselSlider(
                items: carouselImageList!.map((imgUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 2.0),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(3.0)),
                          child: Image.asset(
                            imgUrl,
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 90.0,
                  initialPage: 0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  reverse: false,
                  enableInfiniteScroll: true,
                  viewportFraction: 1.0,
                  autoPlayInterval: const Duration(seconds: 7),
                  autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                  pauseAutoPlayOnTouch: true,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: map<Widget>(carouselImageList!, (index, url) {
                  return Container(
                    width: 6.0,
                    height: 6.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index
                          ? Colors.blue
                          : Colors.grey[300],
                    ),
                  );
                }),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(left: 16.0),
            alignment: Alignment.topLeft,
            child: Text('POPULAR PATHOLOGY TESTS',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                )),
          ),
          const SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: 175,
            child: ListView.builder(
              itemCount: pathologyTestList!.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return _buildPathologyTests(pathologyTestList![index]);
              },
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.only(left: 16.0),
            alignment: Alignment.topLeft,
            child: Text('POPULAR RADIOLOGY TESTS',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                )),
          ),
          const SizedBox(
            height: 15.0,
          ),
          SizedBox(
            height: 175,
            child: ListView.builder(
                itemCount: radiologyTestList!.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return _buildRadiologyTests(radiologyTestList![index]);
                }),
          ),
        ],
      ),
      const SizedBox(
        height: 15.0,
      ),
      Container(
        padding: const EdgeInsets.only(left: 16.0),
        alignment: Alignment.topLeft,
        child: Text('POPULAR HEALTH CHECKUP CATEGORIES',
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 12,
              fontWeight: FontWeight.w600,
            )),
      ),
      const SizedBox(
        height: 15.0,
      ),
      SizedBox(
        height: 120,
        child: ListView.builder(
            itemCount: healthCategoriesList!.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return _buildHealthCategories(healthCategoriesList![index]);
            }),
      ),
      const SizedBox(
        height: 25.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 16.0),
            alignment: Alignment.topLeft,
            child: Text('FULL BODY CHECKUP',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                )),
          ),
          Container(
            padding: const EdgeInsets.only(right: 15.0),
            child: Text('SEE ALL',
                style: TextStyle(
                  color: Colors.blueGrey[700],
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                )),
          ),
        ],
      ),
      const SizedBox(
        height: 7.0,
      ),
      SizedBox(
        height: 230,
        child: ListView.builder(
            itemCount: fullBodyCheckList!.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return _buildFullBodyCheckUp(fullBodyCheckList![index]);
            }),
      ),
      const SizedBox(
        height: 25.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 25.0),
            alignment: Alignment.topLeft,
            child: Text('HEALTH CHECKUPS @HOME',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                )),
          ),
          Container(
            padding: const EdgeInsets.only(right: 15.0),
            child: Text('SEEALL',
                style: TextStyle(
                  color: Colors.blueGrey[700],
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                )),
          ),
        ],
      ),
      const SizedBox(
        height: 7.0,
      ),
      SizedBox(
        height: 225,
        child: ListView.builder(
            itemCount: healthCheckHomeList!.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return _buildHealthCheckHome(healthCheckHomeList![index]);
            }),
      ),
      const SizedBox(
        height: 25.0,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 25.0),
            alignment: Alignment.topLeft,
            child: Text('FEATURED LABS',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                )),
          ),
          Container(
            padding: const EdgeInsets.only(right: 15.0),
            child: Text(
              'SEEALL',
              style: TextStyle(
                color: Colors.blueGrey[700],
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 7.0,
      ),
      SizedBox(
        height: 175,
        child: ListView.builder(
            // physics: AlwaysScrollableScrollPhysics(),
            itemCount: featureLabList!.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return _buildFeaturedLab(featureLabList![index]);
            }),
      ),
    ];
  }

  Widget _buildPathologyTests(PathologyTests item) {
    return Card(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        width: 150,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  item.title,
                  overflow: TextOverflow.visible,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700,
                    height: 1.1,
                  ),
                  maxLines: 2,
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 2),
                    child: Text(item.subtitle,
                        style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.blueGrey)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 4.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item.description,
                      style: const TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.blueGrey),
                    ),
                  ),
                ],
              ),
              flex: 2,
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  item.offer,
                  style: const TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.green),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                const Text(
                  'MRP',
                  style: TextStyle(fontSize: 12.0),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Text(
                    item.price,
                    style: const TextStyle(
                        fontSize: 10.0, decoration: TextDecoration.lineThrough),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    item.offerPrice,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      item.add,
                      style: const TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRadiologyTests(RadiologyTests item) {
    return Card(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        width: 150,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  item.title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 12.0, fontWeight: FontWeight.w700),
                  maxLines: 2,
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(item.subtitle,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.blueGrey)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 4.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item.description,
                      style: const TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.blueGrey),
                    ),
                  ),
                ],
              ),
              flex: 2,
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  item.offer,
                  style: const TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.green),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                const Text(
                  'MRP',
                  style: TextStyle(fontSize: 12.0),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Text(
                    item.price,
                    style: const TextStyle(
                        fontSize: 10.0, decoration: TextDecoration.lineThrough),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    item.offerPrice,
                    style: const TextStyle(
                        fontSize: 12.0, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      item.add,
                      style: const TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildHealthCategories(HealthCheckCategories item) {
    return Card(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        width: 110,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              item.imageUrl,
              width: 60.0,
              height: 60.0,
            ),
            Text(
              item.title,
              style: const TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.w400,
                fontSize: 12.0,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFullBodyCheckUp(FullBodyCheck item) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 2,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
          width: 145,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    item.title,
                    overflow: TextOverflow.visible,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w700,
                      height: 1.1,
                    ),
                    maxLines: 2,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(item.subtitle,
                      style: const TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.blueGrey)),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    item.imageUrl,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.0),
                        color: Colors.green,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            item.rating,
                            style: const TextStyle(
                                fontSize: 10.0, color: Colors.white),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 10.0,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      item.ratingTitle,
                      style:
                          const TextStyle(fontSize: 10.0, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    item.offer,
                    style: const TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.green),
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Text(
                    item.mrp,
                    style: const TextStyle(fontSize: 12.0),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: Text(
                      item.price,
                      style: const TextStyle(
                          fontSize: 10.0,
                          decoration: TextDecoration.lineThrough),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      item.offerPrice,
                      style: const TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        item.add,
                        style: const TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHealthCheckHome(HealthCheckUpHome item) {
    return Card(
      elevation: 2,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        width: 145,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  item.title,
                  overflow: TextOverflow.visible,
                  style: const TextStyle(
                      fontSize: 12.0, fontWeight: FontWeight.w700),
                  maxLines: 2,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(bottom: 5),
                child: Text(item.subtitle,
                    style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.blueGrey)),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  item.imageUrl,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 2.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Colors.green,
                    ),
                    child: Row(
                      children: <Widget>[
                        Text(
                          item.rating,
                          style: const TextStyle(
                              fontSize: 10.0, color: Colors.white),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 10,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    item.ratingTitle,
                    style: const TextStyle(fontSize: 10.0, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  item.offer,
                  style: const TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.green),
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Text(
                  item.mrp,
                  style: const TextStyle(fontSize: 12.0),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Text(
                    item.price,
                    style: const TextStyle(
                        fontSize: 10.0, decoration: TextDecoration.lineThrough),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    item.offerPrice,
                    style: const TextStyle(
                        fontSize: 13.0, fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      item.add,
                      style: const TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedLab(FeatureLab item) {
    return Card(
      elevation: 2,
      child: SizedBox(
        width: 145,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 12.0),
                alignment: Alignment.center,
                height: 190,
                child: Image.asset(
                  item.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 5.0, right: 5.0),
              height: 1.0,
              color: Colors.grey[300],
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.only(left: 10.0, bottom: 5.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  item.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
