//
//  MovieFilterVC.swift
//  ibdm
//
//  Created by Xi Yang on 12/21/15.
//  Copyright © 2015 Chen Wang. All rights reserved.
//

import UIKit

class MovieFilterVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var sliderRunTime: UISlider!
    @IBOutlet weak var sliderPopularity: UISlider!
    @IBOutlet weak var textfieldGenre: UITextField!
    @IBOutlet weak var textfieldEndYear: UITextField!
    @IBOutlet weak var textfieldStartYear: UITextField!
    
    @IBOutlet weak var labelRunTime: UILabel!
    @IBOutlet weak var labelPopularity: UILabel!
    
    @IBOutlet weak var switchGenre: UISwitch!
    
    @IBOutlet weak var switchFromYear: UISwitch!
    
    @IBOutlet weak var switchToYear: UISwitch!
    
    @IBOutlet weak var switchPopularity: UISwitch!
    
    @IBOutlet weak var switchRunTime: UISwitch!
    
    var pickSelect: Int = 0
    var pickGenre = UIPickerView()
    
    let genres = ["Adventure","Comedy","Crime","Drama","Fantasy","Foreign","Horror","Music","Mystery","Action","Thriller","Science Fiction"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        pickGenre.delegate = self
        pickGenre.dataSource = self
        
        textfieldGenre.inputView = pickGenre
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }


    @IBAction func sliderPopularity(sender: UISlider) {
        let sliderValue = sender.value
        let label = String(format:"%.2f", sliderValue)
        labelPopularity.text = "popularity >"+label
    }
    
    @IBAction func sliderRunTime(sender: UISlider) {
        let sliderValue = sender.value
        let label = String(lroundf(sliderValue))
        labelRunTime.text = "runtime < "+label+" minutes"
    }
    
    @IBAction func textfieldStartYearEditing(sender: UITextField) {
        
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: Selector("datePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
   
        pickSelect = 1;
        
    }
    
    
    @IBAction func textfieldEndYearEditing(sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: Selector("datePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
        pickSelect = 2;
    }
    
    func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        
        if(pickSelect == 1) {
            self.textfieldStartYear.text = dateFormatter.stringFromDate(sender.date)
        } else if (pickSelect == 2) {
            self.textfieldEndYear.text = dateFormatter.stringFromDate(sender.date)
        }
    }

    @IBAction func submitFilter(sender: UIButton) {

        if self.switchFromYear.on {
        
        }
        if self.switchToYear.on {
            
        }
        if self.switchGenre.on {
            
        }
        if self.switchPopularity.on {
            
        }
        if self.switchRunTime.on {
            
        }
        
        self.performSegueWithIdentifier("toMain", sender: self)
    }
    
    @IBAction func enableOrDisableGenre(sender: UISwitch) {
        if sender.on {
            let genre = textfieldGenre.text
            parametersMovie.updateValue(genre!, forKey: "Genre")
        } else {
            parametersMovie.updateValue("", forKey: "Genre")
        }
    }
    
    @IBAction func enableOrDisableFromYear(sender: UISwitch) {
        if sender.on {
            let fromYear = textfieldEndYear.text
            parametersMovie.updateValue(fromYear!, forKey: "FromYear")
        } else {
            parametersMovie.updateValue("", forKey: "FromYear")
        }
    }
    
    @IBAction func enableOrDisableToYear(sender: UISwitch) {
        if sender.on {
            let toYear = textfieldEndYear.text
            parametersMovie.updateValue(toYear!, forKey: "ToYear")
        } else {
            parametersMovie.updateValue("", forKey: "ToYear")
        }
    }
  
    @IBAction func enableOrDisablePopularity(sender: UISwitch) {
        if sender.on {
            let popularity = String(format:"%.2f", self.sliderPopularity.value)
            parametersMovie.updateValue(popularity, forKey: "RunTime")
        } else {
            parametersMovie.updateValue("", forKey: "Popularity")
        }
    }
    
    
    @IBAction func enableOrDisableRunTime(sender: UISwitch) {
        if sender.on {
            let runTime = String(lroundf(self.sliderRunTime.value))
            parametersMovie.updateValue(runTime, forKey: "RunTime")
        } else {
            parametersMovie.updateValue("", forKey: "RunTime")
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genres.count
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textfieldGenre.text = genres[row]
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genres[row]
    }


}
