//
//  SecondViewController.swift
//  iosDecalProj4
//
//  Created by David Kong on 4/26/16.
//  Copyright © 2016 David Kong. All rights reserved.
//

import UIKit

class NotificationViewController: UITableViewController {
    var notifications = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.view.frame = CGRect(x: 0, y: 20, width: self.view.frame.width, height: self.view.frame.height)
        notifications.append(User.init(name: "Ruihan Zhao", pic: UIImage.init(named: "Ruihan-Profile")!, coord: CGPoint.init(x: 200, y: 300), lib: "Doe", floor: 2, user: false))
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NotificationCell", forIndexPath: indexPath)
        cell.textLabel?.text = notifications[indexPath.row].person
        cell.imageView?.image = notifications[indexPath.row].pro_pic
        cell.imageView?.clipsToBounds = true
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let data = notifications[indexPath.row]
        let libNavController : UINavigationController = self.tabBarController?.viewControllers![0] as! UINavigationController
        let libController : LibraryTableViewController = libNavController.viewControllers[0] as! LibraryTableViewController
        libController.notification = data
        libController.performSegueWithIdentifier("notifSegue", sender: libController)
        self.tabBarController!.selectedIndex = 0;
    }
}

