//
//  ReportViewController.swift
//  Woderator
//
//  Created by Helen Vasconcelos on 4/21/15.
//  Copyright (c) 2015 Helen Vasconcelos. All rights reserved.
//

import UIKit
import CoreData

class ReportViewController: UIViewController {
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var wodGenerator = WodGenerator( timeInterval: TimeIntervals.Week )
        var wods = wodGenerator.getWods()
        self.generateRow(wodInfo: wods)
        
//        let newWod = NSEntityDescription.insertNewObjectForEntityForName("WodModel", inManagedObjectContext: self.managedObjectContext!) as! WodModel
//        newWod.name = "Helen"
//        newWod.workout = "500m run, 21KBS, 12 Pullups"
//        
        
        
    }
   
    override func viewWillAppear(animated: Bool) {
//        let fetchRequest = NSFetchRequest(entityName: "WodModel")
//        if let fetchResults = managedObjectContext?.executeFetchRequest(fetchRequest, error: nil) as? [WodModel] {
//            let alert = UIAlertController(title: fetchResults[0].name, message: fetchResults[0].workout, preferredStyle: .Alert)
//            self.presentViewController(alert, animated: true, completion: nil)
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateRow( wodInfo wods: [Wod] ) {
        
    }
}
