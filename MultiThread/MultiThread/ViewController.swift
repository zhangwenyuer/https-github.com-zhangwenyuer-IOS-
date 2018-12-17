//
//  ViewController.swift
//  MultiThread
//
//  Created by student on 2018/12/12.
//  Copyright © 2018年 zhangwenyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var testLabel: UILabel!
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (Timer) in
            self.count += 1
            self.timerLabel.text = "\(self.count)"
        }.fire()
    }

    @IBAction func caculate(_ sender: Any) {
        var sum = 0
        for _ in 1...100{
            DispatchQueue.global().async {
                print("Run thread:\(Thread.current)")
                
                for i in 1...1000{
                    usleep(10000)
                    sum += i
                }
                DispatchQueue.main.async {
                    self.testLabel.text = "sum\(sum)"
                }
            }
        }
    }
}

