
import 'package:flutter/material.dart';
// import 'package:smn_v1/sidebar/menu_item.dart';

class SearchBar extends SearchDelegate<String>{

  final menuItems = [
    "Home",
    "Attendance",
    "Settings",
    "Profile",
  ];

final recentMenuItems = [
  "Attendance",
  "Settings",
  "Profile",
];

  @override
  List<Widget> buildActions(BuildContext context) {
   
    return [
      IconButton(icon: Icon(Icons.clear), 
      onPressed: () {
        query = "";
      })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
   
    return IconButton(
      icon: AnimatedIcon(
      icon: AnimatedIcons.menu_arrow,
      progress: transitionAnimation,
      ),
    onPressed: (){
      close(context, null);
      // showSearch(context: context, delegate: SearchBar());
    });
    
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(

    );
    
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recentMenuItems : menuItems.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.menu),
        title: RichText(text: TextSpan(
          text: suggestionList[index].substring(0,query.length),
          style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold
          ),
          children: [TextSpan(
            text: suggestionList[index].substring(query.length),
            style: TextStyle(color: Colors.grey))
          ]),
        ),
      ),
      itemCount: suggestionList.length,
      );
  }

}