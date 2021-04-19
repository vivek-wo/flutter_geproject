import 'package:flutter/material.dart';
import 'home/home_index.dart';
import 'look/look_index.dart';
import 'mine/mine_index.dart';

class _Item {
  String tabName, tabIcon, tabCheckedIcon;

  _Item(this.tabName, this.tabIcon, this.tabCheckedIcon);
}

class HomeBottomNavigationBarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeBottomNavigationBarPageState();
  }
}

class _HomeBottomNavigationBarPageState
    extends State<HomeBottomNavigationBarPage> {
  List<Widget> tabPageList;

  final itemTab = [
    _Item('Home', 'assets/images/icon_main_tab_home.png',
        'assets/images/icon_main_tab_home_checked.png'),
    _Item('Look', 'assets/images/icon_main_tab_look.png',
        'assets/images/icon_main_tab_look_checked.png'),
    _Item('Mine', 'assets/images/icon_main_tab_mine.png',
        'assets/images/icon_main_tab_mine_checked.png')
  ];

  List<BottomNavigationBarItem> itemList;

  @override
  void initState() {
    super.initState();
    if (tabPageList == null) {
      tabPageList = [HomeIndexPage(), LookIndexPage(), MineIndexPage()];
    }
    if (itemList == null) {
      itemList = itemTab
          .map((item) => BottomNavigationBarItem(
              icon: Image.asset(
                item.tabIcon,
                width: 30.0,
                height: 30.0,
              ),
              label: item.tabName,
              activeIcon: Image.asset(
                item.tabCheckedIcon,
                width: 30.0,
                height: 30.0,
              )))
          .toList();
    }
  }

  int _tabSelectedIndex = 0;

  Widget _getTabPageByIndex() {
    return tabPageList[_tabSelectedIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getTabPageByIndex(),
      bottomNavigationBar: BottomNavigationBar(
        items: itemList,
        onTap: (int index) {
          setState(() {
            _tabSelectedIndex = index;
          });
        },
        currentIndex: _tabSelectedIndex,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
