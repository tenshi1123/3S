import 'package:flutter/material.dart';
import 'package:three_s/utils/constants/styles.dart';

class DataSearch extends SearchDelegate<String> {
  final subject = [
    "toan",
    "ly",
    "hoa",
    "van",
    "su",
    "dia",
  ];
  @override
  TextStyle? searchFieldStyle = defaultText14;
  TextStyle search = defaultText14;
  final recentsubject = [
    "toan",
    "ly",
    "hoa",
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: defaultText20,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentsubject
        : subject.where((e) => e.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.subject),
        onTap: () {
          showResults(context);
        },
        title: RichText(
          text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style: defaultText16,
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: defaultText16.copyWith(color: Colors.grey),
                )
              ]),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
