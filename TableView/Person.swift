//
//  People.swift
//  TableView
//
//  Created by student on 2018/11/22.
//  Copyright © 2018年 zwy. All rights reserved.
//

import Foundation
enum Gender:Int{
    case female
    case male
}

class Person: CustomStringConvertible{
    var firstName:String
    var lastName:String
    var age:Int
    var gender:Gender
    var fullName:String{
        get{
            return firstName+lastName
        }
    }
    init(firstName:String, lastName:String, age:Int, gender:Gender){
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    convenience init(name:String){
        self.init(firstName:name,lastName:"",age:20,gender:Gender.female)
    }
    var description:String{
        return "Name:\(fullName) Age:\(age) Gender:\(gender)"
    }
    var kind:String{
        return "Person"
    }
}


class Teacher:Person{
    var title:String
    init(firstName:String, lastName:String, age:Int, gender:Gender, title:String){
        self.title = title
        super.init(firstName:firstName, lastName:lastName, age:age, gender:gender)
    }
    convenience init(name:String){
        self.init(firstName:name,lastName:"",age:20,gender:Gender.female, title:"Chinese")
    }
    override var description:String{
        return "name:\(fullName) age:\(age) gerder:\(gender)title:\(title)"
    }
    override var kind: String{
        return "Student"
    }
}
class Student:Person{
    var stuNo:String
    init(firstName:String, lastName:String, age:Int, gender:Gender, stuNo:String){
        self.stuNo = stuNo
        super.init(firstName:firstName, lastName:lastName, age:age, gender:gender)
    }
    convenience init(name:String){
        self.init(firstName:name,lastName:"",age:20,gender:Gender.female,stuNo:"110")
    }
    override var description:String{
        return "name:\(fullName) age:\(age) gender:\(gender) no:\(stuNo) "
    }
    override var kind: String{
        return "Teacher"
    }
}
