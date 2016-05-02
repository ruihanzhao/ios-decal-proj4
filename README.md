# ios-decal-proj4

## Authors
  - Ruihan Zhao
  - David Kong

## Credits
  - FacebookSDK for importing users' accounts and friend networks

## Purpose
  Library Friend Finder is an app that helps Berkeley students find their 
  friends in the library.
  
## Features
  - Interactive virtual map of library seats users can use to define their
  locations.
  - Share and request locations to friends.
  - Users can import their Facebook networks.

## Control Flow
  - After linking one's Facebook account, the splash screen will become 
  irrelevant for the user.
  - The application si a tab application with tabs for map, notifications,
  and requests.
  - Friends' locations will be marked on the map after clicking on
  notifications.
  - Clicking on pins will show a popover to identify friends/user
  - Sharing location from the map will pull up a list of Facebook friends with
  the app to share to.

## Implementation
### Model
  - Library.Swift
  - User.Swift

### View
  - LibraryImageView embedded in UIScrollView
  - LibraryTableListView
  - NotificationsTableView
  - SearchFriendsView (table view of users friends with search bar)
  - profileVC (popover views for pins)
  - UIButtons for each pin to mark locations of people

### Controller
  - LibraryMapViewController (UIScrollViewController)
  - LibraryTableListViewController
  - NotificationsTableViewController
  - FriendSearchController (Controller for searching)
  - FacebookViewController (initial login & account link)

## Shortcomings
### Unimplemented Features
  - Backend to actually send data between users
  - Facebook login has been implemented but is not used (no 
  backend: all users in demo are hardcoded)
  - No requests feature

### Known Bugs
  - User's location marker can move while popover is up
  - Pins are resized by the UIScrollView zoom
  - View stacks between the Notifications tab and Library(map) is
  not right
