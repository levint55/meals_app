import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersPage extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;

  final Map<String, bool> currentFilters;

  const FiltersPage(this.saveFilters, this.currentFilters, {Key? key})
      : super(key: key);

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    _lactoseFree = widget.currentFilters['lactose']!;
    super.initState();
  }

  Widget _buildListTile(
      bool variable, String text, String subtitle, Function(bool) updateValue) {
    return SwitchListTile(
      value: variable,
      onChanged: updateValue,
      title: Text(text),
      subtitle: Text(subtitle),
    );
  }

  void _onSave() {
    final selectedFilters = {
      'gluten': _glutenFree,
      'lactose': _lactoseFree,
      'vegan': _vegan,
      'vegetarian': _vegetarian,
    };
    widget.saveFilters(selectedFilters);
    Navigator.of(context).pushReplacementNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [IconButton(onPressed: _onSave, icon: const Icon(Icons.save))],
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _buildListTile(
                _glutenFree,
                "Gluten Free",
                'Only include gluten-free meals.',
                (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                },
              ),
              _buildListTile(
                _vegetarian,
                "Vegetarian",
                'Only include vegetarian meals.',
                (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                },
              ),
              _buildListTile(
                _vegan,
                "Vegan",
                'Only include vegan meals.',
                (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                },
              ),
              _buildListTile(
                _lactoseFree,
                'Lactose Free',
                'Only include lactose-free meals.',
                (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}
