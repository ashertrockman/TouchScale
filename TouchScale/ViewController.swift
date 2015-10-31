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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        weight.text = "0.0g"
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first as UITouch?
        
        weight.text = "\(touch!.force.grams())g"
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first as UITouch?
        
        weight.text = "\(touch!.force.grams())g"
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        weight.text = "0.0g"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CGFloat {
    func grams() -> String {
        print(self)
        print(self / CGFloat(0.020833))
        return String(format: "%.2f", self / CGFloat(0.020833))
    }
}

