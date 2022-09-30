//
//  HealthKitManager.swift
//  TestingApp
//
//  Created by PNT001 on 2022/08/24.
//

import Foundation
import HealthKit

class HealthKitManager: NSObject {
    static let shared = HealthKitManager()
    private override init() { }
    
    let healthStore = HKHealthStore()
    
    
    func authorizeHealthKit(completion: @escaping (Bool, Error?) -> Swift.Void) {

        healthPermission()
        guard HKHealthStore.isHealthDataAvailable() else {

            let error = NSError(domain: "HealthKit", code: 2, userInfo: [NSLocalizedDescriptionKey: "notAvailableOnDevice"])

            completion(false, error)
            return
        }
     
        guard let stepsCount = HKObjectType.quantityType(forIdentifier: .stepCount) else {

            let error = NSError(domain: "HealthKit", code: 2, userInfo: [NSLocalizedDescriptionKey: "dataTypeNotAvailable"])
            completion(false, error)
            return
        }
        
        let healthKitTypesToWrite: Set<HKSampleType> = [stepsCount]

        let healthKitTypesToRead: Set<HKObjectType> = [stepsCount]
        
        if #available(iOS 12.0, *) {
            healthStore.getRequestStatusForAuthorization(toShare: healthKitTypesToWrite, read: healthKitTypesToRead) { (status, error) in
                print("getRequestStatusForAuthorization", status)
                if status == .shouldRequest {
                    completion(false, error)
                } else {
                    completion(true, nil)
                }
            }
        } else {
            // Fallback on earlier versions
            HKHealthStore().requestAuthorization(toShare: healthKitTypesToWrite,
                read: healthKitTypesToRead) { (success, error) in
                completion(success, error)
                return
            }

        }
        
        
        
        
        
        
    }
    
    
    func healthPermission() {
        let healthStore = HKHealthStore()
        if !HKHealthStore.isHealthDataAvailable() { return }
        guard let step: HKSampleType = HKQuantityType.quantityType(forIdentifier: .stepCount) else { return }
        guard let sleep: HKSampleType = HKQuantityType.categoryType(forIdentifier: .sleepAnalysis) else { return }
        guard let distance = HKObjectType.quantityType(forIdentifier: .distanceWalkingRunning) else { return }
        if healthStore.authorizationStatus(for: step) == .notDetermined
            || healthStore.authorizationStatus(for: sleep) == .notDetermined || healthStore.authorizationStatus(for: distance) == .notDetermined {
            healthStore.requestAuthorization(toShare: nil, read: Set([step, sleep, distance])) { _, _ in }
        }
    }
    
    
    
    
    
    
}
