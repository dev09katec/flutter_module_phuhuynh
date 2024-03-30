import 'package:flutter/material.dart';
import 'home.dart';
import 'card2.dart';
import 'card3.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = [
    const Home(),
    const Card2(),
    const Card3(),
    const Card3(),
    const Card3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(42.0), // Đặt kích thước ưa thích là 50.0
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
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: _selectedIndex,
        children: [
          BottomBarItem(
            icon: Icons.home,
            label: 'Trang chủ',
          ),
          BottomBarItem(
            icon: Icons.access_time_filled,
            label: 'Lịch sử',
          ),
          BottomBarItem(
            icon: Icons.edit_calendar,
            label: 'Nghỉ học',
          ),
          BottomBarItem(
            icon: Icons.person,
            label: 'Cá nhân',
          ),
        ],
        onMainPressed: () {
          setState(() {
            _selectedIndex = 4;
          });
        },
        onPressed: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class BottomBarItem {
  BottomBarItem({required this.icon, required this.label});

  IconData icon;
  String label;
}

class BottomBar extends StatelessWidget {
  final List<BottomBarItem> children;
  final Function? onPressed;
  final Function? onMainPressed;
  final selectedIndex;

  const BottomBar({
    super.key,
    this.children = const [],
    this.onPressed,
    this.onMainPressed,
    this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey[100],
      child: SafeArea(
        bottom: true,
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 8.0,
                offset: Offset(
                  0.0, // horizontal, move right 10
                  -1.0, // vertical, move down 10
                ),
              ),
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: children.map<Widget>(
                  (item) {
                    int index = children.indexOf(item);
                    bool isSelected = selectedIndex == index;
                    return Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            onPressed!(index);
                          },
                          child: Padding(
                            padding: EdgeInsets.zero,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  item.icon,
                                  size: isSelected ? 36 : 34,
                                  color: isSelected ? Colors.blue : Colors.grey,
                                ),
                                Text(
                                  item.label,
                                  style: TextStyle(
                                    color:
                                        isSelected ? Colors.blue : Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ).toList()
                  ..insert(2, const SizedBox(width: 80)),
              ),
              Positioned(
                bottom: -9.0,
                width: size.width,
                child: Center(
                  child: SizedBox(
                    height: 30,
                    child: Text(
                      'Quét mọi QR',
                      style: TextStyle(
                          color: selectedIndex == 4
                              ? Colors.blue
                              : const Color.fromARGB(255, 94, 94, 94),
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -24,
                width: size.width,
                child: Center(
                  child: Container(
                    height: 66,
                    width: 66,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Material(
                        color: selectedIndex == 4 ? Colors.blue : Colors.grey,
                        child: InkWell(
                          onTap: () {
                            onMainPressed!();
                          },
                          child: const Center(
                            child: Icon(
                              Icons.qr_code_scanner,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
