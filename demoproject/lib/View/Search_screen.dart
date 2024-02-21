import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          showSearch(
            context: context,
            delegate: MySearchDelegate(),
          );
        },
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  List<String> searchitems = [
    'Head-Phones',
    'Samsung Phones',
    'Lenovo Tablets',
    'Asus Laptops',
    'Samsung Freeze',
    'Casual Shirts For men',
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text('This is the search results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return ListView(
      children: [
        InkWell(
          child: Text('Head-Phones'),
          onTap: () {},
        ),
        InkWell(
          child: Text('Samsung Phones'),
          onTap: () {},
        ),
        InkWell(
          child: Text('Lenovo Tablets'),
          onTap: () {},
        ),
        InkWell(
          child: Text('Asus Laptops'),
          onTap: () {},
        ),
        InkWell(
          child: Text('Samsung Freeze'),
          onTap: () {},
        ),
        InkWell(
          child: Text('Casual Shirts For men'),
          onTap: () {},
        ),
      ],
    );
  }
}
