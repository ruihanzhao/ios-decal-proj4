//
//  LibraryTableViewController.swift
//  iosDecalProj4
//
//  Created by David Kong on 4/30/16.
//  Copyright © 2016 David Kong. All rights reserved.
//

import UIKit

var tabBarHeight : Int!
var libraries : [Library] = [Library]()
let me = User.init(name: "David Kong", pic: UIImage.init(named: "David-Profile")!, user: true)
let friends = [User.init(name: "Ruihan Zhao", pic: UIImage.init(named: "Ruihan-Profile")!, user: false)]

class LibraryTableViewController: UITableViewController {
    var notification : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadLibraries([("Doe", 4)])
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.title = "All Libraries"
        tabBarHeight = Int(CGRectGetHeight(self.tabBarController!.tabBar.frame))
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
        return libraries.count
    }
    
    func loadLibraries(libs : [(String, Int)]) {
        for lib in libs {
            libraries.append(Library.init(identifier: lib.0, num: lib.1))
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LibraryCell", forIndexPath: indexPath)
        cell.textLabel?.text = String(format: "\(libraries[indexPath.row].name) Library")
        cell.imageView?.image = libraries[indexPath.row].picture
        cell.imageView?.clipsToBounds = true
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destViewController = segue.destinationViewController as! LibraryMapViewController
        if segue.identifier == "defMapSegue" {
            let senderCell = sender as! UITableViewCell
            let index = tableView!.indexPathForCell(senderCell)!.item
            destViewController.library = libraries[index]
        }
        else if segue.identifier == "notifSegue" {
            destViewController.cur_index = (notification?.floor)!
            destViewController.notification = self.notification
            destViewController.library = libraries[0]
            notification = nil
        }
    }

}
