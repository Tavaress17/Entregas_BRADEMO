import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedTab = 0;
  bool _isFabMenuOpen = false;

  void _selectedTabCallback(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  void _toggleFabMenu() {
    setState(() {
      _isFabMenuOpen = !_isFabMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(title: Text("Bottom App Bar with FAB", style: TextStyle(color: Colors.white),), backgroundColor: Colors.blueAccent),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Text("TAB: $_selectedTab", style: TextStyle(fontSize: 24)),
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  if (_isFabMenuOpen)
                  Positioned(
                    bottom: 50,
                    child: Column(
                      children: [
                        _buildMiniFab(icon: Icons.message),
                        SizedBox(height: 20),
                        _buildMiniFab(icon: Icons.mail),
                        SizedBox(height: 20),
                        _buildMiniFab(icon: Icons.phone),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: _toggleFabMenu,
          tooltip: 'Menu',
          elevation: 0,
          shape: CircleBorder(),
          backgroundColor: Colors.blueAccent,
          child: Icon(_isFabMenuOpen ? Icons.close : Icons.add, color: Colors.white),
        ),
        bottomNavigationBar: FABBottomAppBar(
          items: [
            FABBottomAppBarItem(iconData: Icons.menu, text: "This"),
            FABBottomAppBarItem(iconData: Icons.layers, text: "Is"),
            FABBottomAppBarItem(iconData: Icons.maximize, text: "A"),
            FABBottomAppBarItem(iconData: Icons.dashboard, text: "Bottom"),
            FABBottomAppBarItem(iconData: Icons.info, text: "Bar"),
          ],
          onTabSelected: _selectedTabCallback,
          color: Colors.blueGrey,
          selectedColor: Colors.red,
          iconSize: 24,
          height: 60,
        ),
      ),
    );
  }

  Widget _buildMiniFab({required IconData icon}) {
    return Material(
      shape: CircleBorder(),
      color: Colors.white,
      child: InkWell(
        onTap: () {
          _toggleFabMenu();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Icon(icon, color: Colors.blueAccent, size: 28),
        ),
      ),
    );
  }
}

class FABBottomAppBarItem {
  final IconData iconData;
  final String text;

  FABBottomAppBarItem({required this.iconData, required this.text});
}

class FABBottomAppBar extends StatefulWidget {
  final List<FABBottomAppBarItem> items;
  final ValueChanged<int> onTabSelected;
  final Color color;
  final Color selectedColor;
  final double iconSize;
  final double height;

  const FABBottomAppBar({
    super.key,
    required this.items,
    required this.onTabSelected,
    required this.color,
    required this.selectedColor,
    required this.iconSize,
    required this.height,
  });

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  int _selectedIndex = 0;

  void _updateIndex(int index) {
    widget.onTabSelected(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items.length, (int index) {
      return _buildTabItem(
        item: widget.items[index],
        index: index,
        onPressed: _updateIndex,
      );
    });

    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }

  Widget _buildTabItem({
    required FABBottomAppBarItem item,
    required int index,
    required ValueChanged<int> onPressed,
  }) {
    Color color = _selectedIndex == index ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed(index),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(item.iconData, color: color, size: widget.iconSize),
                Text(item.text, style: TextStyle(color: color)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
