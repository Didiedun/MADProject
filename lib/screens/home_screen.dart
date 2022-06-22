import 'dart:async';
import 'package:books_app/providers/nyt.dart';
import 'package:books_app/widgets/app_title.dart';
import 'package:books_app/widgets/categoriesWidgets/categories_section.dart';
import 'package:books_app/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  // Called when this State object changes.
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    getBooksData();
  }

  Future<void> getBooksData() async {
    await Provider.of<NYT>(context, listen: false).getCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: NavBar(HomeScreen.routeName),
      body: RefreshIndicator(
        color: Color(0xff0DB067),
        backgroundColor: Colors.white,
        displacement: 80,
        onRefresh: () async {
          await getBooksData();
        },
        child: Column(
          children: <Widget>[
            AppTitle(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 50.0),
                    // Showcase(),
                    Container(child: CategoriesSection()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
