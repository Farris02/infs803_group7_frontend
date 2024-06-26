import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infs803_group7_frontend/src/feature/movie/domain/provider/movie_provider.dart';
import 'package:infs803_group7_frontend/src/feature/movie/presentation/state/movie_state_notifier_provider.dart';
import 'package:infs803_group7_frontend/src/share/domain/model/movie.dart';
import 'package:infs803_group7_frontend/src/share/presentation/widget/adaptive_scaffold_appbar_widget.dart';

class MovieAdd extends ConsumerStatefulWidget {
  const MovieAdd({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => MovieAddState();
}

class MovieAddState extends ConsumerState<MovieAdd> {
  final formKey = GlobalKey<FormState>();
  final movieNameController = TextEditingController();
  final countryController = TextEditingController();
  final crewController = TextEditingController();
  final dateController = TextEditingController();
  final genreController = TextEditingController();
  final languageController = TextEditingController();
  final overviewController = TextEditingController();
  final revenueController = TextEditingController();
  final scoreController = TextEditingController();
  final budgetController = TextEditingController();
  final originTitleController = TextEditingController();
  final originLanguageController = TextEditingController();
  final statusController = TextEditingController();

  Movie movie = Movie();

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffoldAppbarWidget(
      title: "Movie Add",
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      controller: movieNameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Movie',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      controller: countryController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Country',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      controller: crewController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Crews',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      controller: dateController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Date',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      controller: genreController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Genre',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      controller: languageController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Language',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      controller: overviewController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Overview',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      controller: revenueController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Revenue Amount',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      controller: scoreController,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Please Enter a Score";
                        }
                        if (int.parse(val) < 0 || int.parse(val) > 100) {
                          return "Score can only be from 0 - 100 ";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Score Count',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      controller: revenueController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Revenue Amount',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      controller: budgetController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Budget Amount',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      controller: originLanguageController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Origin Language',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      controller: originTitleController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Origin Title',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: TextFormField(
                      controller: scoreController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Status',
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      movie.names = movieNameController.text;
                      movie.country = countryController.text;
                      movie.crew = crewController.text;
                      movie.dateX = dateController.text;
                      movie.genre = genreController.text;
                      movie.overview = overviewController.text;
                      movie.revenue = double.parse(revenueController.text);
                      movie.score = int.parse(scoreController.text);
                      movie.budgetX = double.parse(budgetController.text);
                      movie.deleted = false;
                      movie.origLang = originLanguageController.text;
                      movie.origTitle = originTitleController.text;
                      movie.status = statusController.text;

                      ref
                          .read(movieRepositoryProvider)
                          .updateMovie(ref.watch(movieIDProvider), movie)
                          .then(
                        (value) {
                          ref.refresh(movieListDataSourceProvider);
                          context.push("/movies");
                        },
                      );
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
