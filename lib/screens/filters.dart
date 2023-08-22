import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilters});
  final Map<Filter, bool> currentFilters;
  @override
  State<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetrianFreeFilterSet = false;
  var _veganFreeFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _veganFreeFilterSet = widget.currentFilters[Filter.vegan]!;
    _vegetrianFreeFilterSet = widget.currentFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: ((identifer) {
      //     Navigator.of(context).pop();
      //     if (identifer == "meals") {
      //       Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(
      //           builder: (ctx) => const TabsScreen(),
      //         ),
      //       );
      //     }
      //   }),
      // ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetrianFreeFilterSet,
            Filter.vegan: _veganFreeFilterSet
          });
          return false;
        },
        child: Column(children: [
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
          SwitchListTile(
            value: _lactoseFreeFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _lactoseFreeFilterSet = isChecked;
              });
            },
            title: Text(
              'Lactose Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.brown,
                  ),
            ),
            subtitle: Text(
              "Only incline lactose-free meals",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Colors.brown,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            inactiveThumbColor: Theme.of(context).colorScheme.tertiary,
            inactiveTrackColor: Colors.grey,
            contentPadding: const EdgeInsets.only(left: 34, right: 34),
          ),
          SwitchListTile(
            value: _vegetrianFreeFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _vegetrianFreeFilterSet = isChecked;
              });
            },
            title: Text(
              'Vegetrain Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.brown,
                  ),
            ),
            subtitle: Text(
              "Only incline vegetrian-free meals",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Colors.brown,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            inactiveThumbColor: Theme.of(context).colorScheme.tertiary,
            inactiveTrackColor: Colors.grey,
            contentPadding: const EdgeInsets.only(left: 34, right: 34),
          ),
          SwitchListTile(
            value: _veganFreeFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _veganFreeFilterSet = isChecked;
              });
            },
            title: Text(
              'Vegan Free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.brown,
                  ),
            ),
            subtitle: Text(
              "Only incline vegan-free meals",
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
      ),
    );
  }
}
