//
//  ViewController.swift
//  MyPrefs
//
//  Created by Bernard Slater on 10/23/19.
//  Copyright © 2019 Bernard Slater. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtFullName: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var datepicker: UIDatePicker!
    
   
    @IBOutlet weak var occupation: UITextField!
    
    
    
    @IBAction func btnSave(_ sender: Any) {
        let defaults: UserDefaults = UserDefaults.standard
            defaults.set(self.txtFullName.text, forKey: "fullname")
        
           defaults.set(self.txtFullName.text, forKey: "fullname")
            defaults.set(self.txtEmail.text, forKey: "email")
              let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, yyyy" //Your New Date format as per requirement change it own
            let newDate = dateFormatter.string(from:datepicker.date) //pass Date here
            defaults.set(newDate, forKey: "bdate")
            print(datepicker.date.description)
            defaults.synchronize()
            clear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let defaults: UserDefaults = UserDefaults.standard
              if defaults.string(forKey: "fullname") != nil{
                    txtFullName.text = defaults.string(forKey: "fullname")
              }
              if defaults.string(forKey: "email") != nil{
                  txtEmail.text = defaults.string(forKey: "email")
              }
              if defaults.string(forKey: "bdate") != nil{
                  let bdate  = defaults.string(forKey: "bdate")
                  let dateFormatter = DateFormatter()
                  dateFormatter.dateFormat = "MMM d, yyyy" //Your date format
                  let date = dateFormatter.date(from: bdate!) //according to date format your date string
                  datepicker.setDate(date!, animated: true)
                }
                if defaults.string(forKey: "email") != nil{
                    txtEmail.text = defaults.string(forKey: "email")
         
        }
    }
    
   func clear()
   {
    txtEmail.resignFirstResponder()
           txtFullName.resignFirstResponder()
    }


}

