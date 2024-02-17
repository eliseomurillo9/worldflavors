import 'package:flutter/material.dart';
import 'package:worldflavors/ui/share/CategoryItem.dart';
import 'package:worldflavors/ui/share/appbar_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key ? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget('search'),
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Text(
                  'Rechercher',
                  style: TextStyle(
                    color: Color(0xFFB12E23),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F4F4),
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'hola que hace',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.search, color: Colors.orange),
                      onPressed: () {
                        print('I worked');
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Trier par ingredients',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 2,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return CategoryItem(
                    categoryName: 'Category ${index + 1}',
                    onPressed: () {
                      print('searching cat');
                    }, key: null,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  }

