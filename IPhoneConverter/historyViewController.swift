//
//  historyViewController.swift
//  IPhoneConverter
//
//  Created by Md Bin Amin on 01/03/2018.
//  Copyright © 2018 Md Bin Amin. All rights reserved.
//

import UIKit

class historyViewController: UIViewController {

    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl4: UILabel!
    @IBOutlet weak var lbl5: UILabel!
    
    var label1: String = ""
    var label2: String = ""
    var label3: String = ""
    var label4: String = ""
    var label5: String = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl1.text = label1
        lbl2.text = label2
        lbl3.text = label3
        lbl4.text = label4
        lbl5.text = label5
        
        lbl1.adjustsFontSizeToFitWidth = true
        lbl2.adjustsFontSizeToFitWidth = true
        lbl3.adjustsFontSizeToFitWidth = true
        lbl4.adjustsFontSizeToFitWidth = true
        lbl5.adjustsFontSizeToFitWidth = true
        
    
        
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
