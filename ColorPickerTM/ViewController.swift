//
//  ViewController.swift
//  ColorPickerTM
//
//  Created by Nidhin Nishanth on 11/14/23.
//

// this is the first Xcode project we've made that incorporates modifying UI elements with Swift Code. We'll link the items we throw onto our screen in the Main.storyboard file to this ViewController.swift file using @IBOutlets (variables) and @IBActions (functions)

/* We've connected the UI elements in our storyboard to our code
 - @IBOutlets are variables, this allows us to give our UI elements a name so we can access them through code
 - @IBActions are functions, these allow us to do things with our UI elements (i.e. tapping the button can reset the app, or playing with the sliders or switches should update our color)
 */

import UIKit

// this ViewController class is connected to the "View Controller" screen in our Main file, which allows us to modify that screen with the code we write in here.

class ViewController: UIViewController {

    // this outlet is for our UIView at the top
    @IBOutlet var colorView: UIView!
    
    // these outlets are for our switches
    @IBOutlet var redSwitch: UISwitch!
    @IBOutlet var greenSwitch: UISwitch!
    @IBOutlet var blueSwitch: UISwitch!
    
    // and these outlets are for our sliders
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    // this function controls what happens when the app first loads. For our project, we'll update the color and controls (so that everything is off), and we'll add a border to our color view at the top
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateColor()
        updateControls()
        
        colorView.layer.borderWidth = 5
        colorView.layer.borderColor = UIColor.black.cgColor
        colorView.layer.cornerRadius = 20
    }
    
    // this action is tied to our UISwitches. When we do anything with these switches (and all we can do is turn them on or off 😴), we'll update our colors and controls
    @IBAction func switchChanged(_ sender: UISwitch) {
        updateColor()
        updateControls()
    }
    
    // if we change the sliders, we'll update our colors
    @IBAction func sliderChanged(_ sender: UISlider) {
        updateColor()
    }
    
    // in the reset function, we'll turn off our switches and set our sliders to 1 (our default value), then we'll update our colors and controls
    @IBAction func reset(_ sender: UIButton) {
        redSwitch.isOn = false
        greenSwitch.isOn = false
        blueSwitch.isOn = false
        
        redSlider.value = 1
        greenSlider.value = 1
        blueSlider.value = 1
        
        updateColor()
        updateControls()
    }
    
    // if a switch is turned off, the corresponding slider should be disabled
    func updateControls() {
        redSlider.isEnabled = redSwitch.isOn
        greenSlider.isEnabled = greenSwitch.isOn
        blueSlider.isEnabled = blueSwitch.isOn
    }
    
    // we'll create our own color with this function and add it to our colorView!
    func updateColor() {
        
        // I'm creating these as CGFloats: these are specific kinds of numbers that are used for displaying graphics. This is also the datatype we need to create a color (on line 98).
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        
        // if the corresponding switch is on, we'll grab the value of our slider and use it to create a color
        if redSwitch.isOn {
            red = CGFloat(redSlider.value)
        }
        if greenSwitch.isOn {
            green = CGFloat(greenSlider.value)
        }
        if blueSwitch.isOn {
            blue = CGFloat(blueSlider.value)
        }
        
        // we'll create a brand new color using the variables we created above (lines 82-84), and we'll add it to our colorView
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        colorView.backgroundColor = color
    }
}

