//
//  SecondViewController.swift
//  Sqlite
//
//  Created by student on 2018/12/13.
//  Copyright © 2018年 zhangwenyu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var name = ""
    var phone = ""
    
    @IBOutlet weak var Lname: UILabel!
    @IBOutlet weak var Lphone: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        Lname.text = name
        Lphone.text = phone
    }
    

    @IBAction func Back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
