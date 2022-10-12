import 'package:flutter/material.dart';
import 'package:movie_listing/models/movie_list_model.dart';
import 'package:movie_listing/widgets/comment_section.dart';
import 'package:movie_listing/widgets/consts.dart';

import '../services/services.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: FutureBuilder<MovieDetails>(
            future: Services().getMovieApi(),
            builder:
                (BuildContext context, AsyncSnapshot<MovieDetails> snapshot) {
              final data = snapshot.data;
              if (snapshot.hasData) {
                final seriesdetails = data!.series!;
                List<Character> char = data.characters!.cast<Character>();
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        seriesdetails.title.toString(),
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, right: 10.0, bottom: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white),
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2.0, horizontal: 5.0),
                                child: Text('18+',
                                    style:
                                        Theme.of(context).textTheme.bodyText2),
                              ),
                            ),
                          ),
                          Text(
                            seriesdetails.ott.toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18.0),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Icon(
                            Icons.favorite,
                            color: Colors.pink,
                          ),
                          const Text(
                            '4.0',
                            style: TextStyle(color: Colors.pink),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Overview",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        seriesdetails.desc.toString(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          "Cast",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      SizedBox(
                        height: deviceHeight! * 0.37,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: char.length,
                          itemBuilder: (BuildContext context, int index) =>
                              Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Card(
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: (() {
                                      showDialog(
                                          context: context,
                                          builder: (_) => Dialog(
                                                child: Container(
                                                  height: deviceHeight! * 0.6,
                                                  width: deviceWidth! * 0.9,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                          image: ExactAssetImage(
                                                              char[index]
                                                                  .img
                                                                  .toString()),
                                                          fit: BoxFit.cover)),
                                                ),
                                              ));
                                    }),
                                    child: Image(
                                      image: AssetImage(
                                          char[index].img.toString()),
                                      height: deviceHeight! * 0.25,
                                      width: deviceWidth! * 0.4,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: .0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(char[index].name.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline2),
                                        Text(
                                            'Role: ${char[index].profession.toString()}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3),
                                        Text(
                                            'Age: ${char[index].age.toString()}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 10.0),
                        child: Text(
                          "Reviews",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      const CommentSection(),
                    ]);
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            }),
      ),
    );
  }
}
