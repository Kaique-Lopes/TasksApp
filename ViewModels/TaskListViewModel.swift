//
//  TaskListViewModel.swift
//  TasksApp
//
//  Created by Kaique Lopes de Oliveira on 04/04/24.
//

import Foundation

class TaskListViewModel {
    var tasks = [TaskViewModel]()
    
    init() {
        getAll()
    }
    
    var numberOfTasks: Int {
        tasks.count
    }
    
    func getAll() {
        tasks = CoreDataManager.shared.getAll().map(TaskViewModel.init)
    }
    
    func numberOfRows(by section: Int) -> Int {
        if section == 0 {
            return 1
        }
        
        return numberOfTasks
    }
    
    func getTasksByType() -> (completed: Int, incomplete: Int) {
        let completeCount = tasks.lazy.filter({ $0.completed}).count
        let incompleteCount = tasks.lazy.filter({!$0.completed}).count
        
        return (completeCount, incompleteCount)
    }
    
    func task(by index: Int) -> TaskViewModel {
        tasks[index]
    }
    
    func toggleCompleted(task: TaskViewModel) {
        CoreDataManager.shared.toggleCompleted(id: task.id)
        getAll()
    }
    
    func deleteItem(task: TaskViewModel) {
        CoreDataManager.shared.deleteTask(id: task.id)
        getAll()
    }
}
