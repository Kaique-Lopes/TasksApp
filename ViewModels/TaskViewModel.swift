//
//  TaskViewModel.swift
//  TasksApp
//
//  Created by Kaique Lopes de Oliveira on 16/01/24.
//

import Foundation

// MARK: - TaskViewModel : Estrutura de visualizacao de dados

struct TaskViewModel {
    private var task: Task
    
    init(task: Task) {
        self.task = task
    }
    
    var id: UUID {
        task.id ?? UUID()
    }
    
    var name: String {
        task.name ?? ""
    }
    
    var dueOn: Date {
        task.dueOn ?? Date()
    }
    
    var completedOn: Date? {
        task.completedOn ?? Date()
    }
    
    var completed: Bool {
        task.completed
    }
}
