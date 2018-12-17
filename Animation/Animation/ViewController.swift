//
//  ViewController.swift
//  Animation
//
//  Created by student on 2018/11/21.
//  Copyright © 2018年 zwy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var MyView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnClicked(_ sender: Any) {
        UIView.animate(withDuration: 2, delay: 1,  options: [.curveEaseInOut , .autoreverse ], animations: {
            self.MyView.alpha = 0
            self.MyView.center.x = self.view.bounds.width
            self.MyView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi)).scaledBy(x: 0.2, y: 0.2)
        }){ (finished) in
            if finished{
                self.MyView.removeFromSuperview()
            }
        }
    }
}
