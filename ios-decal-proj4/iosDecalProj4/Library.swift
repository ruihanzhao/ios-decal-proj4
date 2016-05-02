//
//  Library.swift
//  iosDecalProj4
//
//  Created by David Kong on 4/30/16.
//  Copyright © 2016 David Kong. All rights reserved.
//

import Foundation
import UIKit

class Library {
    /* The name of the library that will be displayed. */
    var name : String!
    
    /* Picture of the library */
    var picture : UIImage!
    
    /* Floor plans for the library */
    var plans : [UIImage] = [UIImage]()
    
    /* Number of floors */
    var num_floors : Int!
    
    init (identifier : String, num: Int) {
        name = identifier
        picture = UIImage(named: identifier)
        self.num_floors = num
        for index in 1...num {
            let floor = "\(identifier)\(index)"
            let img : UIImage = UIImage(named: floor)!
            plans.append(img)
        }
    }
}