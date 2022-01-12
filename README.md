# flutter_github_client_async_redux
Minimal Github client using Flutter and async_redux package.

This is a sample project to experiment with the [async_redux](https://pub.dev/packages/async_redux) architectural package.
The requirements for the app are:
- User should be able to search for GitHub repositories by name (ref. https://docs.github.com/en/rest );
- The result are shown in a scrolling list, sorted by alphabet;
- The search should be triggered only after the user types the 4th letter;
- The user is supposed to refresh the result by pulling the list;
- The list should use pagination;
- When user clicks one resulting repo, she/he should be redirected to another page which shows all opened issues of the repository.

Hope this project can be useful to someone! :metal:
