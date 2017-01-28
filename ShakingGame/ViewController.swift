//
//  ViewController.swift
//  ShakingGame
//
//  Created by yasamin  on 14.11.2016.
//  Copyright © 2016 yasamin. All rights reserved.
//

import UIKit
//in this game only when the modeint = 1 we can shake our device

class ViewController: UIViewController {
    
    var timer = NSTimer()
    //the time
    var countInt = 0
    //how many times we shake our device
    var scoreInt = 0
    
    //gamemode so if the gamemode equals 1 then you can shake the device
    var modeInt = 0
    
    @IBOutlet weak var TimerLabel: UILabel!

    @IBOutlet weak var ScoreLabel: UILabel!
    
    //because we want to enable and disable the button so we create an outlet of it also
    
    @IBOutlet weak var StartButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countInt = 10
        scoreInt = 0
        
        TimerLabel.text = String(countInt)
        ScoreLabel.text = String(scoreInt)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func Start(sender: AnyObject) {
        
        if scoreInt == 0 {
            countInt = 10
            TimerLabel.text = String(countInt)
            
            modeInt = 1
            //here it means the selector will call the startcounter action every second
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("StartCounter"), userInfo: nil, repeats: true)
           StartButton.enabled = false
            
        }
        if countInt == 0 {
            scoreInt = 0
            countInt = 10
        }
    }
    
    func StartCounter(){
        
        countInt -= 1
        TimerLabel.text = String(countInt)
        
        if countInt == 0 {
            timer.invalidate()
            
            StartButton.enabled = true
            
            modeInt = 2
        }
        
    }
    
    //means the device has the ability to detect motions
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    //when the motion has ended its going to trigger an action
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            
            if modeInt == 1 {
                scoreInt += 1
                ScoreLabel.text = String(scoreInt)
            }
            
        }
    }

}

