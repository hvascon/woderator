//
//  AddExerciseViewController.swift
//  Woderator
//
//  Created by Helen Vasconcelos on 4/24/15.
//  Copyright (c) 2015 Helen Vasconcelos. All rights reserved.
//

import UIKit

class AddExerciseViewController: UIViewController {
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var modality: UIPickerView!

    var modalities = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.modalities = Modality.vals
        
        var tap = UITapGestureRecognizer(target: self, action: Selector("dismissKeyboard"))
        self.view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dismissKeyboard(){
        self.view.endEditing(true)
    }

    
}

extension AddExerciseViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Modality.count
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return self.modalities[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Save
        var selectedModalityString = self.modalities[row]
        var name = self.name.text
     
        var exerciseOperations = ExerciseOperations()
        
        exerciseOperations.addExercise(name, modality: selectedModalityString)
    }
}