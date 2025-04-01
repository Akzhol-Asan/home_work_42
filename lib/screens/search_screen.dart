import 'package:flutter/material.dart';
import 'package:home_work_42/models/cocktail_list_item.dart';
import 'package:home_work_42/screens/single_cocktail_screen.dart';
import '../helpers/cocktail_request.dart';
import '../widgets/cocktail_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<CocktailListItem> cocktails = [];
  TextEditingController search = TextEditingController();
  bool isFetching = true;
  String? fetchError;

  Future<void> fetchData(String cocktailName) async {
    try {
      final List<dynamic> cocktailData = await request(
        cocktailName.isEmpty
            ? 'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita'
            : 'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$cocktailName',
      );

      if (cocktailData.isEmpty) {
        setState(() {
          fetchError = 'Error';
          isFetching = false;
        });
        return;
      }

      setState(() {
        cocktails =
            cocktailData
                .map((json) => CocktailListItem.fromJson(json))
                .toList();
        isFetching = false;
      });
    } catch (error) {
      fetchError = error.toString();
      isFetching = false;
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData('');
  }

  void onLearnMoreTap(BuildContext context, CocktailListItem cocktails) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => SingleCocktailScreen(cocktails: cocktails),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (isFetching) {
      content = Center(child: CircularProgressIndicator());
    } else if (fetchError != null) {
      content = Center(child: Text('Error!'));
    } else {
      content = Padding(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: cocktails.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            mainAxisExtent: 300,
          ),
          itemBuilder:
              (ctx, i) => CocktailCard(
                cocktail: cocktails[i],
                onTap: () => onLearnMoreTap(context, cocktails[i]),
              ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(
                controller: search,
                decoration: InputDecoration(labelText: 'Search cocktail'),
              ),
            ),
            IconButton(
              onPressed: () {
                fetchData(search.text);
              },
              icon: Icon(Icons.search),
            ),
          ],
        ),
      ),
      body: content,
    );
  }
}
