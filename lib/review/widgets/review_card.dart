import 'package:flutter/material.dart';
import 'package:gamehunt/review/models/review.dart';

class ReviewCard extends StatelessWidget {
  final Review review;
  final bool isAdmin;
  final String currentUsername;
  final Function(int reviewId) onDeleteReview;
  final Function(int reviewId, String voteType) onVote;

  const ReviewCard({
    super.key,
    required this.review,
    required this.isAdmin,
    required this.currentUsername,
    required this.onDeleteReview,
    required this.onVote,
  });

  @override
  Widget build(BuildContext context) {
    const Color lightGray = Color(0xFFD1D1D1);
    const Color white = Colors.white;
    const Color primaryRed = Color(0xFFFF5252);
    const Color darkBlue = Color(0xFF1C1E26);

    final canDelete = isAdmin || (review.username == currentUsername);
    final canVote = review.username != currentUsername; // Users can't vote on their own reviews

    return Card(
      color: darkBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: primaryRed, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Username and Delete Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  review.username,
                  style: const TextStyle(
                    color: white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (canDelete) // Only show delete button if canDelete is true
                  IconButton(
                    icon: const Icon(Icons.delete, color: primaryRed),
                    onPressed: () => onDeleteReview(review.id),
                  ),
              ],
            ),

            const SizedBox(height: 8),

            // Title
            Text(
              review.title,
              style: const TextStyle(color: white, fontSize: 16),
            ),
            const SizedBox(height: 8),

            // Score + Content
            Text(
              "Score: ${review.score}\n${review.content}",
              style: const TextStyle(color: lightGray, fontSize: 14),
            ),
            const SizedBox(height: 8),

            // Date and Voting Buttons
            Row(
              children: [
                Text(
                  review.date,
                  style: const TextStyle(color: lightGray, fontSize: 12),
                ),
                const Spacer(),
                if (canVote) ...[
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_upward,
                          color: review.userUpvoted ? Colors.green : lightGray,
                        ),
                        onPressed: () => onVote(review.id, 'upvote'),
                      ),
                      Text(
                        '${review.voteScore}',
                        style: const TextStyle(
                          color: white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.arrow_downward,
                          color: review.userDownvoted ? Colors.red : lightGray,
                        ),
                        onPressed: () => onVote(review.id, 'downvote'),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}