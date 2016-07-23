//
//  ViewController.swift
//  RBG Sliders
//
//  Created by Laura Ware on 7/17/16.
//  Copyright © 2016 Laura Ware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var colorSquare: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        redSlider.value = defaults.floatForKey("red")
        greenSlider.value = defaults.floatForKey("green")
        blueSlider.value = defaults.floatForKey("blue")

        updateBackgroundColor(UISlider)
        colorSquare.layer.borderColor = UIColor.blackColor().CGColor
        colorSquare.layer.borderWidth = 1

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func updateBackgroundColor(sender: AnyObject) {
        let redValue: CGFloat = CGFloat(redSlider.value)
        let greenValue: CGFloat = CGFloat(greenSlider.value)
        let blueValue: CGFloat = CGFloat(blueSlider.value)
        
        colorSquare.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
        //view.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setFloat(redSlider.value, forKey: "red")
        defaults.setFloat(greenSlider.value, forKey: "green")
        defaults.setFloat(blueSlider.value, forKey: "blue")
        defaults.synchronize()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        if (segue.identifier == "openColor"){
            let newViewController = segue.destinationViewController
            //newViewController.view.backgroundColor = colorSquare.backgroundColor
            let newSquare: UIView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
            newViewController.view.addSubview(newSquare)
            newSquare.backgroundColor = colorSquare.backgroundColor
            
        }
    }
    
    // This is a comment to test git.

}

