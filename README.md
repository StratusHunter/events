# events
Searches for events using the Fatsoma Events API https://api.fatsoma.com/v1/events

### Branch Management:
Used GitFlow branching pattern and rebased my feature branches before merging into develop.
I have left my feature branches on the remote in their non rebased state.

### Process Breakdown:
1. Researched the API. Used postman to experiment and build the request I needed. Found I could reduce the amount of data returned in the model to optimize bandwidth. I've not read about the JSON:API standard before so took a little getting used too.
2. Setup the project with some resource type safety classes. These attempt to replicate the Android R file to make some compiler safe resources.
3. Began coding a basic API request to proove I could get the data from the API matching up to the postman version.
4. Used a UICollectionView and created a basic pagination flow with some simple cells. Decided to use 2 sections. One for the loading state if needed and the other for the actual list of events.
5. Tidied up the cell UI.

### Expansion
1. Repository pattern on the default contructor variables. Didn't really make sense to write this for a smaller sample.
2. Resizable cells.
3. iPad/MacOS layout.
