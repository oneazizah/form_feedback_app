class FeedbackItem {
  final String name;
  final String gender; // "L" atau "P"
  final double rating;
  final List<String> hobbies;
  final String comment;

  FeedbackItem({
    required this.name,
    required this.gender,
    required this.rating,
    required this.hobbies,
    required this.comment,
  });
}
