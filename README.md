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

## Considerations
The first impressions I had on the package was really good, but I saw some things I don't personally like:

- It encourages duplication of code, especially while passing callbacks and parameters to both view models and widgets. It is difficult to make dynamic extensions and standardization of behaviours, it's simpler to copy-paste or rewrite them.

- The usages seen on its repository examples (followed to make this project) also seem to suggest to have a single store for the entire application, and consequently a single global state, using viewmodels as 'screen states' that translate the global state gathering only the information they need. This is good for separating concerns but may take too long to write and determine all conditions to display some widgets or not. It is also wrong for performance, since every time state changes the entire screen is rebuilt.

- VMs are supposed to contain both arguments and callbacks: I'd prefer to separate logic from models connecting widgets through observing state changes.

What I like is the standardized way of doing all sort of things, including navigation and actions that don't include state changes, and also that actions can operate indipendently from each other but be triggered from another action.

In a nutshell:
I like this package for standardizing the developer workflow and practices in a good separation between logic layers.
I don't like it for its excessive verbosity and chunkiness.