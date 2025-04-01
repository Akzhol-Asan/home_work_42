import 'package:flutter/material.dart';
import 'package:home_work_42/models/cocktail_list_item.dart';

class SingleCocktailScreen extends StatelessWidget {
  final CocktailListItem cocktails;

  const SingleCocktailScreen({super.key, required this.cocktails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(cocktails.name)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(cocktails.image),
            SizedBox(height: 10),
            Text('- ${cocktails.category}'),
            SizedBox(height: 5),
            Text('- ${cocktails.alcoholic}'),
            SizedBox(height: 5),
            Text('- ${cocktails.glass}'),
            SizedBox(height: 5),
            Text('- ${cocktails.ingredients.toString()}'),
            SizedBox(height: 5),
            Text('- ${cocktails.measures.toString()}'),
            SizedBox(height: 5),
            Text('- ${cocktails.instruction}'),
          ],
        ),
      ),
    );
  }
}
