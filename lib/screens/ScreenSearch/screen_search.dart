import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/functions/api_functions.dart';
import 'package:netflix/models/categories.dart';
import 'package:netflix/screens/ScreenSearch/widgets/fiter_selection.dart';
import 'package:netflix/screens/ScreenSearch/widgets/search_results.dart';
import 'package:netflix/screens/widgets/appbar.dart';
import 'package:netflix/utils/colors.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  bool isSearchClicked = false;
  String searchQuery = '';
  bool isLoading = false;
  ContentCategories? searchResults;
  final TextEditingController _searchController = TextEditingController();

  Future<void> _performSearch(String query) async {
    if (query.isEmpty) return;

    setState(() {
      isLoading = true;
      isSearchClicked = true;
    });

    try {
      ContentCategories results = await Api().searchMovies(query);
      setState(() {
        searchResults = results;
      });
    } catch (error) {
      log(error.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(title: "Search"),
            Container(
              margin: const EdgeInsets.all(25),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: 65,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey, width: 2),
                color: AppStyle.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.movie_creation, color: Colors.grey),
                  SizedBox(
                    width: 180,
                    height: 80,
                    child: Center(
                      child: TextFormField(
                        controller: _searchController,
                        style: GoogleFonts.outfit(color: AppStyle.black),
                        onFieldSubmitted: _performSearch,
                        onChanged: (value) {
                        setState(() {
                          searchQuery = value;
                          isSearchClicked = true; // Ensure results show on typing
                        });
                        log("Search Query Updated: $searchQuery"); // Debugging print
                      },

                        cursorColor: Colors.grey,
                        cursorHeight: 20,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: GoogleFonts.lato(
                            color: Colors.grey,
                            fontSize: 19,
                          ),
                          hintText: 'Search by title...',
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (isSearchClicked) {
                          _searchController.clear();
                          isSearchClicked = false;
                          searchQuery = '';
                          searchResults = null;
                        } else {
                          _performSearch(_searchController.text);
                        }
                      });
                    },
                    icon: Icon(
                      isSearchClicked ? Icons.close : Icons.search,
                      color: AppStyle.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: isSearchClicked
                  ? SearchResultsList(
                      searchQuery: searchQuery,
                      searchResults: searchResults,
                      isLoading: isLoading,
                    )
                  : const FilterSelection(),
            ),
          ],
        ),
      ),
    );
  }
}
