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
    let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Tasks")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Error inexperado \(error), \(error.userInfo) ")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                print("Error ao salvar \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func getAll() -> [Task] {
        var tasks = [Task]()
        
        let sortByDueDate = NSSortDescriptor(key: "dueOn", ascending: true)
        fetchRequest.sortDescriptors = [sortByDueDate]
        
        do {
            tasks = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        
        return tasks
     }
    
    func addNewTask(name: String, dueOn: Date) {
        let task = Task(context: context)
        task.name = name
        task.dueOn = dueOn
        
        task.id = UUID()
        task.completed = false
        task.completedOn = dueOn.advanced(by: 10000)
        
        saveContext()
    }
    
    func toggleCompleted(id: UUID) {
        let predicated = NSPredicate(format: "id=%@", id.uuidString)
        
        do {
            if let fetchedTask = try context.fetch(fetchRequest).first(where: {$0.id == id}) {
                fetchedTask.completed = !fetchedTask.completed
                if fetchedTask.completed {
                    fetchedTask.completedOn = Date()
                }
            }
            saveContext()
        } catch let error as NSError {
            print("Erorr toggle state: \(error.userInfo), \(error.localizedDescription)")
        }
    }
}
