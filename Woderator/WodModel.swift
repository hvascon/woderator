//
//  WodModel.swift
//  Woderator
//
//  Created by Helen Vasconcelos on 4/21/15.
//  Copyright (c) 2015 Helen Vasconcelos. All rights reserved.
//

import Foundation
import CoreData

//@objc(WodModel)
class WodModel: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var workout: String
    @NSManaged var priority: String

}

enum Priority {
    case Element
    case Task
    case Time
}

class Wod {
    
    var description : String?
    var name : String?
    let priority : Priority
    let exercises : [Exercise]
    
    init( priority : Priority, exercises: [Exercise] )
    {
        self.priority = priority
        self.exercises = exercises
    }
    
    // Returns all modalities in this WOD
    // ie: Weightlifting, Gymnastics.
    func modalities() -> [Modality]
    {
        var modalities = [Modality]()
        for exercise in self.exercises {
            if !contains(modalities, exercise.modality) {
                modalities.append(exercise.modality)
            }
        }
        return modalities
    }
    
    
}