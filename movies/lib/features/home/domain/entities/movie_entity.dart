class MovieEntity {
  final String name;

  /// Asset path of the poster image.
  final String image;
  final double rating;

  const MovieEntity({
    required this.name,
    required this.image,
    required this.rating,
  });
}
