//
//  Chair.swift
//  Library
//
//  Created by Ruihan Zhao on 4/26/16.
//  Copyright © 2016 Ruihan Zhao. All rights reserved.
//

import UIKit

class Chair : UIView {
    
    var Person:String!
    var isTaken:Bool = false
    var chairImage:UIImageView!
//    self.backgroundColor = UIColor.blueColor()
    
    init(frame: CGRect, person: String, isTaken: Bool) {
        super.init(frame: frame)
        self.Person = person
        self.isTaken = isTaken
        self.chairImage = UIImageView(frame: CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height))
        if (isTaken) {
            chairImage.image = UIImage(named: "ladySitting.jpg")
        } else {
            chairImage.image = UIImage(named: "lessWeirdChair.jpg")
        }
        self.addSubview(chairImage)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
