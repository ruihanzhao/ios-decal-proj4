//
//  LibraryImageViewController.swift
//  Library
//
//  Created by Ruihan Zhao on 4/26/16.
//  Copyright © 2016 Ruihan Zhao. All rights reserved.
//

import UIKit

class LibraryImageViewController: UIViewController {
    var scroll:UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
        scroll = UIScrollView(frame : view.bounds)
        //scroll.addSubview(view)
        view.addSubview(scroll)
        //var chair1 = UIView(frame:CGRectMake(50, 50, 200, 200))
        //chair1.backgroundColor = UIColor.blueColor()
        //self.view.addSubview(chair1)

        addChairs()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func drawRect(rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(ctx, 4.0)
        CGContextSetStrokeColorWithColor(ctx, UIColor.blueColor().CGColor)
        
        
        
    }
    
    func addChairs() {
        var chair1 = UIView(frame:CGRectMake(0, 0, 200, 200))
        chair1.backgroundColor = UIColor.blueColor()
        scroll.addSubview(chair1)
        
   
        
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
