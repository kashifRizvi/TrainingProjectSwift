//
//  ViewController.swift
//  TrainingProjectSwift
//
//  Created by Kashif on 02/11/16.
//  Copyright © 2016 Kashif. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.buttonOutlet.layer.cornerRadius=10
        self.buttonOutlet.layer.shadowRadius=4
        self.buttonOutlet.layer.shadowOpacity=1
        self.buttonOutlet.layer.shadowOffset=CGSize(width: 0.0, height: 0.0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

