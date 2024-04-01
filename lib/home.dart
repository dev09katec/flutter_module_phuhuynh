import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(42.0), // Đặt kích thước ưa thích là 50.0
        child: AppBar(
          backgroundColor: Colors.blue, // Màu nền xanh
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: Image.asset(
                  'assets/logo.png', // Thay đổi đường dẫn đến hình ảnh của logo của bạn
                  height: 100,
                  width: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                // Xử lý sự kiện khi nhấn vào biểu tượng tìm kiếm
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                // Xử lý sự kiện khi nhấn vào biểu tượng thông báo
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Carousel
              SizedBox(
                height: 340,
                child: Stack(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 250,
                        aspectRatio: 16 / 9,
                        viewportFraction: 1.0,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 2),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                      items: [
                        'assets/home/home1.jpg',
                        'assets/home/home2.jpg',
                      ].map((item) {
                        return Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(item),
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 220,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        padding: const EdgeInsets.only(top: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildItemMain(Icons.edit_calendar, 'Báo cắt suất',
                                '/Nghỉ học', Colors.blue),
                            _buildItemMain(Icons.account_balance_wallet,
                                'Thanh toán', 'học phí', Colors.blue),
                            _buildItemMain(Icons.calendar_month,
                                'Thời khóa biểu', '', Colors.blue),
                            _buildItemMain(
                                Icons.food_bank, 'Thực đơn', '', Colors.blue),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Menu Extend
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildItemExtend(
                          Icons.bookmark_add,
                          'Đăng ký',
                          'môn năng khiếu',
                          const Color.fromARGB(255, 232, 105, 105),
                          const Color.fromARGB(255, 254, 249, 204)),
                      _buildItemExtend(
                          Icons.monitor_heart,
                          'Sổ theo dõi',
                          'sức khỏe',
                          const Color.fromARGB(255, 114, 214, 126),
                          const Color.fromARGB(255, 254, 249, 204)),
                      _buildItemExtend(
                          Icons.school,
                          'Sổ',
                          'bé ngoan',
                          const Color.fromARGB(255, 114, 214, 126),
                          const Color.fromARGB(255, 254, 249, 204)),
                      _buildItemExtend(
                          Icons.insert_page_break,
                          'Đánh giá ',
                          'giáo viên',
                          const Color.fromARGB(255, 232, 105, 105),
                          const Color.fromARGB(255, 254, 249, 204)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildItemExtend(
                          Icons.photo_album,
                          'Kho ảnh',
                          'hoạt động',
                          const Color.fromARGB(255, 226, 114, 183),
                          const Color.fromARGB(255, 254, 249, 204)),
                      _buildItemExtend(
                          Icons.energy_savings_leaf_sharp,
                          'Năng lượng',
                          'dinh dưỡng',
                          const Color.fromARGB(255, 239, 174, 104),
                          const Color.fromARGB(255, 254, 249, 204)),
                      _buildItemExtend(
                          Icons.no_food,
                          'Báo thực phẩm',
                          'bị dị ứng',
                          const Color.fromARGB(255, 239, 174, 104),
                          const Color.fromARGB(255, 254, 249, 204)),
                      _buildItemExtend(
                          Icons.health_and_safety,
                          'Lịch sử',
                          'tiêm ngừa',
                          const Color.fromARGB(255, 226, 114, 183),
                          const Color.fromARGB(255, 254, 249, 204)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Suggest
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        child: const Text(
                          'Bài viết và thông báo của trường',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(
                              255, 175, 216, 250), // Background color
                          shape: BoxShape.circle, // Circular shape
                        ),
                        padding: const EdgeInsets.all(
                            4), // Padding for the container
                        child: const Icon(Icons.arrow_forward_ios,
                            size: 16, color: Colors.black), // Icon widget
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildCustomCard(
                          'assets/home/home3.jpg', 'THÔNG TIN VỀ NHÀ TRƯỜNG'),
                      buildCustomCard('assets/home/home4.jpg',
                          'HOẠT ĐỘNG NGOẠI KHÓA THÁNG 4/2024'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildCustomCard('assets/home/home5.jpg',
                          'THEO DÕI HOẠT ĐỘNG CỦA BÉ TẠI TRƯỜNG'),
                      buildCustomCard('assets/home/home6.jpg',
                          'KẾT NỐI GIA ĐÌNH VÀ NHÀ TRƯỜNG'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        // Xử lý sự kiện khi nút được nhấn
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                      ),
                      child: const Text(
                        'Xem tất cả',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: const Text(
                          'Dịch vụ đối tác',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(
                              255, 175, 216, 250), // Background color
                          shape: BoxShape.circle, // Circular shape
                        ),
                        padding: const EdgeInsets.all(
                            4), // Padding for the container
                        child: const Icon(Icons.arrow_forward_ios,
                            size: 16, color: Colors.black), // Icon widget
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        buildCircularImage('assets/home/home7.jpg'),
                        buildCircularImage('assets/home/home7.jpg'),
                        buildCircularImage('assets/home/home7.jpg'),
                        buildCircularImage('assets/home/home7.jpg'),
                        buildCircularImage('assets/home/home7.jpg'),
                        buildCircularImage('assets/home/home7.jpg'),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemMain(
      IconData icon, String title1, String title2, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 40, color: color),
        const SizedBox(height: 8),
        SizedBox(
          width: 80,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$title1\n', // First line of text
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: title2,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildItemExtend(IconData icon, String title1, String title2,
      Color color, Color backgroundColor) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 40, color: color),
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 80,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: '$title1\n', // First line of text
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: title2,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget buildCustomCard(String imagePath, String title) {
  return Container(
    height: 270,
    width: 180,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ],
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    child: Card(
      elevation: 0,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: SizedBox(
              height: 200,
              child: imagePath.contains('assets')
                  ? Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildCircularImage(String imagePath) {
  return SizedBox(
    width: 110, // Thay đổi kích thước nếu cần
    child: Column(
      children: [
        ClipOval(
          child: Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 5),
      ],
    ),
  );
}
