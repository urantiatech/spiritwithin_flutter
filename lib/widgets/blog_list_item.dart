import 'package:flutter/material.dart';
import 'package:spirit_within_flutter/constants/app_constants.dart';
import 'package:spirit_within_flutter/screens/blog_screen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class BlogListItem extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  final String author;
  final String imgPath;
  final bool deletable;
  final Function deleteBlogFunction;

  const BlogListItem({
    this.title,
    this.description,
    this.time,
    this.author,
    this.imgPath,
    this.deletable = false,
    this.deleteBlogFunction,
  });

  @override
  Widget build(BuildContext context) {
    var fullWidth = MediaQuery.of(context).size.width;
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlogScreen(),
          ),
        );
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: 0),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // color: Colors.red[100],
                    // width: fullWidth * 0.58,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: normalTextColor,
                        fontFamily: 'SourceSerifPro',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    // width: fullWidth * 0.58,
                    child: Text(
                      description,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: subtleTextColor,
                        fontFamily: 'SourceSansPro',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    // width: fullWidth * 0.58,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 12,
                              color: moreSubtleTextColor,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              time,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: moreSubtleTextColor,
                                fontFamily: 'SourceSansPro',
                              ),
                            ),
                          ],
                        ),
                        author == null
                            ? SizedBox()
                            : Row(
                                children: [
                                  Icon(
                                    Icons.person_outline_rounded,
                                    size: 12,
                                    color: moreSubtleTextColor,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    author,
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: moreSubtleTextColor,
                                      fontFamily: 'SourceSansPro',
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      imgPath,
                      height: 96,
                      width: 96,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                deletable
                    ? Positioned(
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          child: IconButton(
                            splashRadius: 32,
                            splashColor: Colors.white38,
                            onPressed: deleteBlogFunction,
                            icon: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 20,
                              child: CircleAvatar(
                                backgroundColor: normalTextColor,
                                radius: 16,
                                child: CircleAvatar(
                                  radius: 14,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.clear_rounded,
                                    color: normalTextColor,
                                  ),
                                ),
                              ),
                            ),
                            padding:
                                EdgeInsets.only(top: 0, left: 0, bottom: 0),
                          ),
                        ),
                      )
                    // Positioned(
                    //         right: 0,
                    //         child: Container(
                    //           // color: Colors.red[100],
                    //           height: 44,
                    //           width: 44,
                    //           child: MaterialButton(
                    //             splashColor: Colors.white38,
                    //             onPressed: () {
                    //               debugPrint('test');
                    //             },
                    //             textColor: Colors.white,
                    //             child: CircleAvatar(
                    //               backgroundColor: Colors.white,
                    //               radius: 20,
                    //               child: CircleAvatar(
                    //                 backgroundColor: normalTextColor,
                    //                 radius: 16,
                    //                 child: CircleAvatar(
                    //                   radius: 14,
                    //                   backgroundColor: Colors.white,
                    //                   child: Icon(
                    //                     Icons.clear_rounded,
                    //                     color: normalTextColor,
                    //                   ),
                    //                 ),
                    //               ),
                    //             ),
                    //             padding:
                    //                 EdgeInsets.only(top: 0, left: 0, bottom: 0),
                    //             shape: CircleBorder(),
                    //           ),
                    //         ),
                    //       )
                    : SizedBox()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
