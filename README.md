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

- It encourages duplication of code, especially while passing callbacks and parameters to both view models and widgets.

- The usages seen on its repository examples (followed to make this project) also seem to suggest to have a single store for the entire application, and consequently a single global state, using viewmodels as 'screen states' that translate the global state gathering the only information it needs. I might be wrong, but I think in real-world complex projects this can lead to poor state handling. For example I don't think that the global ```AppState``` should contain loading flags and models that live or die with the screen they are displayed on.

- VMs are supposed to contain both arguments and callbacks: I think those things should be separated in a page model (only arguments, which I did putting it into the VM and passing it to the widget) and a presentation logic object, connected to the core logic and observing state changes.

I really like is the standardized way of doing all sort of things, including navigation and actions that don't include state changes, and also that actions can operate indipendently from each other but be triggered from another action.

Overall I like this package for standardizing the developer workflow in a simple and manageable way, separating things almost the way I would do.
Personally I still prefer a more transparent solution such as BLoC.