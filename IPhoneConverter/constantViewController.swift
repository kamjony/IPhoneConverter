//
//  constantViewController.swift
//  IPhoneConverter
//
//  Created by Md Bin Amin on 27/02/2018.
//  Copyright © 2018 Md Bin Amin. All rights reserved.
//

import UIKit

class constantViewController: UIViewController {
    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var lbl4: UILabel!
    @IBOutlet weak var lbl5: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let font:UIFont? = UIFont(name: "Helvetica", size:18)
        let fontSuper:UIFont? = UIFont(name: "Helvetica", size:10)
        let fontSub:UIFont? = UIFont(name: "Helvetica", size:10)

        let attString:NSMutableAttributedString = NSMutableAttributedString(string: "Electron mass, me = 9.109×10-31 kg", attributes: [.font:font!])
        attString.setAttributes([.font:fontSuper!,.baselineOffset:10], range: NSRange(location:28,length:3))
        attString.setAttributes([.font:fontSub!,.baselineOffset:-5], range: NSRange(location:16,length:1))
            lbl1.attributedText = attString
        
        let attString1:NSMutableAttributedString = NSMutableAttributedString(string: "Proton mass, mp = 1.673×10-27 kg", attributes: [.font:font!])
        attString1.setAttributes([.font:fontSuper!,.baselineOffset:10], range: NSRange(location:26,length:3))
        attString1.setAttributes([.font:fontSub!,.baselineOffset:-5], range: NSRange(location:14,length:1))
        lbl2.attributedText = attString1
        
        let attString2:NSMutableAttributedString = NSMutableAttributedString(string: "Neutron mass, mn = 1.673×10-27 kg", attributes: [.font:font!])
        attString2.setAttributes([.font:fontSuper!,.baselineOffset:10], range: NSRange(location:27,length:3))
        attString2.setAttributes([.font:fontSub!,.baselineOffset:-5], range: NSRange(location:15,length:1))
        lbl3.attributedText = attString2
        
        let attString3:NSMutableAttributedString = NSMutableAttributedString(string: "Electric permittivity, Ɛ0 = 8.85x10-12 C2/Nm2", attributes: [.font:font!])
        attString3.setAttributes([.font:fontSuper!,.baselineOffset:10], range: NSRange(location:35,length:3))
        attString3.setAttributes([.font:fontSuper!,.baselineOffset:10], range: NSRange(location:40,length:1))
        attString3.setAttributes([.font:fontSuper!,.baselineOffset:10], range: NSRange(location:44,length:1))
        attString3.setAttributes([.font:fontSub!,.baselineOffset:-5], range: NSRange(location:24,length:1))
        lbl4.attributedText = attString3
        
        let attString4:NSMutableAttributedString = NSMutableAttributedString(string: "Magnetic permeability, µ0 = 1.673×10-27 kg", attributes: [.font:font!])
        attString4.setAttributes([.font:fontSuper!,.baselineOffset:10], range: NSRange(location:36,length:3))
        attString4.setAttributes([.font:fontSub!,.baselineOffset:-5], range: NSRange(location:24,length:1))
        lbl5.attributedText = attString4
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    
}
