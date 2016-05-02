//
//  Table.swift
//  Library
//
//  Created by Ruihan Zhao on 4/28/16.
//  Copyright © 2016 Ruihan Zhao. All rights reserved.
//

import UIKit

class Table: UIView {
    var tableImage:UIImageView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.tableImage = UIImageView(frame: CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height))
        tableImage.image = UIImage(named: "table.jpg")
        self.addSubview(tableImage)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
