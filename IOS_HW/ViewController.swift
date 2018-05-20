//
//  ViewController.swift
//  IOS_HW
//
//  Created by Lohith Nimmala on 5/19/18.
//  Copyright © 2018 Lohith Nimmala. All rights reserved.
//

import UIKit
import Foundation
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var bClear: UIButton!
    @IBOutlet weak var bCalculate: UIButton!
    var dmetric = "Kilometers"
    var bmetric = "Degrees"
    
    @IBOutlet weak var Errormessage: UILabel!
    @IBOutlet weak var ldmetric: UILabel!
    @IBOutlet weak var lbmetric: UILabel!
    
    @IBOutlet weak var lat1: UITextField!
    @IBOutlet weak var lon2: UITextField!
    @IBOutlet weak var lat3: UITextField!
    @IBOutlet weak var lon4: UITextField!
    
    @IBOutlet weak var bresult: UILabel!
    @IBOutlet weak var dresult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ldmetric.text = dmetric
        lbmetric.text = bmetric
        bCalculate.layer.cornerRadius = 4
        bClear.layer.cornerRadius = 4
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue : UIStoryboardSegue, sender : Any?)
    {
        
            guard let vc = segue.destination as? SettingsView else { return}
            vc.dmetric = ldmetric.text!
            vc.bmetric = lbmetric.text!
        
    }
    
    @IBAction func click_bClear(_ sender: UIButton) {
        
        lat1.text=""
        lon2.text=""
        lat3.text=""
        lon4.text=""
        Errormessage.text=""
        dresult.text=""
        bresult.text=""
        
    }
    
    @IBAction func click_bCalculate(_ sender: UIButton) {
        
        
        self.hideKeyboardWhenTappedAround()
        
        if (lat1.text!=="" || lon2.text!=="" || lat3.text!=="" || lon4.text!=="" ) {
            
            Errormessage.text = "Please enter all four values"
            return
            
        }
        Errormessage.text = ""
        
        let x1 = Double(lat1.text!)
        let y1 = Double(lon2.text!)
        let x2 = Double(lat3.text!)
        let y2 = Double(lon4.text!)
        print (x1!)
        print (y2!)
        let coordinate1 = CLLocation(latitude:x1!, longitude: y1!)
        let coordinate2 = CLLocation(latitude:x2!, longitude: y2!)
        
        let distanceInMeters = coordinate1.distance(from:coordinate2)
        
        
        if ( ldmetric.text != "Kilometers"){
            
            let mdist : Double = 0.621371 * ( distanceInMeters / 1000)
            dresult.text = String("\(mdist)").prefix(7)+"Miles"
            
        } else {
            dresult.text = String("\(distanceInMeters / 1000)").prefix(7) + "Kms"
        }
        
        if ( lbmetric.text != "Degrees"){
            
            let mbear = 17.777 * (coordinate1.bearingToPoint(point: coordinate2))
            bresult.text = String("\(mbear)").prefix(7) + "Mils"
            
        } else {
            bresult.text = String("\(coordinate1.bearingToPoint(point: coordinate2))").prefix(7) + "Degrees"
        }
        
        
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer =     UITapGestureRecognizer(target: self, action:#selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

