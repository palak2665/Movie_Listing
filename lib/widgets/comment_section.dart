import 'package:flutter/material.dart';

class CommentSection extends StatelessWidget {
  const CommentSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              ListTile(
                leading: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.pink,
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "4.0",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                title: const Text(
                  "SACRED GAMES is an intense series. The plot, the twists, the action: everything says it well. ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {},
              ),
              const Divider(
                height: 5.0,
              ),
            ],
          );
        },
        itemCount: 8,
      ),
    );
  }
}
