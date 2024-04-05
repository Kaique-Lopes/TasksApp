//
//  CoreDataManager.swift
//  TasksApp
//
//  Created by Kaique Lopes de Oliveira on 05/04/24.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Tasks")
        return container
    }()
}
