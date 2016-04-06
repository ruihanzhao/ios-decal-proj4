# ios-decal-proj4

## Authors
  - Ruihan Zhao
  - David Kong

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
  - The main view is a tab view with tabs for map, notifications,
  and requests.
  - Friends' locations will be marked on the map after clicking on
  notifications.
  - Location requests can be responded to/ignored individually or collectively
  in the requests tab.
  - Sharing location from the map will pull up a list of Facebook friends with
  the app to share to.

## Implementation
### Model
  - UserItem.Swift
  - LibraryMap.gif
  - LibraryTable.gif ///May need multiple table images
  - LibrarySeat.gif

### View
  - LibraryImageView embedded in UIScrollView
  - LibraryTableListView ///If we map more than one library
  - NotificationsTableView
  - RequestsTableView
  - Chair.Swift // records ID of seat
  - Table.Swift (possibly if we want to record IDs of tables)

### Controller
  - LibraryImageViewController
  - LibraryTableListViewController
  - NotificationsTableViewController
  - RequestsTableViewController
  - StartScreenViewController: For initial linking to Facebook
