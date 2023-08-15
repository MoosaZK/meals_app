import 'package:flutter/material.dart';
import 'package:meals/screens/tabs.dart';
import 'package:meals/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFreeFilterSet = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      drawer: MainDrawer(onSelectScreen: ((identifer) {
        Navigator.of(context).pop();
        if (identifer == "meals") {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => const TabsScreen(),
            ),
          );
        }
      })),
      body: Column(children: [
        SwitchListTile(
          value: _glutenFreeFilterSet,
          onChanged: (isChecked) {
            setState(() {
              _glutenFreeFilterSet = isChecked;
            });
          },
          title: Text(
            'Gluten Free',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Colors.brown,
                ),
          ),
          subtitle: Text(
            "Only incline gluten-free meals",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Colors.brown,
                ),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          inactiveThumbColor: Theme.of(context).colorScheme.tertiary,
          inactiveTrackColor: Colors.grey,
          contentPadding: const EdgeInsets.only(left: 34, right: 34),
        ),
      ]),
    );
  }
}
