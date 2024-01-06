class Author{
  String name;
  String imageUrl;

  Author({
    required this.name,
    required this.imageUrl
  });
}

final Author mark = Author(
    name: 'Mark Lewis',
    imageUrl: 'assets/profile_pic.jpg'
);

final Author john = Author(
    name: 'John Sabestiam',
    imageUrl: 'assets/profile_pic.jpg'
);

final Author mike = Author(
    name: 'Mike Ruther',
    imageUrl: 'assets/profile_pic.jpg'
);

final Author adam = Author(
    name: 'Adam Zampal',
    imageUrl: 'assets/profile_pic.jpg'
);
final Author justin = Author(
    name: 'Justin Neither',
    imageUrl: 'assets/profile_pic.jpg'
);
final Author sam = Author(
    name: 'Samuel Tarly',
    imageUrl: 'assets/profile_pic.jpg'
);
final Author luther = Author(
    name: 'Luther',
    imageUrl: 'assets/profile_pic.jpg'
);

final List<Author> authors = [
  luther,
  sam,
  justin,
  adam,
  mike,
  john,
  mark
];