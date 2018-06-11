//
//  speedViewController.swift
//  IPhoneConverter
//
//  Created by Md Bin Amin on 27/02/2018.
//  Copyright © 2018 Md Bin Amin. All rights reserved.
//

import UIKit

extension Double {
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
}

class speedViewController: UIViewController{

    @IBOutlet weak var tf1: UITextField!
    @IBOutlet weak var tf2: UITextField!
    @IBOutlet weak var tf3: UITextField!
    
    var userConver : [String] = ["","","","",""]
    
    var activeText = ""
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        userConver[0] = UserDefaults.standard.object(forKey: "Speed1") as! String
        userConver[1] = UserDefaults.standard.object(forKey: "Speed2") as! String
        userConver[2] = UserDefaults.standard.object(forKey: "Speed3") as! String
        userConver[3] = UserDefaults.standard.object(forKey: "Speed4") as! String
        userConver[4] = UserDefaults.standard.object(forKey: "Speed5") as! String
        
//        if let itemList = itemList {
//            userConver[0] = itemList as! String
//        }
//        if let itemList1 = itemList1 {
//            userConver[1] = itemList1 as! String
//        }
//        if let itemList2 = itemList2 {
//            userConver[2] = itemList2 as! String
//        }
//        if let itemList3 = itemList3 {
//            userConver[3] = itemList3 as! String
//        }
//        if let itemList4 = itemList4 {
//            userConver[4] = itemList4 as! String
//        }
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func saveAction(_ sender: UIBarButtonItem) {
        
        let mSecValue = (self.tf1.text! as NSString).floatValue
        let kmHrValue = (self.tf2.text! as NSString).floatValue
        let mHrValue = (self.tf3.text! as NSString).floatValue
        
        Saveinput(input: "\(mSecValue) m/s = \(kmHrValue) km/h = \(mHrValue) mi/h")
        
        UserDefaults.standard.set(userConver[0], forKey: "Speed1")
        UserDefaults.standard.set(userConver[1], forKey: "Speed2")
        UserDefaults.standard.set(userConver[2], forKey: "Speed3")
        UserDefaults.standard.set(userConver[3], forKey: "Speed4")
        UserDefaults.standard.set(userConver[4], forKey: "Speed5")
        
        UserDefaults.standard.synchronize()
        
        
    }
    
    func Saveinput(input:String){
        
        userConver[4]=userConver[3]
        
        userConver[3]=userConver[2]
        
        userConver[2]=userConver[1]
        
        userConver[1]=userConver[0]
        
        userConver[0] = input
        
    }
    
    @IBAction func metreSecChanged(_ sender: UITextField) {
        
        let mSecValue = (self.tf1.text! as NSString).floatValue
        let kmHrValue = Double(mSecValue*(3.6)).roundToDecimal(4)
        let mHrValue = Double(mSecValue*(2.23694)).roundToDecimal(4)
        
        self.tf2.text = "\(kmHrValue)"
        self.tf3.text = "\(mHrValue)"
        
        if (tf1.text!.isEmpty){
            self.tf2.text = "0"
            self.tf3.text = "0"
            activeText = ""
        }
        
        
        
    }
    
    @IBAction func kmHrChanged(_ sender: UITextField) {
        let kmHrValue = (self.tf2.text! as NSString).floatValue
        let mSecValue = Double(kmHrValue/(3.6)).roundToDecimal(4)
        let mHrValue = Double(mSecValue*(2.23694)).roundToDecimal(4)
        
        self.tf1.text = "\(mSecValue)"
        self.tf3.text = "\(mHrValue)"
        
        if (tf2.text!.isEmpty){
            self.tf3.text = "0"
            self.tf1.text = "0"
            activeText = ""
        }
        
        
    }
    
    @IBAction func mileHrChanged(_ sender: UITextField) {
        let mHrValue = (self.tf3.text! as NSString).floatValue
        let mSecValue = Double(mHrValue/(2.23694)).roundToDecimal(4)
        let kmHrValue = Double(mSecValue*(3.6)).roundToDecimal(4)
        
        self.tf2.text = "\(kmHrValue)"
        self.tf1.text = "\(mSecValue)"
        
        if (tf3.text!.isEmpty){
            self.tf2.text = "0"
            self.tf1.text = "0"
            activeText = ""
        }
    
    }
    
    
    
    @IBAction func numberTouched(_ sender: UIButton) {
        switch sender.titleLabel?.text {
        case "1"?:
            activeText = activeText + "1"
            print("1 pressed")
            
        case "2"?:
            activeText = activeText + "2"
            print("2 pressed")
        case "3"?:
            activeText = activeText + "3"
            print("3 pressed")
        case "4"?:
            activeText = activeText + "4"
            print("4 pressed")
        case "5"?:
            activeText = activeText + "5"
            print("5 pressed")
        case "6"?:
            activeText = activeText + "6"
            print("6 pressed")
        case "7"?:
            activeText = activeText + "7"
            print("7 pressed")
        case "8"?:
            activeText = activeText + "8"
            print("8 pressed")
        case "9"?:
            activeText = activeText + "9"
            print("9 pressed")
        case "0"?:
            activeText = activeText + "0"
            print("0 pressed")
        case "."?:
            if(activeText.contains(".")){}
            else { activeText = activeText + "."  }
            print(". pressed")
        case "DEL"?:
            if(activeText.isEmpty){}
            else {activeText.removeLast() }
            print("DEL PRESSED")
        case "-"?:
            if(activeText.contains("-")){}
            else { activeText = "-" + activeText  }
            print("- PRESSED")
            
            
        default:
            print("defualt case")
        }
        
        if tf1.isFirstResponder == true {
            tf1.text = activeText
            tf1.sendActions(for: UIControlEvents.editingChanged)
        }
        if tf2.isFirstResponder == true{
            tf2.text = activeText
            tf2.sendActions(for: UIControlEvents.editingChanged)
            
        }
        if tf3.isFirstResponder == true{
            tf3.text = activeText
            tf3.sendActions(for: UIControlEvents.editingChanged)
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vcc = segue.destination as? historyViewController {
            
            let temp1 = UserDefaults.standard.object(forKey: "Speed1") ?? [String]()
            let temp2 = UserDefaults.standard.object(forKey: "Speed2") ?? [String]()
            let temp3 = UserDefaults.standard.object(forKey: "Speed3") ?? [String]()
            let temp4 = UserDefaults.standard.object(forKey: "Speed4") ?? [String]()
            let temp5 = UserDefaults.standard.object(forKey: "Speed5") ?? [String]()

            vcc.label1 = String(describing: temp1)
            vcc.label2 = String(describing: temp2)
            vcc.label3 = String(describing: temp3)
            vcc.label4 = String(describing: temp4)
            vcc.label5 = String(describing: temp5)
//
            
        }
    }
    

}
