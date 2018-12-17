//
//  ViewController.swift
//  AlertController
//
//  Created by student on 2018/11/7.
//  Copyright © 2018年 zhangwenyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func actionSheet(_ sender: Any) {
        let alert = UIAlertController(title: "action sheet", message: "choose backgroundcolor", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "red", style: .default, handler: {
            (action) in
            self.view.backgroundColor = UIColor.red
        }))
        alert.addAction(UIAlertAction(title: "green", style: .default, handler: {
            (action) in
            self.view.backgroundColor = UIColor.green
        }))
        alert.addAction(UIAlertAction(title: "blue", style: .destructive, handler: {
            (action) in
            self.view.backgroundColor = UIColor.blue
        }))
        alert.addAction(UIAlertAction(title: "white", style: .cancel, handler: {
            (action) in
            self.view.backgroundColor = UIColor.white
        }))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func alert(_ sender: Any) {
        let alert = UIAlertController(title: "alert", message: "login message", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Login", style: .default, handler: { (action) in
            guard let username = alert.textFields?.first?.text, let password = alert.textFields?.last?.text else {
                return 
            }
            
            print("username=\(username) password=\(password)")
        }))
        alert.addAction(UIAlertAction(title: "Cancle", style: .default, handler: { (action) in
            
        }))
        alert.addTextField{ (textFiled) in
            textFiled.placeholder = "username"
        }
        alert.addTextField{ (textFiled) in
            textFiled.placeholder = "password"
            textFiled.isSecureTextEntry = true
        }
        present(alert, animated: true, completion: nil)
    }
}

