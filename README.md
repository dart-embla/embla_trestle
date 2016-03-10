# [Trestle](https://github.com/dart-bridge/trestle) bootstrapper for [Embla](https://github.com/dart-embla/embla)

## Usage
```dart
import 'package:embla/http.dart';
import 'package:embla_trestle/embla_trestle.dart';

export 'package:embla/bootstrap.dart';

get embla => [
  new DatabaseBootstrapper(
    // You can choose between multiple drivers. Check out the Trestle readme.
    driver: new MySqlDriver(database: 'my_database')
  ),

  new HttpBootstrapper(pipeline: pipe(
    handler((Repository<Post> posts) {
      return posts.where((post) => post.id > 10);
    })
  ))
];

class Post extends Model {
  @field String title;
  @field String body;
}
```
