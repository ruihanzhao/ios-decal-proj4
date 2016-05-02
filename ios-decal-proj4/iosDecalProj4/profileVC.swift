//
//  profileVC.swift
//  iosDecalProj4
//
//  Created by David Kong on 5/1/16.
//  Copyright © 2016 David Kong. All rights reserved.
//

import UIKit

class profileVC: UIViewController {
    var name : String!
    var pic : UIImage!
    var delegate : LibraryMapViewController!
    var sender : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        let imageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        imageView.image = pic
        imageView.contentMode = .ScaleAspectFill
        imageView.layer.cornerRadius = 25
        imageView.clipsToBounds = true
        let label = UILabel.init(frame: CGRect.init(x: 50, y: 0, width: 150, height: 25))
        label.text = name
        label.textAlignment = .Center
        let clearButton = UIButton.init(frame: CGRect.init(x: 75, y: 27, width: 100, height: 20))
        clearButton.layer.cornerRadius = 10
        clearButton.clipsToBounds = true
        clearButton.setTitle("Clear Pin", forState: .Normal)
        clearButton.backgroundColor = UIColor.redColor()
        clearButton.addTarget(self, action: "dismiss", forControlEvents: .TouchDown)
        self.view.addSubview(clearButton)
        self.view.addSubview(label)
        self.view.addSubview(imageView)
    }
    
    func dismiss() {
        self.delegate.delButton(sender)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
