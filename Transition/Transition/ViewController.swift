//
//  ViewController.swift
//  Transition
//
//  Created by student on 2018/11/21.
//  Copyright © 2018年 zwy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backview: UIView!
    @IBOutlet weak var myview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnCilcked(_ sender: Any) {
        
        let imageView = UIImageView(frame: CGRect(x: 80, y: 20, width: 100, height: 100))
        imageView.image = UIImage(named: "1")
        
        UIView.transition(from: myview, to: imageView, duration: 2, options: .transitionFlipFromRight, completion: nil)
        
        UIView.transition(with: backview, duration: 2, options: .transitionFlipFromRight, animations: {
            self.backview.backgroundColor = UIColor.red
        }, completion: nil)
    }
    
}

