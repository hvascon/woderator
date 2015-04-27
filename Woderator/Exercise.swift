//
//  Exercise.swift
//  Woderator
//
//  Created by Helen Vasconcelos on 4/21/15.
//  Copyright (c) 2015 Helen Vasconcelos. All rights reserved.
//

import Foundation
import UIKit
import CoreData

enum Modality : String {
    case Gymnastics = "Gymnastics"
    case Metabolic = "Metabolic"
    case Weighlifting = "Weightlifting"
    
    static var count : Int { return Modality.Weighlifting.hashValue + 1 }
    static var vals : [String] { return ["Gymnastics", "Metabolic", "Weightlifting"] }
}

class ExerciseModel : NSManagedObject {
    @NSManaged var name: String
    @NSManaged var modalityString: String
    var modality : Modality {
        get { return Modality(rawValue: self.modalityString) ?? .Gymnastics }
        set { self.modalityString = newValue.rawValue }
    }
}

class Exercise {
    let name : String
    let modality : Modality
    var time : NSTimeInterval?
    var repNumber : Int?
    
    init( name: String, modality : Modality )
    {
        self.name = name
        self.modality = modality
    }
    
    convenience init( name: String, modality : Modality, repNumber: Int )
    {
        self.init(name: name, modality: modality)
        self.repNumber = repNumber
    }
    
   
}

// Exercise operations: add, retrieve, delete
class ExerciseOperations {
    
    let context : NSManagedObjectContext
    var exercises : NSArray?
    var weightliftingExercises = NSArray()
    var metabolicExercises = NSArray()
    var gymnasticsExercises = NSArray()
    
    init() {
        let appDelegate : AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        self.context = appDelegate.managedObjectContext!
        
        let fetchRequest = NSFetchRequest(entityName: "ExerciseModel")
        var error : NSError?
        
        let fetchedResults = self.context.executeFetchRequest(fetchRequest, error: &error) as? [NSManagedObject]
        
        if let results = fetchedResults {
            self.exercises = results
            self.setExerciseModalities(self.exercises)
        }
        else {
            println("Could not fetch results for exercise. Error = \(error), \(error?.userInfo)")
        }
    }
    
     func addExercise( name : String, modality: String ) {
   
        let en = NSEntityDescription.entityForName("ExerciseModel", inManagedObjectContext: self.context)
        
        var newItem = ExerciseModel(entity: en!, insertIntoManagedObjectContext: context)
        
        newItem.name = name
        newItem.modalityString = modality
        
        
        self.context.save(nil)
    }
    
    func setExerciseModalities( var exercises : NSArray?) {
        for exercise : ExerciseModel in exercises  {
            if exercise.modality == Modality.Weightlifting {
                self.weightliftingExercises.append(exercise)
            }
            else if exercise.modality == Modality.Gymnastics {
                self.gymnasticsExercises.append(exercise)
            }
            else if exercise.modality == Modality.Metabolic {
                self.metabolicExercises.append(exercise)
            }
        }
    }
}

class WeightliftingExercise: Exercise {
    let weight : Double
    
    init( name: String, weight: Double, repNumber: Int )
    {
        let modality = Modality.Weighlifting
        self.weight = weight
        super.init(name: name, modality: modality)
    }
}

