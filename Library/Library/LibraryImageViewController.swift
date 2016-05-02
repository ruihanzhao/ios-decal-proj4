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
    var chairDict:[UIButton : Chair] = [UIButton : Chair]()
    var chairArr:[Chair] = [Chair]()
    override func viewDidLoad() {
        super.viewDidLoad()
        scroll = UIScrollView(frame : view.bounds)
        //scroll.addSubview(view)
        view.addSubview(scroll)
        self.view.backgroundColor = UIColor.whiteColor()

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
    func buttonAction(sender : UIButton) {
        print(sender)
        let clickedChair = chairDict[sender]
        clickedChair!.isTaken = !clickedChair!.isTaken
        if ((clickedChair?.isTaken) == false) {
            clickedChair!.chairImage.image = UIImage(named: "lessWeirdChair.jpg")
        } else {
            clickedChair!.chairImage.image = UIImage(named: "ladySitting.jpg")
        }
        
        print("hi")
    }
    
    func addChairs() {
        let width = UIScreen.mainScreen().bounds.size.width
        let height = UIScreen.mainScreen().bounds.size.height


        let chair1 = Chair(frame:CGRectMake(0, 0, width/6, height/8), person: "", isTaken: false)
        let button   = UIButton(type: UIButtonType.System) as UIButton
        button.frame = CGRectMake(0, 0, width/6, height/8)
        chairDict[button] = chair1
        button.addTarget(self, action: #selector(LibraryImageViewController.buttonAction), forControlEvents: UIControlEvents.TouchUpInside)
        scroll.addSubview(chair1)
        scroll.addSubview(button)
        
        

        let chair2 = Chair(frame:CGRectMake(width/3, 0, width/6, height/8), person: "", isTaken: false)
        let button2   = UIButton(type: UIButtonType.System) as UIButton
        button2.frame = CGRectMake(width/3, 0, width/6, height/8)
        chairDict[button2] = chair2
        button2.addTarget(self, action: #selector(LibraryImageViewController.buttonAction), forControlEvents: UIControlEvents.TouchUpInside)
        scroll.addSubview(chair2)
        scroll.addSubview(button2)

        let table1 = Table(frame:CGRectMake(width/6, 0, width/6, height/4))
        scroll.addSubview(table1)


        let chair3 = Chair(frame:CGRectMake(0, height/8, width/6, height/8), person: "", isTaken: false)
        let button3   = UIButton(type: UIButtonType.System) as UIButton
        button3.frame = CGRectMake(0, height/8, width/6, height/8)
        chairDict[button3] = chair3
        button3.addTarget(self, action: #selector(LibraryImageViewController.buttonAction), forControlEvents: UIControlEvents.TouchUpInside)
        scroll.addSubview(chair3)
        scroll.addSubview(button3)
        
        let chair4 = Chair(frame:CGRectMake(width/3, height/8, width/6, height/8), person: "", isTaken: false)
        let button4   = UIButton(type: UIButtonType.System) as UIButton
        button4.frame = CGRectMake(width/3, height/8, width/6, height/8)
        chairDict[button4] = chair4
        button4.addTarget(self, action: #selector(LibraryImageViewController.buttonAction), forControlEvents: UIControlEvents.TouchUpInside)
        scroll.addSubview(chair4)
        scroll.addSubview(button4)

        let chair5 = Chair(frame:CGRectMake(width/2, 0, width/6, height/8), person: "", isTaken: false)
        let button5   = UIButton(type: UIButtonType.System) as UIButton
        button5.frame = CGRectMake(width/2, 0, width/6, height/8)
        chairDict[button5] = chair5
        button5.addTarget(self, action: #selector(LibraryImageViewController.buttonAction), forControlEvents: UIControlEvents.TouchUpInside)
        scroll.addSubview(chair5)
        scroll.addSubview(button5)

        let chair6 = Chair(frame:CGRectMake(width/2, height/8, width/6, height/8), person: "", isTaken: false)
        let button6   = UIButton(type: UIButtonType.System) as UIButton
        button6.frame = CGRectMake(width/2, height/8, width/6, height/8)
        chairDict[button6] = chair6
        button6.addTarget(self, action: #selector(LibraryImageViewController.buttonAction), forControlEvents: UIControlEvents.TouchUpInside)
        scroll.addSubview(chair6)
        scroll.addSubview(button6)
        
        let chair7 = Chair(frame:CGRectMake(5*width/6, 0, width/6, height/8), person: "", isTaken: false)
        let button7   = UIButton(type: UIButtonType.System) as UIButton
        button7.frame = CGRectMake(5*width/6, 0, width/6, height/8)
        chairDict[button7] = chair7
        button7.addTarget(self, action: #selector(LibraryImageViewController.buttonAction), forControlEvents: UIControlEvents.TouchUpInside)
        scroll.addSubview(chair7)
        scroll.addSubview(button7)
        
        let chair8 = Chair(frame:CGRectMake(5*width/6, height/8, width/6, height/8), person: "", isTaken: false)
        let button8   = UIButton(type: UIButtonType.System) as UIButton
        button8.frame = CGRectMake(5*width/6, height/8, width/6, height/8)
        chairDict[button8] = chair8
        button8.addTarget(self, action: #selector(LibraryImageViewController.buttonAction), forControlEvents: UIControlEvents.TouchUpInside)
        scroll.addSubview(chair8)
        scroll.addSubview(button8)
        
        let table2 = Table(frame:CGRectMake(2*width/3, 0, width/6, height/4))
        scroll.addSubview(table2)
        let book = UILabel(frame:CGRectMake(0, height/4, width, height/16))
        book.text = "bookshelf"
        book.textAlignment = NSTextAlignment.Center
        book.textColor = UIColor.whiteColor()
        book.backgroundColor = UIColor.brownColor()
        scroll.addSubview(book)
        let book2 = UILabel(frame:CGRectMake(0, 5*height/16, width, height/16))
        book2.text = "bookshelf"
        book2.textAlignment = NSTextAlignment.Center
        book2.textColor = UIColor.whiteColor()
        book2.backgroundColor = UIColor.brownColor()
        scroll.addSubview(book2)

        let chair9 = Chair(frame:CGRectMake(width/2, 3*height/8, width/6, height/8), person: "", isTaken: false)
        let button9   = UIButton(type: UIButtonType.System) as UIButton
        button9.frame = CGRectMake(width/2, 3*height/8, width/6, height/8)
        chairDict[button9] = chair9
        button9.addTarget(self, action: #selector(LibraryImageViewController.buttonAction), forControlEvents: UIControlEvents.TouchUpInside)
        scroll.addSubview(chair9)
        scroll.addSubview(button9)
        let chair10 = Chair(frame:CGRectMake(width/2, height/2, width/6, height/8), person: "", isTaken: false)
        let button10   = UIButton(type: UIButtonType.System) as UIButton
        button10.frame = CGRectMake(width/2, height/2, width/6, height/8)
        chairDict[button10] = chair10
        button10.addTarget(self, action: #selector(LibraryImageViewController.buttonAction), forControlEvents: UIControlEvents.TouchUpInside)
        scroll.addSubview(chair10)
        scroll.addSubview(button10)

        let chair11 = Chair(frame:CGRectMake(5*width/6, 3*height/8, width/6, height/8), person: "", isTaken: false)
        let button11   = UIButton(type: UIButtonType.System) as UIButton
        button11.frame = CGRectMake(5*width/6, 3*height/8, width/6, height/8)
        chairDict[button11] = chair11
        button11.addTarget(self, action: #selector(LibraryImageViewController.buttonAction), forControlEvents: UIControlEvents.TouchUpInside)
        scroll.addSubview(chair11)
        scroll.addSubview(button11)
        
        let chair12 = Chair(frame:CGRectMake(5*width/6, height/2, width/6, height/8), person: "", isTaken: false)
        let button12   = UIButton(type: UIButtonType.System) as UIButton
        button12.frame = CGRectMake(5*width/6, height/2, width/6, height/8)
        chairDict[button12] = chair12
        button12.addTarget(self, action: #selector(LibraryImageViewController.buttonAction), forControlEvents: UIControlEvents.TouchUpInside)
        scroll.addSubview(chair12)
        scroll.addSubview(button12)
        
        let table3 = Table(frame:CGRectMake(2*width/3, 3*height/8, width/6, height/4))
        scroll.addSubview(table3)
        
        let chair13 = Chair(frame:CGRectMake(0, 3*height/8, width/6, height/8), person: "", isTaken: false)
        let button13   = UIButton(type: UIButtonType.System) as UIButton
        button13.frame = CGRectMake(0, 3*height/8, width/6, height/8)
        chairDict[button13] = chair13
        button13.addTarget(self, action: #selector(LibraryImageViewController.buttonAction), forControlEvents: UIControlEvents.TouchUpInside)
        scroll.addSubview(chair13)
        scroll.addSubview(button13)
        
        let chair14 = Chair(frame:CGRectMake(0, height/2, width/6, height/8), person: "", isTaken: false)
        let button14   = UIButton(type: UIButtonType.System) as UIButton
        button14.frame = CGRectMake(0, height/2, width/6, height/8)
        chairDict[button14] = chair14
        button14.addTarget(self, action: #selector(LibraryImageViewController.buttonAction), forControlEvents: UIControlEvents.TouchUpInside)
        scroll.addSubview(chair14)
        scroll.addSubview(button14)

        
        let table4 = Table(frame:CGRectMake(width/6, 3*height/8, width/6, height/4))
        scroll.addSubview(table4)
        let chair15 = Chair(frame:CGRectMake(width/3, 3*height/8, width/6, height/8), person: "", isTaken: false)
        let button15   = UIButton(type: UIButtonType.System) as UIButton
        button15.frame = CGRectMake(width/3, 3*height/8, width/6, height/8)
        chairDict[button15] = chair15
        button15.addTarget(self, action: #selector(LibraryImageViewController.buttonAction), forControlEvents: UIControlEvents.TouchUpInside)
        scroll.addSubview(chair15)
        scroll.addSubview(button15)
        
        let chair16 = Chair(frame:CGRectMake(width/3, height/2, width/6, height/8), person: "", isTaken: false)
        let button16   = UIButton(type: UIButtonType.System) as UIButton
        button16.frame = CGRectMake(width/3, height/2, width/6, height/8)
        chairDict[button16] = chair16
        button16.addTarget(self, action: #selector(LibraryImageViewController.buttonAction), forControlEvents: UIControlEvents.TouchUpInside)
        scroll.addSubview(chair16)
        scroll.addSubview(button16)
        
        let chair17 = Chair(frame:CGRectMake(0, 5*height/8, width/6, height/8), person: "", isTaken: false)
        let button17   = UIButton(type: UIButtonType.System) as UIButton
        button17.frame = CGRectMake(0, 5*height/8, width/6, height/8)
        chairDict[button17] = chair17
        button17.addTarget(self, action: #selector(LibraryImageViewController.buttonAction), forControlEvents: UIControlEvents.TouchUpInside)
        scroll.addSubview(chair17)
        scroll.addSubview(button17)
        
        let chair18 = Chair(frame:CGRectMake(0, 3*height/4, width/6, height/8), person: "", isTaken: false)
        let button18   = UIButton(type: UIButtonType.System) as UIButton
        button18.frame = CGRectMake(0, 3*height/4, width/6, height/8)
        chairDict[button18] = chair18
        button18.addTarget(self, action: #selector(LibraryImageViewController.buttonAction), forControlEvents: UIControlEvents.TouchUpInside)
        scroll.addSubview(chair18)
        scroll.addSubview(button18)
        
        let table5 = Table(frame:CGRectMake(width/6, 5*height/8, width/6, height/4))
        scroll.addSubview(table5)
        let chair19 = Chair(frame:CGRectMake(width/3, 3*height/4, width/6, height/8), person: "", isTaken: false)
        let button19   = UIButton(type: UIButtonType.System) as UIButton
        button19.frame = CGRectMake(width/3, 3*height/4, width/6, height/8)
        chairDict[button19] = chair19
        button19.addTarget(self, action: #selector(LibraryImageViewController.buttonAction), forControlEvents: UIControlEvents.TouchUpInside)
        scroll.addSubview(chair19)
        scroll.addSubview(button19)
        
        let chair20 = Chair(frame:CGRectMake(width/3, 5*height/8, width/6, height/8), person: "", isTaken: false)
        let button20   = UIButton(type: UIButtonType.System) as UIButton
        button20.frame = CGRectMake(width/3, 5*height/8, width/6, height/8)
        chairDict[button20] = chair20
        button20.addTarget(self, action: #selector(LibraryImageViewController.buttonAction), forControlEvents: UIControlEvents.TouchUpInside)
        scroll.addSubview(chair20)
        scroll.addSubview(button20)

        
        let chair21 = Chair(frame:CGRectMake(width/2, 5*height/8, width/6, height/8), person: "", isTaken: false)
        let button21   = UIButton(type: UIButtonType.System) as UIButton
        button21.frame = CGRectMake(width/2, 5*height/8, width/6, height/8)
        chairDict[button21] = chair21
        button21.addTarget(self, action: #selector(LibraryImageViewController.buttonAction), forControlEvents: UIControlEvents.TouchUpInside)
        scroll.addSubview(chair21)
        scroll.addSubview(button21)
        
        let chair22 = Chair(frame:CGRectMake(width/2, 3*height/4, width/6, height/8), person: "", isTaken: false)
        let button22   = UIButton(type: UIButtonType.System) as UIButton
        button22.frame = CGRectMake(width/2, 3*height/4, width/6, height/8)
        chairDict[button22] = chair22
        button22.addTarget(self, action: #selector(LibraryImageViewController.buttonAction), forControlEvents: UIControlEvents.TouchUpInside)
        scroll.addSubview(chair22)
        scroll.addSubview(button22)
        
        let table6 = Table(frame:CGRectMake(2*width/3, 5*height/8, width/6, height/4))
        scroll.addSubview(table6)
        let chair23 = Chair(frame:CGRectMake(5*width/6, 3*height/4, width/6, height/8), person: "", isTaken: false)
        let button23   = UIButton(type: UIButtonType.System) as UIButton
        button23.frame = CGRectMake(5*width/6, 3*height/4, width/6, height/8)
        chairDict[button23] = chair23
        button23.addTarget(self, action: #selector(LibraryImageViewController.buttonAction), forControlEvents: UIControlEvents.TouchUpInside)
        scroll.addSubview(chair23)
        scroll.addSubview(button23)
        
        let chair24 = Chair(frame:CGRectMake(5*width/6, 5*height/8, width/6, height/8), person: "", isTaken: false)
        let button24   = UIButton(type: UIButtonType.System) as UIButton
        button24.frame = CGRectMake(5*width/6, 5*height/8, width/6, height/8)
        chairDict[button24] = chair24
        button24.addTarget(self, action: #selector(LibraryImageViewController.buttonAction), forControlEvents: UIControlEvents.TouchUpInside)
        scroll.addSubview(chair24)
        scroll.addSubview(button24)

        
        
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
