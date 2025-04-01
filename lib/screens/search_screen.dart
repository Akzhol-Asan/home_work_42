import 'package:flutter/material.dart';
import 'package:home_work_42/models/cocktail_list_item.dart';
import 'package:home_work_42/screens/single_cocktail_screen.dart';

import '../widgets/cocktail_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<CocktailListItem> cocktails = [];

  @override
  void initState() {
    super.initState();

    cocktails = [
      CocktailListItem(
        drinkId: 1,
        name: 'Margarita',
        category: 'Category 1',
        glass: 'MG glass',
        instruction: 'Shake & Drink',
        ingredients: ['tequila', 'ice'],
        measures: ['1/1 tequila', '3 ice'],
        image: 'image.link',
        alcoholic: 'Alcoholic',
      ),
      CocktailListItem(
        drinkId: 2,
        name: 'Margarita',
        category: 'Category 1',
        glass: 'MG glass',
        instruction: 'Shake & Drink',
        ingredients: ['tequila', 'ice'],
        measures: ['1/1 tequila', '3 ice'],
        image: 'image.link',
        alcoholic: 'Alcoholic',
      ),
      CocktailListItem(
        drinkId: 3,
        name: 'Margarita',
        category: 'Category 1',
        glass: 'MG glass',
        instruction: 'Shake & Drink',
        ingredients: ['tequila', 'ice'],
        measures: ['1/1 tequila', '3 ice'],
        image: 'image.link',
        alcoholic: 'Non alcoholic',
      ),
    ];
  }

  void onLearnMoreTap(BuildContext context, CocktailListItem cocktail) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => SingleCocktailScreen(cocktails: cocktail),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(labelText: 'Search cocktail'),
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ],
        ),
      ),
      body: Padding(
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
      ),
    );
  }
}
