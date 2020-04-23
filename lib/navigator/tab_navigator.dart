import 'package:flutter/material.dart';
import 'package:flutter_basic/pages/main_drawer.dart';
import 'package:flutter_basic/pages/tab/discover_page.dart';
import 'package:flutter_basic/pages/tab/home_page.dart';
import 'package:flutter_basic/pages/tab/my_page.dart';
import 'package:flutter_basic/presentation/platform_adaptive.dart';
import 'package:flutter_basic/styles/colors.dart';
import 'package:flutter_basic/utils/i18n_util.dart';


class TabNavigator extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator>{

  Color _defaultColor = colorStyles['light_gray'];
  Color _activeColor = colorStyles['primary'];
  final List<String> _titles = [];
  String _title = '';

  int _currentIndex = 0;
  final PageController _controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _defaultColor = Colors.grey;
    _activeColor = Theme.of(context).primaryColor;
    _titles.clear();
    _titles.add(I18nUtil.getS(context).tab_home);
    _titles.add(I18nUtil.getS(context).tab_discover);
    _titles.add(I18nUtil.getS(context).tab_my);
    _title = _titles[0];
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        centerTitle: true,
      ),
      body: PageView(
        controller: _controller,
        children: <Widget>[
          HomePage(),
          DiscoverPage(),
          MyPage()
        ],
        onPageChanged: (index){
          _switchTab(index);
        },
      ),
      bottomNavigationBar: PlatformAdaptiveBottomBar(
        currentIndex: _currentIndex,
        onTap: (index){
          _controller.jumpToPage(index);
          _switchTab(index);
        },
        items: [
          _itemBar(_currentIndex == 0, Icons.home, _titles[0], _defaultColor, _activeColor),
          _itemBar(_currentIndex == 1, Icons.add_circle_outline, _titles[1], _defaultColor, _activeColor),
          _itemBar(_currentIndex == 2, Icons.account_circle, _titles[2], _defaultColor, _activeColor),
        ],
      ),
      drawer: MainDrawer(),
    );
  }

  _switchTab(int index){
    setState(() {
      _currentIndex = index;
      _title = _titles[index];
    });
  }

  _itemBar(bool active,IconData icon,String title,Color defaultColor,Color activeColor){
    return BottomNavigationBarItem(
      icon: Icon(icon,color: defaultColor,),
      activeIcon: Icon(icon,color: activeColor,),
      title: Text(title,style: TextStyle(color: active ? activeColor : defaultColor),)
    );
  }

}