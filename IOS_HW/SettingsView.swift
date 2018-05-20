//
//  SettingsView.swift
//  IOS_HW
//
//  Created by Lohith Nimmala on 5/20/18.
//  Copyright © 2018 Lohith Nimmala. All rights reserved.
//

import UIKit

class SettingsView: UIViewController {

    @IBOutlet weak var dUnits: UILabel!
    @IBOutlet weak var bUnits: UILabel!
    @IBOutlet weak var pickerlist: UIPickerView!
    var pickerD : [String] = [String] ()
    var pickerB : [String] = [String] ()
    var bmetric : String = ""
    var dmetric : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerD = [ "Kilometers" , "Miles"]
        self.pickerB = [ "Degrees" , "Mils"]
        
        self.pickerlist.delegate = self
        dUnits.text = dmetric
        bUnits.text = bmetric
        
        dUnits.isUserInteractionEnabled = true
        let tapdistance = UITapGestureRecognizer(target: self, action: #selector(SettingsView.tapdistanceF))
        dUnits.isUserInteractionEnabled = true
        dUnits.addGestureRecognizer(tapdistance)
        
        bUnits.isUserInteractionEnabled = true
        let tapbearing = UITapGestureRecognizer(target: self, action: #selector(SettingsView.tapbearingF))
        bUnits.isUserInteractionEnabled = true
        bUnits.addGestureRecognizer(tapbearing)
        
        let tapanywhere = UITapGestureRecognizer(target: self, action: #selector(SettingsView.tapanywhereF))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapanywhere)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @objc func tapdistanceF(sender:UITapGestureRecognizer) {
        
        self.pickerD = [ "Kilometers" , "Miles"]
       pickerlist.isHidden = false
        pickerlist.reloadAllComponents()
        
        print( "Distance clicked")
    }
    @objc func tapbearingF(sender:UITapGestureRecognizer) {
        
        self.pickerD = [ "Degrees" , "Mils"]
       pickerlist.isHidden = false
        pickerlist.reloadAllComponents()
        
        print( "Bearing clicked")
    }
    
    @objc func tapanywhereF(sender:UITapGestureRecognizer) {
        
        self.pickerD = [ "Kilometers" , "Miles"]
       pickerlist.isHidden = true
        print( "View clicked")
    }
    
    
    override func prepare(for segue : UIStoryboardSegue, sender : Any?)
    {
        if (segue.identifier == "SaveSegue") {
        guard let vc = segue.destination as? ViewController else { return}
        vc.dmetric = dUnits.text!
        vc.bmetric = bUnits.text!
        }
        
    }
    
    
   
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension SettingsView : UIPickerViewDataSource, UIPickerViewDelegate {
    // The number of columns of data
    func numberOfComponents(in: UIPickerView) -> Int
    {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return pickerD.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return self.pickerD[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        
        if (self.pickerD[0] == "Kilometers" ||  self.pickerD[0] == "Miles" ) {
            dUnits.text = self.pickerD[row]
            print ( "Select dmetric is \(dUnits.text!)")
            
        } else{
            bUnits.text = self.pickerD[row]
            print ("Selected bmetric is \(bUnits.text!)")
        }
    }
}
