//
//  LocationButton.swift
//  iosDecalProj4
//
//  Created by David Kong on 5/1/16.
//  Copyright © 2016 David Kong. All rights reserved.
//

import UIKit

/* Contains the information needed identify and mark user on map. */
class User {
    /* Associated library name */
    var library_name : String?
    
    /* Floor in library. Should be the index in the library's array of floors. */
    var floor : Int?
    
    /* Coordinates. These are relative to the image. */
    var coord : CGPoint?
    
    var isMe : Bool = false
    
    /* Personal info */
    var person : String!
    var pro_pic : UIImage!
    
    init(name : String, pic : UIImage, user : Bool) {
        person = name
        pro_pic = pic
        isMe = user
    }
    
    init(name : String, pic : UIImage, coord : CGPoint, lib : String, floor : Int, user : Bool) {
        person = name
        pro_pic = pic
        self.coord = coord
        library_name = lib
        self.floor = floor
        isMe = user
    }
    
    func setLocation(lib : String, floor : Int, co : CGPoint) {
        library_name = lib
        self.floor = floor
        coord = co
    }
}
