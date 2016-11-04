//
//  MainViewController.swift
//  TrainingProjectSwift
//
//  Created by Kashif on 03/11/16.
//  Copyright © 2016 Kashif. All rights reserved.
//

import UIKit

class MainViewController: UIViewController , UITextFieldDelegate{
    
    var originalCenter:CGPoint?
    
    @IBOutlet weak var imageViewOutlet: UIImageView!
    @IBOutlet weak var buttonOutlet: UIButton!
    @IBOutlet weak var switchOutlet: UISwitch!
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBOutlet weak var textFieldOutlet: UITextField!
    @IBOutlet weak var segmentedControlOutlet: UISegmentedControl!
    @IBOutlet weak var viewOutlet: UIView!
    @IBOutlet weak var progressViewOutlet: UIProgressView!
    @IBOutlet weak var activityIndicatorOutlet: UIActivityIndicatorView!
    @IBOutlet weak var sliderLabelOutlet: UILabel!
    @IBOutlet weak var labelOutlet: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.labelOutlet.layer.cornerRadius=10
        self.labelOutlet.layer.shadowOffset=CGSize(width: 1.0, height: 1.0)
        self.labelOutlet.layer.shadowOpacity=1
        self.labelOutlet.layer.shadowRadius=6
        
        var n = (arc4random() % 8)+1
        
        switch (n) {
        case 1:
            self.labelOutlet.isHidden=false
        case 2:
            self.buttonOutlet.isHidden=false
        case 3:
            self.imageViewOutlet.isHidden=false
        case 4:
            self.viewOutlet.isHidden=false
        case 5:
            self.segmentedControlOutlet.isHidden=false
        case 6:
            self.textFieldOutlet.isHidden=false
        case 7:
            self.sliderOutlet.isHidden=false
        case 8:
            self.switchOutlet.isHidden=false
            
        default:
            break;
        }

        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        let alertView = UIAlertController(title: "Return Pressed", message: textField.text, preferredStyle: UIAlertControllerStyle.alert)
        let alertActionCancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        let alertActionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alertView.addAction(alertActionCancel)
        alertView.addAction(alertActionOK)
        show(alertView, sender: self)
        
        return true
    }
    @IBAction func sliderAction(_ sender: UISlider) {
        sliderLabelOutlet.text=String(format: "%.1f", sender.value)
        progressViewOutlet.progress=sender.value/10
        activityIndicatorOutlet.startAnimating()
    }
    
    @IBAction func sliderStopAction(_ sender: UISlider) {
        activityIndicatorOutlet.stopAnimating()
    }
    @IBAction func segmentedControlerAction(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        let alertView = UIAlertController(title: "Segmented Control", message: "Index \(index) tapped", preferredStyle: UIAlertControllerStyle.alert)
        let alertActionCancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        let alertActionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alertView.addAction(alertActionCancel)
        alertView.addAction(alertActionOK)
        show(alertView, sender: self)
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        var status : String
        if sender.isOn {
            status = "On"
        }else{
            status = "Off"
        }
        let alertView = UIAlertController(title: status, message: "Switch is " + status, preferredStyle: UIAlertControllerStyle.alert)
        let alertActionCancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        let alertActionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alertView.addAction(alertActionCancel)
        alertView.addAction(alertActionOK)
        show(alertView, sender: self)
    }
    @IBAction func pinchGestureView(_ sender: UIPinchGestureRecognizer) {
        let transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
        sender.view?.transform = transform
        
    }
    
    @IBAction func tapGestureTwoFingerImageview(_ sender: UITapGestureRecognizer) {
        let fingers = sender.numberOfTouches
        print("Number of Touches \(fingers)")
        let alertView = UIAlertController(title: "Imageview Tapped", message: "Tapped with \(fingers) Fingers", preferredStyle: UIAlertControllerStyle.alert)
        let alertActionCancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        let alertActionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alertView.addAction(alertActionCancel)
        alertView.addAction(alertActionOK)
        show(alertView, sender: self)
    }
    @IBAction func tapGestureImageView(_ sender: UITapGestureRecognizer) {
        let fingers = sender.numberOfTouches
        print("Number of Touches \(fingers)")
        let alertView = UIAlertController(title: "Imageview Tapped", message: "Tapped with \(fingers) Fingers", preferredStyle: UIAlertControllerStyle.alert)
        let alertActionCancel = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        let alertActionOK = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alertView.addAction(alertActionCancel)
        alertView.addAction(alertActionOK)
        show(alertView, sender: self)
    }
    @IBAction func longPressGesture(sender: UILongPressGestureRecognizer) {
        if sender.state == .began {
            let alertViewController=UIAlertController(title:"Button Long Pressed!", message:"You can put away your fingers now.", preferredStyle:UIAlertControllerStyle.alert)
            let alertAction=UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
            alertViewController.addAction(alertAction)
            
            show(alertViewController, sender: self)
        }
    }

    
    @IBAction func dragLabelGesture(_ sender: UIPanGestureRecognizer) {
        
        let label = sender.view!
        if sender.state == .began {
            originalCenter = (label.center)
        }
        let newPoint = sender.translation(in: label)
        label.center = CGPoint(x:label.center.x+newPoint.x, y:label.center.y+newPoint.y)
        
        if sender.state == .ended {
            label.center=originalCenter!
        }
        
        sender.setTranslation(CGPoint.zero, in: label)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
