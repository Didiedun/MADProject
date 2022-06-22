import 'package:books_app/providers/categories.dart';
import 'package:books_app/widgets/categoriesWidgets/category_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:books_app/services/auth.dart';

class CategoriesSection extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<Categories>(context);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Align(
              alignment: Alignment.topRight,
              child: FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('Log Out'),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 1, left: 22.0, bottom: 8.0, right: 22.0),
            child: Text('Categories',
                style: GoogleFonts.montserrat(
                    textStyle:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.w700))),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.70,
            width: MediaQuery.of(context).size.width * 1.0,
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: categories.categoriesList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 0.01,
                crossAxisSpacing: 0.0,
                childAspectRatio: 2 / 3,
              ),
              itemBuilder: (context, i) =>
                  CategoryItem(categories.categoriesList[i]),
            ),
          ),
        ],
      ),
    );
  }
}
