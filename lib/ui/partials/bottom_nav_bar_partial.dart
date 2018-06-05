import 'package:flutter/material.dart';
import 'package:actworthy_citizen/ui/views/act_view.dart';
import 'package:actworthy_citizen/ui/views/inspire_view.dart';
import 'package:actworthy_citizen/ui/views/settings_view.dart';

// TODO: Document this when it fully works
class BottomNavBarPartial extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBarPartial> {
  PageController _controller = PageController();
  int _currentPage = 0;

  void _onBottomNavChange(int index) {
    _controller.animateToPage(index,
        duration: Duration(milliseconds: 200), curve: Curves.ease);
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          ActView(),
          InspireView(),
          SettingsView(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.check),
            title: Text('Act'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny),
            title: Text('Inspire'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
        onTap: _onBottomNavChange,
        currentIndex: _currentPage,
      ),
    );
  }
}

// class NavigationBarPartial extends StatefulWidget {
//   @override
//   NavigationBarPartialState createState() => NavigationBarPartialState();
// }

// // TODO: document this class
// class NavigationBarPartialState extends State {
//   int _currentIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: _currentIndex,
//       onTap: (index) {
//         this.setState(() {
//           _currentIndex = index;
//         });
//         _navigate(index, context);
//         debugPrint("Current: $_currentIndex Passed to onTap: $index");
//       },
//       items: <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: Icon(Icons.check),
//           title: Text('Act'),
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.wb_sunny),
//           title: Text('Inspire'),
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.settings),
//           title: Text('Settings'),
//         ),
//       ],
//     );
//   }

//   /// Takes the index of the BottomNavigationBarItem that was tapped and
//   /// navigates accordingly
//   void _navigate(int index, BuildContext context) {
//     String routeName = "";
//     // TODO: check index and update highlighted accordingly
//     switch (index) {
//       // FIXME: act pulls up non homescreen (new act screen w/back arrow) when clicked
//       case 0:
//         routeName = "/act";
//         break;
//       case 1:
//         routeName = "/inspire";
//         break;
//       case 2:
//         routeName = "/settings";
//         break;
//       default:
//         break;
//     }

//     Navigator.of(context).pushNamed(routeName);
//   }
// }
