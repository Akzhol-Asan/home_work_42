import 'package:flutter/material.dart';
import 'package:home_work_42/models/cocktail_list_item.dart';

class CocktailCard extends StatelessWidget {
  final void Function() onTap;
  final CocktailListItem cocktail;

  const CocktailCard({super.key, required this.cocktail, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              image: DecorationImage(
                image: NetworkImage(
                  'https://www.thecocktaildb.com/images/media/drink/vrwquq1478252802.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 8, top: 4, right: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Text(
                      cocktail.name,
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  Text('- ${cocktail.category}'),
                  Text(
                    '- ${cocktail.alcoholic}',
                    style: theme.textTheme.titleSmall!.copyWith(
                      color: Colors.deepOrange,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: onTap,
                    icon: Icon(Icons.arrow_right),
                    label: Text('Learn more'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
