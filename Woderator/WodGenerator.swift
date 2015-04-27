//
//  WodGenerator.swift
//  Woderator
//
//  Created by Helen Vasconcelos on 4/21/15.
//  Copyright (c) 2015 Helen Vasconcelos. All rights reserved.
//

import Foundation

enum TimeIntervals : Int {
    case Day = 1
    case Week = 7
    case Month = 30
}

class WodGenerator
{
    var wods : [Wod]?

    init( timeInterval: TimeIntervals )
    {
        var numberOfDays = timeInterval.rawValue
        var wod : Wod
        
        var exerciseOperations = ExerciseOperations()
    
        for i in 0..<numberOfDays {
//            wod = self.generateWOD(<#modalities: [Modality]#>)
//            self.wods?.append(wod)
        }
        
    }

    func generateWOD( modalities: [Modality] ) -> Wod
    {
        
        var exercises = [
            Exercise(name: "500 m run", modality: Modality.Metabolic),
            WeightliftingExercise(name: "KBS", weight: 35, repNumber: 21),
            Exercise(name: "Pullups", modality: Modality.Gymnastics, repNumber: 12),
        ]
        
        var wod = Wod(priority: Priority.Task, exercises: exercises)
        return wod
    }
    
    func getWods() -> [Wod] {
        return self.wods!
    }
}
