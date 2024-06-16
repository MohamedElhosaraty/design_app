// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:design_app/data/data.dart';
import 'package:design_app/models/post_model.dart';
import 'package:design_app/models/user_model.dart';
import 'package:flutter/material.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  PageController? pageCon;

  @override
  void initState() {
    pageCon = PageController(initialPage: 0, viewportFraction: .8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 400,
            child: PageView.builder(
                controller: pageCon,
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  Post post = posts[index];
                  return

                    AnimatedBuilder(
                      animation: pageCon!,
                      child: Stack(children: [
                        Container(
                          margin: EdgeInsets.all(10),

                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(2, 2),
                                color: Colors.black,
                                blurRadius: 5,
                              )
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image(
                              image: AssetImage(
                                '${post.imageUrl}',
                              ),
                              fit: BoxFit.cover,
                              height: 400,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Positioned(
                            top: 250,
                            bottom: 10,
                            left: 10,
                            right: 10,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),

                                ),
                                color: Colors.white.withOpacity(.7),

                              ),
                              height: 120,

                            )),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          right: 10,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${post.title}',
                                  style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  '${post.location}',
                                  style: TextStyle(
                                    fontSize: 21,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '❤ ${post.likes}',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.comment,
                                          color: Colors.blue,
                                        ),
                                        Text(
                                          ' ${post.comments}',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                // SizedBox(height: 10,),
                              ],
                            ),
                          ),
                        ),
                      ]),
                      builder: (context, child) {
                        double value = 1.0;
                        if (pageCon!.position.haveDimensions) {
                          value = pageCon!.page! - index;
                          value = (1 - (value.abs() * .80)).clamp(0.0, 1.0);
                        }
                        return  Center(
                          child:  SizedBox(
                            height: Curves.easeOut.transform(value) * 400,
                            width: double.infinity,
                            child: child
                            ,)
                          ,)
                        ;}
                      ,);
                }),
          ),
        ],
      ),
    );
  }
}
