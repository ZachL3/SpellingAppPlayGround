//
//  ViewController.swift
//  Speeling App PlayGround
//
//  Created by Zaaaaaach on 16/12/5.
//  Copyright © 2016年 ZachTheMan. All rights reserved.
//

import UIKit

struct words {
    
    var splits : [String]
    
}



class ViewController: UIViewController {
    
    
    
    var label = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.height / 2 - 100, UIScreen.mainScreen().bounds.width / 2 - 50, 200, 200))
    var label2 = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.height / 2 + 200, UIScreen.mainScreen().bounds.width / 2 - 50, 200, 200))
    var label3 = UILabel(frame: CGRectMake(100, 100, 250, 50))
    var word = [words]()
    var wordNumber = Int()
    
    



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        /* let button = UIButton(type: .System)
        let image = UIImage(named: "blueBlock@2x.jpg") as UIImage? */
        
        /* button.frame = CGRectMake(self.view.bounds.width / 2 - 100, self.view.bounds.height / 2 - 100, 100, 100)
        button.setImage(image, forState: .Normal)
        button.addTarget(self, action: "btnTouched", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button) */
        
        /*let button = UIButton(type: .System)
        button.frame = CGRectMake(100, 100, 100, 50)
        button.backgroundColor = UIColor.greenColor()
        button.setTitle("Button", forState:  UIControlState.Normal)
        button.addTarget(self, action: "Action:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)*/
        
        
        //let label = UILabel(frame: CGRectMake(self.view.bounds.height / 2 - 100, self.view.bounds.width / 2 - 50 , 100, 50))
        //let label2 = UILabel(frame: CGRectMake(self.view.bounds.height / 2 + 200, self.view.bounds.width / 2 - 50 , 100, 50))
        word = [words(splits: ["Str", "ing"]),
            words(splits: ["Ja","ck"]),
            words(splits: ["M","an"])]
        
        
        
        
        
        

        
        
        
        /*label.text = ""/Users/TT2000/Pictures/labelBackground.png
        label.textAlignment = NSTextAlignment.Cent
        label.backgroundColor = UIColor.greenColor()
        self.view.addSubview(label)
        
        label2.text = "ing"
        label2.textAlignment = NSTextAlignment.Center
        label2.backgroundColor = UIColor.greenColor()
        self.view.addSubview(label2)
        
        label3.text = label.text! + label2.text!
        label3.textAlignment = NSTextAlignment.Center
        label3.backgroundColor = UIColor.greenColor()
        self.view.addSubview(label3)
        label3.font = UIFont(name: "chalkduster", size: 25.0)
        label3.alpha = 0.0 */
        


        
        var imageView: UIImageView
        var imageView2: UIImageView
        
        
        imageView = UIImageView(frame: CGRectMake(100, 100, 100, 50))
        imageView.backgroundColor = UIColor.brownColor()
        self.view.addSubview(imageView)
        
        self.view.sendSubviewToBack(imageView)
        
        
        imageView2 = UIImageView(frame: CGRectMake(250, 100, 100, 50))
        imageView2.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(imageView2)
        
        self.view.sendSubviewToBack(imageView2)
        
        pickQuestion()
        
        
        
        
    }
    
    func pickQuestion() {
        let random = Int(arc4random_uniform(2))
        
        if word.count > 0{
            
            wordNumber = 0
            
            label = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.height / 2 - 100, UIScreen.mainScreen().bounds.width / 2 - 50, 100, 50))
            label.text = word[wordNumber].splits[random]
            label.textAlignment = NSTextAlignment.Center
            label.backgroundColor = UIColor.greenColor()//(patternImage: UIImage(named: "labelBackground.png")!)
            self.view.addSubview(label)
            
            label2 = UILabel(frame: CGRectMake(UIScreen.mainScreen().bounds.height / 2 + 200, UIScreen.mainScreen().bounds.width / 2 - 50, 100, 50))
            label2.text = word[wordNumber].splits[1 - random]
            label2.textAlignment = NSTextAlignment.Center
            label2.backgroundColor = UIColor.greenColor()//(patternImage: UIImage(named: "labelBackground.png")!)
            self.view.addSubview(label2)
            
            
            let gesture = UIPanGestureRecognizer(target: self, action: Selector("wasDragged:"))
            label.addGestureRecognizer(gesture)
            label.userInteractionEnabled = true
            
            let gesture2 = UIPanGestureRecognizer(target: self, action: Selector("wasDragged1:"))
            label2.addGestureRecognizer(gesture2)
            label2.userInteractionEnabled = true

            
            label3.text = label.text! + label2.text!
            label3.textAlignment = NSTextAlignment.Center
            label3.backgroundColor = UIColor.greenColor()
            self.view.addSubview(label3)
            label3.font = UIFont(name: "chalkduster", size: 25.0)
            label3.alpha = 0.0

            
            word.removeAtIndex(wordNumber)
            
            
            
            
        }
        
        
    }
    
    func wasDragged(gesture: UIPanGestureRecognizer) {
         let translation = gesture.translationInView(self.view)
        
        if let lab = gesture.view {
        
        lab.center = CGPoint(x: lab.center.x + translation.x, y: lab.center.y + translation.y)
            
        gesture.setTranslation(CGPointZero, inView: self.view)
            
        if gesture.state == UIGestureRecognizerState.Ended {
            
            
                
                if lab.center.y < 200 && lab.center.y >= 50 && lab.center.x < 150 && lab.center.x >= 50 {
                    
                    lab.center = CGPoint(x: 150, y: 125)
                    
                    if label.center == CGPoint(x: 150, y: 125) && label2.center == CGPoint(x: 300, y: 125) {
                        
                       UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                        self.label.alpha = 0.0
                        self.label2.alpha = 0.0
                        self.label3.alpha = 1.0
                        }, completion: nil)
                        
                        let triggerTime = (Int64(NSEC_PER_SEC) * 5)
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, triggerTime), dispatch_get_main_queue(), { () -> Void in
                            self.pickQuestion()
                        })
                        
                        
                        
                        
                        
                        
                    }

                    
                } else {
                    
                    lab.center = CGPoint(x: self.view.bounds.height / 2 - 50, y: self.view.bounds.width / 2 - 25)
                    
                }
                
                
            }

            
            

            
        }
        
        
        
        
        
        
        
    }
    
    func wasDragged1(gesture:UIPanGestureRecognizer) {
        
        let translation = gesture.translationInView(self.view)
        if let lab = gesture.view {
            
            lab.center = CGPoint(x: lab.center.x + translation.x, y: lab.center.y + translation.y)
            gesture.setTranslation(CGPointZero, inView: self.view)
            
            
            if gesture.state == UIGestureRecognizerState.Ended {
                
                
                
                if lab.center.x <= 350 && lab.center.x >= 150 && lab.center.y < 200 && lab.center.y >= 50 {
                    
                    lab.center = CGPoint(x: 300, y: 125)
                    
                    if label.center == CGPoint(x: 150, y: 125) && label2.center == CGPoint(x: 300, y: 125) {
                        
                        
                        
                        UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                            self.label.alpha = 0.0
                            self.label2.alpha = 0.0
                            self.label3.alpha = 1.0
                            }, completion: nil)
                        
                        
                        let triggerTime = (Int64(NSEC_PER_SEC) * 5)
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, triggerTime), dispatch_get_main_queue(), { () -> Void in
                            self.pickQuestion()
                        })

                    }

                    
                } else {
                    
                    lab.center = CGPoint(x: self.view.bounds.height / 2 + 250, y: self.view.bounds.width / 2 - 25)
                    
                    
                }
                
                
            }
            

            
            
            
        }
        

        
        
    }
    /*
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in (touches as! Set<UITouch>) {
            
            let location = touch.locationInView(self.view)
            
            if label.frame.contains(location) {
                
                label.center = location
                
                
            } else if label2.frame.contains(location) {
                label2.center = location
            
            
            
            }
            
            
            
        }
    } */


    /*
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch in (touches as! Set<UITouch>) {
            
            let location = touch.locationInView(self.view)
            
            if label.frame.contains(location) {
                
                label.center = location
                
                
            } else if label2.frame.contains(location) {
                label2.center = location
                
                
                
            }
            

            
            
        }

        
    }*/
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}

