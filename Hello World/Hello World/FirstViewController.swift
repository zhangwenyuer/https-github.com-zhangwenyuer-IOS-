//
//  FirstViewController.swift
//  Hello World
//
//  Created by student on 2018/10/17.
//  Copyright © 2018年 CJL. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow
        let lable = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
        lable.text = "Hello World"
        lable.textAlignment = .center
        lable.backgroundColor = UIColor.brown
        lable.center = self.view.center
        self.view.addSubview(lable)
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        button.setTitle("Click Me", for: .normal)
        button.setTitle("I am  happy ", for: .highlighted)
        button.setTitleColor(UIColor.green, for: .normal)
        view.addSubview(button)
        button.addTarget(self, action: #selector(btuClicked), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    @objc func btuClicked(){
//        if let lable = view.subviews.first as? UILabel{
//            lable.text = "I am clicked"
//        }
//        print("I am clicked")
        present(SecondViewController(),animated: true,completion: nil)
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
