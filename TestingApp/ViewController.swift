//
//  ViewController.swift
//  TestingApp
//
//  Created by PNT001 on 2022/08/24.
//

import UIKit
import HealthKit

class ViewController: UIViewController {
    
    let title1: UILabel = {
        let title1 = UILabel()
        title1.text = "걸음수"
        title1.textAlignment = .center
        title1.translatesAutoresizingMaskIntoConstraints = false
        title1.backgroundColor = .orange
        title1.bold(targetString: "걸")
        title1.underLine(targetString: "수")
        return title1
    }()
    
    let title2: UILabel = {
        let title1 = UILabel()
        title1.text = "수면시간"
        title1.textAlignment = .center
        title1.translatesAutoresizingMaskIntoConstraints = false
        title1.backgroundColor = .black
        title1.bold(targetString: "수면")
        return title1
    }()
    
    let title3: UILabel = {
        let title1 = UILabel()
        title1.text = "이동거리"
        title1.textAlignment = .center
        title1.translatesAutoresizingMaskIntoConstraints = false
        title1.backgroundColor = .blue
        title1.underLine(targetString: "이동")
        return title1
    }()
    
    let switch1: UISwitch = {
        let switch1 = UISwitch()
        switch1.translatesAutoresizingMaskIntoConstraints = false
        switch1.isOn = false
//        switch1.backgroundColor = .red
        switch1.tintColor = .orange
        return switch1
    }()
    
    let switch2: UISwitch = {
        let switch1 = UISwitch()
        switch1.translatesAutoresizingMaskIntoConstraints = false
        switch1.isOn = false
//        switch1.backgroundColor = .black
        switch1.tintColor = .orange
        return switch1
    }()
    
    let switch3: UISwitch = {
        let switch1 = UISwitch()
        switch1.translatesAutoresizingMaskIntoConstraints = false
        switch1.isOn = false
//        switch1.backgroundColor = .blue
        switch1.tintColor = .orange
        return switch1
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(title1)
        self.view.addSubview(title2)
        self.view.addSubview(title3)
        
        self.view.addSubview(switch1)
        self.view.addSubview(switch2)
        self.view.addSubview(switch3)
        
        title1.widthAnchor.constraint(equalToConstant: 200).isActive = true
        title2.widthAnchor.constraint(equalToConstant: 200).isActive = true
        title3.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        title1.heightAnchor.constraint(equalToConstant: 50).isActive = true
        title2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        title3.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        title1.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        title2.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        title3.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        
        title1.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive = true
        title2.topAnchor.constraint(equalTo: title1.bottomAnchor, constant: 20).isActive = true
        title3.topAnchor.constraint(equalTo: title2.bottomAnchor, constant: 20).isActive = true
        
        switch1.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        switch2.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        switch3.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
        switch1.leadingAnchor.constraint(equalTo: title1.trailingAnchor, constant: 50).isActive = true
        switch2.leadingAnchor.constraint(equalTo: title2.trailingAnchor, constant: 50).isActive = true
        switch3.leadingAnchor.constraint(equalTo: title3.trailingAnchor, constant: 50).isActive = true
        
        switch1.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        switch2.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        switch3.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        switch1.centerYAnchor.constraint(equalTo: title1.centerYAnchor).isActive = true
        switch2.centerYAnchor.constraint(equalTo: title2.centerYAnchor).isActive = true
        switch3.centerYAnchor.constraint(equalTo: title3.centerYAnchor).isActive = true
        
        switch1.heightAnchor.constraint(equalToConstant: 50).isActive = true
        switch2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        switch3.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        switch1.addTarget(self, action: #selector(onClickSwitch(_:)), for: .valueChanged)
        switch2.addTarget(self, action: #selector(onClickSwitch(_:)), for: .valueChanged)
        switch3.addTarget(self, action: #selector(onClickSwitch(_:)), for: .valueChanged)
    }

    /// invalid mode 'kCFRunLoopCommonModes' provided to CFRunLoopRunSpecific - break on _CFRunLoopError_RunCalledWithInvalidMode to debug. This message will only appear once per execution. <<< ignore the message
    
    @objc func onClickSwitch(_ sender: UISwitch) {
        
        
        
        if sender.isOn {
            print("ON")
            
            
            if HKHealthStore.isHealthDataAvailable() {
                
                print("available")
                HealthKitManager.shared.authorizeHealthKit { result, error in
                    if result {
                        print("Good to go")
                    } else {
                        print(error?.localizedDescription as Any)
                    }
                }
            } else {
                print("not available")
            }
            
            
            
        } else {
            print("OFF")
        }
    }

}

