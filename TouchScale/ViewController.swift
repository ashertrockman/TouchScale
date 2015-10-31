//
//  ViewController.swift
//  TouchScale
//
//  Created by Asher Trockman on 10/31/15.
//  Copyright © 2015 Asher Trockman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weight: UILabel!
    var currentForce: CGFloat! = 0
    var tareForce: CGFloat! = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.multipleTouchEnabled = true
        weight.text = "0.00g"
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first as UITouch?
        
        currentForce = touch!.force
        weight.text = "\(currentForce.grams(tareForce))g"
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first as UITouch?
        
        currentForce = touch!.force
        weight.text = "\(currentForce.grams(tareForce))g"
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        currentForce = 0
        weight.text = "\(tareForce > 0 ? "-" : "")\(tareForce.grams(0))g"
    }
    
    @IBAction func onTare(sender: AnyObject) {
        tareForce = currentForce
        weight.text = "0.00g"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CGFloat {
    func grams(tare: CGFloat) -> String {
        return String(format: "%.2f", (self - tare) / CGFloat(0.020833))
    }
}

