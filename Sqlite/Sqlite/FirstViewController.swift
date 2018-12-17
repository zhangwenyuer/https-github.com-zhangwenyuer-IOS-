//
//  ViewController.swift
//  Sqlite
//
//  Created by student on 2018/12/12.
//  Copyright © 2018年 zhangwenyu. All rights reserved.
//

import UIKit
import SQLite3

class FirstViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    let db = SQLiteDB.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = db.open(dbPath: "", copyFile: true)
        
        let r = db.execute(sql: "create table if not exists person(name varchar(20),phone varchar(20))")
        print("result:\(r)")
        print(NSHomeDirectory())
        print(Bundle.main.bundlePath)
    }


    @IBAction func Add(_ sender: Any) {
        let r = db.execute(sql: "insert into person(name,phone) values('\(tfName.text!)','\(tfPhone.text!)')")
        print("result:\(r)")
    }
    @IBAction func Update(_ sender: Any) {
        let r = db.execute(sql:"update person set phone = '\(tfPhone.text!)' where name = '\(tfName.text!)'")
        print("result:\(r)")
    }
    @IBAction func del(_ sender: Any) {
        let r = db.execute(sql: "delete from person where name = '\(tfName.text!)'")
        print("result:\(r)")
    }
    @IBAction func query(_ sender: Any) {
        let persons = db.query(sql: "select * from person where name = '\(tfName.text!)'")
        if let person = persons.first,let phone = person["phone"] as? String {
            tfPhone.text = phone
        }
        let secVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondVC") as! SecondViewController
        secVC.name = tfName.text!
        secVC.phone = tfPhone.text!
        self.navigationController?.pushViewController(secVC, animated: true)

    }
}

