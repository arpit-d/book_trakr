import 'package:flutter/material.dart';

import '../../../core/styles/styles.dart';
import '../../../core/utils/utils.dart';
import '../../edit_book/model/book_model.dart';

class BookOverviewCard extends StatelessWidget {
  const BookOverviewCard({
    Key? key,
    required this.books,
  }) : super(key: key);

  final BookModel books;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      shadowColor: Colors.white,
      elevation: 12,
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
              child: const Icon(
                bookIcon,
                size: 52,
                color: AppColors.primaryColor,
              ),
            ),
            gapW12,
            Expanded(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        books.title,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      gapH4,
                      Text(
                        books.authors,
                        style: const TextStyle(
                            fontSize: 16,
                            color: AppColors.slightlyDarkGreyColor),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      horizontalThreeDots,
                      size: 28,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
