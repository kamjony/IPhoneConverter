//
//  FirstViewController.swift
//  IPhoneConverter
//
//  Created by Md Bin Amin on 26/02/2018.
//  Copyright © 2018 Md Bin Amin. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController {

    @IBOutlet weak var tf1: UITextField!
    @IBOutlet weak var tf2: UITextField!
    @IBOutlet weak var tf3: UITextField!
    @IBOutlet weak var tf4: UITextField!
    @IBOutlet weak var tf5: UITextField!
    @IBOutlet weak var tf6: UITextField!
    
    var userConver : [String] = ["","","","",""]
    
    var integer = 0.0
    
    var activeText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userConver[0] = UserDefaults.standard.object(forKey: "Weight1") as! String
        userConver[1] = UserDefaults.standard.object(forKey: "Weight2") as! String
        userConver[2] = UserDefaults.standard.object(forKey: "Weight3") as! String
        userConver[3] = UserDefaults.standard.object(forKey: "Weight4") as! String
        userConver[4] = UserDefaults.standard.object(forKey: "Weight5") as! String


    }
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveAction(_ sender: UIBarButtonItem) {
        
        let ounceValue = (self.tf1.text! as NSString).floatValue
        let poundValue = (self.tf2.text! as NSString).floatValue
        let gramValue = (self.tf3.text! as NSString).floatValue
        let lbsValue = (self.tf4.text! as NSString).floatValue
        let kgValue = (self.tf6.text! as NSString).floatValue
        
        Saveinput(input: "\(ounceValue) oz = \(poundValue) lb = \(gramValue) g = \(lbsValue) st \(lbsValue) lb = \(kgValue) kg")
        
        UserDefaults.standard.set(userConver[0], forKey: "Weight1")
        UserDefaults.standard.set(userConver[1], forKey: "Weight2")
        UserDefaults.standard.set(userConver[2], forKey: "Weight3")
        UserDefaults.standard.set(userConver[3], forKey: "Weight4")
        UserDefaults.standard.set(userConver[4], forKey: "Weight5")
        
        UserDefaults.standard.synchronize()
        
    }
    
    func Saveinput(input:String){
        
        userConver[4]=userConver[3]
        
        userConver[3]=userConver[2]
        
        userConver[2]=userConver[1]
        
        userConver[1]=userConver[0]
        
        userConver[0] = input
        
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
        if tf4.isFirstResponder == true{
            tf4.text = activeText
            tf4.sendActions(for: UIControlEvents.editingChanged)
            
        }
        if tf6.isFirstResponder == true{
            tf6.text = activeText
            tf6.sendActions(for: UIControlEvents.editingChanged)
            
        }
        
        
    }
    
    
    @IBAction func ounceChanged(_ sender: UITextField) {
        
        let ounceValue = (self.tf1.text! as NSString).floatValue
        let poundValue = Double(ounceValue*(1/16)).roundToDecimal(4)
        let gramValue = Double(ounceValue*(28.3496)).roundToDecimal(4)
        let kgValue = Double((gramValue)/1000).roundToDecimal(4)
        let stoneLbs = Double(ounceValue*0.0044643)
        let lbs = Double((modf(stoneLbs, &integer))*14).roundToDecimal(4)
        
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 1
        let str = numberFormatter.string(for: floor(stoneLbs))!
        
        self.tf2.text = "\(poundValue)"
        self.tf3.text = "\(gramValue)"
        self.tf6.text = "\(kgValue)"
        self.tf5.text = "\(lbs)"
        self.tf4.text = "\(str)"
        
        if (tf1.text!.isEmpty){
            self.tf2.text = "0"
            self.tf3.text = "0"
            self.tf4.text = "0"
            self.tf6.text = "0"
            activeText = ""
        }
        

    }
    
    
    @IBAction func poundChanged(_ sender: UITextField) {
        
        let poundValue = (self.tf2.text! as NSString).floatValue
        let ounceValue = Double(poundValue*16).roundToDecimal(4)
        let gramValue = Double(ounceValue*(28.3496)).roundToDecimal(4)
        let kgValue = Double((gramValue)/1000).roundToDecimal(4)
        let stoneLbs = Double(ounceValue*0.0044643)
        let lbs = Double((modf(stoneLbs, &integer))*14).roundToDecimal(4)
        
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 1
        let str = numberFormatter.string(for: floor(stoneLbs))!
        
        self.tf1.text = "\(ounceValue)"
        self.tf3.text = "\(gramValue)"
        self.tf6.text = "\(kgValue)"
        self.tf4.text = "\(str)"
        self.tf5.text = "\(lbs)"
        
        if (tf2.text!.isEmpty){
            self.tf1.text = "0"
            self.tf3.text = "0"
            self.tf4.text = "0"
            self.tf6.text = "0"
            activeText = ""
        }
    }
    
    
    @IBAction func gramChanged(_ sender: UITextField) {
        let gramValue = (self.tf3.text! as NSString).floatValue
        let ounceValue = Double(gramValue/(28.3496)).roundToDecimal(4)
        let poundValue = Double(ounceValue*(1/16)).roundToDecimal(4)
        let kgValue = Double((gramValue)/1000).roundToDecimal(4)
        let stoneLbs = Double(ounceValue*0.0044643)
        let lbs = Double((modf(stoneLbs, &integer))*14).roundToDecimal(4)
        
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 1
        let str = numberFormatter.string(for: floor(stoneLbs))!
        
        self.tf1.text = "\(ounceValue)"
        self.tf2.text = "\(poundValue)"
        self.tf6.text = "\(kgValue)"
        self.tf4.text = "\(str)"
        self.tf5.text = "\(lbs)"
        
        if (tf3.text!.isEmpty){
            self.tf1.text = "0"
            self.tf2.text = "0"
            self.tf4.text = "0"
            self.tf6.text = "0"
            activeText = ""
        }
        
    }
    
    
    @IBAction func stoneChanged(_ sender: UITextField) {
        
        let stoneLbs = (self.tf4.text! as NSString).floatValue
        let ounceValue = Double(stoneLbs * 224).roundToDecimal(4)
        let poundValue = Double(ounceValue*(1/16)).roundToDecimal(4)
        let gramValue = Double(ounceValue*(28.3496)).roundToDecimal(4)
        let kgValue = Double((gramValue)/1000).roundToDecimal(4)
        
        
        self.tf1.text = "\(ounceValue)"
        self.tf2.text = "\(poundValue)"
        self.tf3.text = "\(gramValue)"
        self.tf6.text = "\(kgValue)"
        
        
        
    
    }
    
    @IBAction func kiloChanged(_ sender: UITextField) {
        let kgValue = (self.tf6.text! as NSString).floatValue
        let gramValue = Double(kgValue*1000).roundToDecimal(4)
        let ounceValue = Double(gramValue/(28.3496)).roundToDecimal(4)
        let poundValue = Double(ounceValue*(1/16)).roundToDecimal(4)
        let stoneLbs = Double(ounceValue*0.0044643)
        let lbs = Double((modf(stoneLbs, &integer))*14).roundToDecimal(4)
        
        let numberFormatter = NumberFormatter()
        numberFormatter.maximumFractionDigits = 1
        let str = numberFormatter.string(for: floor(stoneLbs))!

        
        self.tf1.text = "\(ounceValue)"
        self.tf2.text = "\(poundValue)"
        self.tf3.text = "\(gramValue)"
        self.tf4.text = "\(str)"
        self.tf5.text = "\(lbs)"
        
        if (tf6.text!.isEmpty){
            self.tf1.text = "0"
            self.tf2.text = "0"
            self.tf3.text = "0"
            self.tf4.text = "0"
            activeText = ""
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vcc = segue.destination as? historyViewController {
            
            let temp1 = UserDefaults.standard.object(forKey: "Weight1") ?? [String]()
            let temp2 = UserDefaults.standard.object(forKey: "Weight2") ?? [String]()
            let temp3 = UserDefaults.standard.object(forKey: "Weight3") ?? [String]()
            let temp4 = UserDefaults.standard.object(forKey: "Weight4") ?? [String]()
            let temp5 = UserDefaults.standard.object(forKey: "Weight5") ?? [String]()
            
            vcc.label1 = String(describing: temp1)
            vcc.label2 = String(describing: temp2)
            vcc.label3 = String(describing: temp3)
            vcc.label4 = String(describing: temp4)
            vcc.label5 = String(describing: temp5)
            //
            
        }
    }
    

}


