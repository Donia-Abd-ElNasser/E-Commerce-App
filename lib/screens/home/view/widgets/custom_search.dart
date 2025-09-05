import 'package:ecommerce/core/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
                     // controller: _searchController,
                      onSubmitted: (value) {
                        // final search = capitalize(value.trim());
                        // if (search.isNotEmpty) {
                        //   BlocProvider.of<MealsCubit>(
                        //     context,
                        //   ).SearchRecipe(searchWord: search);
                        // } else {
                        //   BlocProvider.of<MealsCubit>(context).fetchAllMeals();
                        // }
                      },
                      cursorColor: kButtonColor,
                      cursorHeight: 20,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(color: kButtonColor),
                        labelStyle: TextStyle(color: kButtonColor),
                        hintText: 'Search',
                        suffixIcon: IconButton(
                          onPressed: () {
                            // final search = capitalize(
                            //   _searchController.text.trim(),
                            // );
                            // if (search.isNotEmpty) {
                            //   BlocProvider.of<MealsCubit>(
                            //     context,
                            //   ).SearchRecipe(searchWord: search);
                            // } else {
                            //   BlocProvider.of<MealsCubit>(
                            //     context,
                            //   ).fetchAllMeals();
                            // }
                          },
                          icon: Icon(CupertinoIcons.search),
                          color: kButtonColor,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kButtonColor),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: kButtonColor),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    );
  }
}