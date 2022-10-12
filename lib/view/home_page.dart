import 'package:flutter/material.dart';
import 'package:movie_listing/models/movie_list_model.dart';
import 'package:movie_listing/widgets/consts.dart';
import '../widgets/movie_card.dart';
import '../widgets/rating_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.movieDetails});
  final MovieDetails? movieDetails;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const Icon(Icons.video_library_outlined),
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: const Icon(
          Icons.favorite,
          color: Colors.white,
        ),
        onPressed: () {
          showDialog(context: context, builder: (_) => const RatingDialog());
        },
      ),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            height: deviceHeight,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://m.media-amazon.com/images/I/81PQWB5wrqL._SL1500_.jpg'))),
          ),
          CustomScrollView(
            anchor: 0.4,
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.transparent,
                  height: deviceHeight! * 0.04,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        height: deviceHeight! * 0.04,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: MovieCard(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
