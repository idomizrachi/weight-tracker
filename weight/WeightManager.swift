//
//  WeightManager.swift
//  weight
//
//  Created by Ido Mizrachi on 15/04/2018.
//  Copyright © 2018 Ido Mizrachi. All rights reserved.
//

import Foundation
import HealthKit

class WeightManager {
    let healthStore: HKHealthStore = HKHealthStore()
    
    func latestWeight(completion: @escaping (Double) -> Void) {
        /*
 if HKHealthStore.isHealthDataAvailable() == false {
 return
 }
 let date = Date()
 guard let unit = HKQuantityType.quantityType(forIdentifier: .bodyMass) else {
 return
 }
 let weight = HKQuantity(unit: HKUnit.gram(), doubleValue: 91456)
 let sample = HKQuantitySample(type: unit, quantity: weight, start: date, end: date)*/
        
        
        guard let unit = HKQuantityType.quantityType(forIdentifier: .bodyMass) else {
            return
        }
        let sortDescriptor = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: false)
        let query: HKSampleQuery = HKSampleQuery(sampleType: unit, predicate: nil, limit: 1, sortDescriptors: [sortDescriptor]) { (query, samples, error) in
            guard let sample = samples?.first as? HKQuantitySample else {
                completion(0)
                return
            }
            completion(sample.quantity.doubleValue(for: .gram()) / 1000.0)
        }
        self.healthStore.execute(query)
    }
    
    func addWeight(weight: Double, completion: @escaping (Bool) -> Void) {
        guard HKHealthStore.isHealthDataAvailable() == true else {
            DispatchQueue.main.async {
                completion(false)
            }
            return
        }
        let date = Date()
        guard let unit = HKQuantityType.quantityType(forIdentifier: .bodyMass) else {
            return
        }
        let weight = HKQuantity(unit: HKUnit.gram(), doubleValue: weight * 1000.0)
        let sample = HKQuantitySample(type: unit, quantity: weight, start: date, end: date)
        self.healthStore.save(sample) { (success, error) in
            DispatchQueue.main.async {
                completion(success)
            }            
        }
    }

}
