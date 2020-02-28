import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  SettingsScreen(this.saveFilters, this.currentFilters);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  bool _glutenFree  = false;
  bool _vegetarian  = false;
  bool _vegan       = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    super.initState();
  }

  Widget mySwitches(String title, String subtitle,bool value, Function function){
    return SwitchListTile(
      title: Text(title),
      value: value,
      subtitle: Text(subtitle),
      onChanged: function,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
                'lactose': _lactoseFree,
              };
              widget.saveFilters(selectedFilters);
              Navigator.of(context).pushReplacementNamed('/');
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                'Adjust your meal selection.',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  mySwitches(
                    'Gluten-free',
                    'Only include gluten-free meals.',
                    _glutenFree,
                    (newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    }
                  ),
                  mySwitches(
                    'Vegetarian',
                    'Only include vegetarian meals.',
                    _vegetarian,
                    (newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }
                  ),
                  mySwitches(
                    'Vegan',
                    'Only include vegan meals.',
                    _vegan,
                    (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    }
                  ),
                  mySwitches(
                    'Lactose-free',
                    'Only include lactose-free meals.',
                    _lactoseFree,
                    (newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}