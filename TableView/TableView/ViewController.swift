//
//  ViewController.swift
//  TableView
//
//  Created by student on 2018/11/22.
//  Copyright © 2018年 zwy. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var stuTableView: UITableView!
    @IBOutlet weak var nameTextFied: UITextField!
    
    @IBOutlet weak var chooseLable: UILabel!
    var stuArray = [String]()
    var desArray = [String]()
    
    let t1 = Teacher(firstName:"y",lastName:"d",age : 29,gender: Gender.female,title:"Chinese")
    let t2 = Teacher(firstName:"wu",lastName:"yi",age : 30,gender: Gender.female,title:"Music")
    let s1 = Student(firstName:"li",lastName:"jj",age : 23,gender: Gender.female,stuNo:"110")
    let s2 = Student(firstName:"y",lastName:"ds",age : 22,gender: Gender.female,stuNo:"111")
    
    var person = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        person+=[t1,t2,s1,s2]
        for i in person{
            stuArray.append(i.kind)
            desArray.append(i.description)
        }
        
    }

    @IBAction func addClicked(_ sender: Any) {
        if let name = nameTextFied.text{
            stuArray.append("Student")
            desArray.append(name)
            stuTableView.reloadData()
        }
        nameTextFied.resignFirstResponder()
    }
    @IBAction func editClicked(_ sender: Any) {
        if let  row = stuTableView.indexPathForSelectedRow?.row{
            if let name = nameTextFied.text{
                desArray[row] = name
                stuTableView.reloadData()
//                name.components(separatedBy: " ")
//                let student =
            }
        }
        
    }
    @IBAction func deleteClicked(_ sender: Any) {
        stuTableView.isEditing = !stuTableView.isEditing
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell") as! StudentTableViewCell
        let stu = stuArray[indexPath.row]
        let des = desArray[indexPath.row]
        cell.Description.text = des
        cell.Description.sizeToFit()
        cell.Name.text = stu
        cell.Name.sizeToFit()
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        chooseLable.text = "choose: \(desArray[indexPath.row])"
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
             stuArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let source = stuArray.remove(at: sourceIndexPath.row)
        stuArray.insert(source, at: destinationIndexPath.row)
    }
}

