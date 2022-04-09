//
//  LocalStorage.swift
//  Bank App
//
//  Created by Alexandr Gerasimov on 09.04.2022.
//

import Foundation

public class LocalStorage {
    
    private enum Keys: String {
         // equal case hasOnboarder = "hasOnboarded"
        case hasOnboarded
    }
    public static var hasOnboarded: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.hasOnboarded.rawValue)
        }
        set(newValue){
            UserDefaults.standard.set(newValue, forKey: Keys.hasOnboarded.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
}
