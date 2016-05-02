//
//  FirstViewController.swift
//  iosDecalProj4
//
//  Created by David Kong on 4/26/16.
//  Copyright © 2016 David Kong. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LibraryMapViewController: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate, UIPopoverPresentationControllerDelegate {
    var mapScrollView : UIScrollView!
    var planImageView : UIImageView!
    var library : Library!
    var cur_floor : UIButton = UIButton.init(frame: CGRect(x: 0, y: UIScreen.mainScreen().bounds.height - CGFloat(2 * tabBarHeight), width: UIScreen.mainScreen().bounds.width, height: CGFloat(tabBarHeight)))
    var floors : UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
    var cur_index : Int = 0
    var users = [(User, UIButton)]()
    var reference_center : CGPoint!
    var notification : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting navigation bar
        self.navigationItem.setRightBarButtonItem(UIBarButtonItem.init(barButtonSystemItem: .Search, target: self, action: "friendSearch"), animated: true)
        view.backgroundColor = UIColor.whiteColor()
        // Initializing ScrollView
        mapScrollView = UIScrollView()
        self.view.addSubview(mapScrollView)
        mapScrollView.frame = CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: UIScreen.mainScreen().bounds.height-CGFloat(2 * tabBarHeight))
        mapScrollView.canCancelContentTouches = true
        mapScrollView.backgroundColor = UIColor.clearColor()
        mapScrollView.delegate = self
        mapScrollView.scrollsToTop = false
        mapScrollView.bounces = true
        mapScrollView.indicatorStyle = UIScrollViewIndicatorStyle.White;
        mapScrollView.maximumZoomScale=2.0
        mapScrollView.minimumZoomScale=0.5
        // Initializing the ImageView
        planImageView = UIImageView()
        planImageView.userInteractionEnabled = true
        mapScrollView.addSubview(planImageView)
        planImageView.contentMode = UIViewContentMode.Center
        set_image()
        cur_floor.addTarget(self, action: "floor_change", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(cur_floor)
        self.navigationItem.title = "\(library.name)"
        cur_floor.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        cur_floor.backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.2)
        for index in 1...library.num_floors {
            self.floors.addAction(UIAlertAction(title: "Floor \(index)", style: .Default, handler: select_floor))
        }
        // Double tap to add ME to map
        let double = UITapGestureRecognizer.init(target: self, action: "doubleTap:")
        double.numberOfTapsRequired = 2
        double.numberOfTouchesRequired = 1
        mapScrollView.addGestureRecognizer(double)
        reference_center = mapScrollView.center
        // Make the locator for ME
        if me.library_name != nil && me.floor != nil && me.coord != nil {
            addLocationButton(me)
        }
        if notification != nil {
            addLocationButton(notification!)
            notification = nil
        }
    }
    
    func doubleTap(recognizer:UITapGestureRecognizer) {
        if let view = recognizer.view {
            var point = recognizer.locationInView(view)
            point = view.convertPoint(point, toView: planImageView)
            me.floor = cur_index
            me.library_name = library.name
            me.coord = point
            addLocationButton(me)
        }
    }
    
    func set_image() {
        planImageView.image = library.plans[cur_index]
        planImageView.frame = CGRect(x: 0, y: 0, width: (planImageView.image?.size.width)!, height: (planImageView.image?.size.height)!)
        cur_floor.setTitle("Floor \(cur_index + 1)", forState: UIControlState.Normal)
        for index in 0..<self.users.count {
            if self.users[index].0.floor != cur_index {
                self.users[index].1.hidden = true
            }
            else {
                self.users[index].1.hidden = false
            }
        }
        mapScrollView.contentSize = (planImageView.image?.size)!
    }
    
    func select_floor(action: UIAlertAction!) -> Void {
        let index = floors.actions.indexOf(action)
        if index == self.cur_index {
            return
        }
        self.cur_index = index!
        set_image()
    }
    
    func floor_change() {
        self.presentViewController(floors, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.planImageView
    }
    
    func addLocationButton(id : User) {
        for index in 0..<self.users.count {
            if self.users[index].0 === id {
                if let _ = self.users[index].1.superview {
                    self.users[index].1.removeFromSuperview()
                }
                self.users.removeAtIndex(index)
            }
        }
        let loc : UIButton = UIButton()
        loc.addTarget(self, action: "showPopover:", forControlEvents: .TouchDown)
        if id.isMe {
            loc.setImage(UIImage.init(named: "current"), forState: UIControlState.Normal)
            let pangesture = UIPanGestureRecognizer.init(target: self, action: "dragDrop:")
            loc.addGestureRecognizer(pangesture)
        }
        else {
            loc.setImage(UIImage.init(named: "redpin"), forState: UIControlState.Normal)
        }
        planImageView.addSubview(loc)
        loc.frame = CGRect(x: 0, y: 0, width: loc.imageView!.image!.size.width, height: loc.imageView!.image!.size.height)
        loc.center = id.coord!
        self.users.append((id, loc))
        self.planImageView.addSubview(loc)
    }
    
    func dragDrop(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translationInView(self.planImageView)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPointZero, inView: self.view)
    }
    
    func showPopover(sender: UIButton) {
        let vc = profileVC()
        vc.preferredContentSize = CGSizeMake(200, 50)
        var profile : User!
        for u in users {
            if u.1 === sender {
                profile = u.0
                break
            }
        }
        vc.pic = profile.pro_pic
        vc.name = profile.person
        vc.delegate = self
        vc.sender = sender
        vc.modalPresentationStyle = .Popover
        let popoverPresentationController = vc.popoverPresentationController
        popoverPresentationController?.delegate = self
        popoverPresentationController?.sourceView = sender
        popoverPresentationController?.permittedArrowDirections = .Down
        presentViewController(vc, animated: true, completion: nil)
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
    
    func delButton(button : UIButton) {
        for index in 0..<self.users.count {
            if self.users[index].1 === button {
                if let _ = self.users[index].1.superview {
                    self.users[index].1.removeFromSuperview()
                    if self.users[index].0.isMe {
                        me.library_name = nil
                        me.floor = nil
                        me.coord = nil
                    }
                }
                self.users.removeAtIndex(index)
            }
        }
    }
    
    func friendSearch() {
        performSegueWithIdentifier("searchSegue", sender: self)
    }
}

