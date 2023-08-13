import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  final List<Meal> _favorites = [];

  void _toggleMealFavorites(Meal meal) {
    final existingMeal = _favorites.contains(meal);
    if (existingMeal) {
      setState(() {
        _favorites.remove(meal);
      });
    } else {
      setState(() {
        _favorites.add(meal);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onToggleFavorties: _toggleMealFavorites,
    );
    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favorites,
        onToggleFavourties: _toggleMealFavorites,
      );
      activePageTitle = 'Favorites';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
