//
//  FriendSearchController.swift
//  iosDecalProj4
//
//  Created by David Kong on 5/1/16.
//  Copyright © 2016 David Kong. All rights reserved.
//

import UIKit

extension FriendSearchController: UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}

class FriendSearchController: UITableViewController {
    var friendActions : UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
    let searchController = UISearchController(searchResultsController: nil)
    var filtered_friends = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Friends"
        self.view.backgroundColor = UIColor.whiteColor()
        let send = UIAlertAction(title: "Send Location", style: .Default, handler: actionSend)
        if me.library_name == nil || me.floor == nil || me.coord == nil {
            send.enabled = false
        }
        friendActions.addAction(send)
        friendActions.addAction(UIAlertAction(title: "Cancel", style: .Default, handler: nil))
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.active && searchController.searchBar.text != "" {
            return filtered_friends.count
        }
        return friends.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FriendCell", forIndexPath: indexPath)
        let friend : User
        if searchController.active && searchController.searchBar.text != "" {
            friend = filtered_friends[indexPath.row]
        }
        else {
            friend = friends[indexPath.row]
        }
        cell.textLabel!.text = friend.person
        cell.imageView!.image = friend.pro_pic
        cell.imageView?.clipsToBounds = true
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.cellForRowAtIndexPath(indexPath)?.selected = false
        self.presentViewController(friendActions, animated: true, completion: nil)
    }
    
    func actionSend(action: UIAlertAction!) -> Void {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filtered_friends = friends.filter { friend in
            return friend.person.lowercaseString.containsString(searchText.lowercaseString)
        }
        
        tableView.reloadData()
    }
}
