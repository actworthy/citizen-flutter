import 'package:flutter/foundation.dart';

/// Inspiring post to encourage users to take the [Action] the [Post]
/// is associated with.
///
/// See also [Action].
class Post {
  /// Inspiring image
  final String image;

  /// Short description about the image and why users might take
  /// the [Action] the post about
  final String description;

  Post({
    @required this.image,
    this.description,
  });
}
