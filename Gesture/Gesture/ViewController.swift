//
//  ViewController.swift
//  Gesture
//
//  Created by student on 2018/11/10.
//  Copyright © 2018年 zhangwenyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func addLable(_ sender: Any) {
        let x = Int(arc4random()) % Int(view.bounds.width)
        let y = Int(arc4random()) % Int(view.bounds.height)
        
        let lable = UILabel(frame: CGRect(x: x, y: y, width: 30, height: 30))
        lable.text = "X"
        lable.textAlignment = .center
        lable.backgroundColor = UIColor.yellow
        
        lable.layer.shadowColor = UIColor.gray.cgColor
        lable.shadowOffset = CGSize(width: 5, height: 5)
        lable.layer.shadowOpacity = 1
        
        view.addSubview(lable)
        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer:)))
        lable.addGestureRecognizer(panRecognizer)
        lable.isUserInteractionEnabled = true
    }
    @objc func pan(recognizer: UIPanGestureRecognizer){
        switch recognizer.state {
        case .changed:
            fallthrough
        case .ended:
            let translation = recognizer.translation(in: self.view)
            recognizer.view?.center.x += translation.x
            recognizer.view?.center.y += translation.y
            recognizer.setTranslation(.zero, in: self.view)
        default:
            break
        }
    }
    @IBAction func moveLable(_ sender: Any) {
        for lable in view.subviews{
            if lable is UILabel{
                UIView.animate(withDuration: 1){
                    let x = Int(arc4random()) % Int(self.view.bounds.width)
                    let y = Int(arc4random()) % Int(self.view.bounds.height)
                    lable.center.x = CGFloat(x)
                    lable.center.y = CGFloat(y)
                }
            }
        }
    }
    @IBAction func deleteLable(_ sender: Any) {
        for lable in view.subviews{
            if lable is UILabel{
               
                lable.removeFromSuperview()
            }
        }
    }
}

