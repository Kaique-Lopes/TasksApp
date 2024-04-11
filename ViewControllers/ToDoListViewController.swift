//
//  ViewController.swift
//  TasksApp
//
//  Created by Kaique Lopes de Oliveira on 16/01/24.
//

import UIKit
import CoreData

class ToDoListViewController: UIViewController {
    
    // MARK: - Buttons
    
    lazy var addNewButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Adicionar Tarefa", for: .normal)
        button.addTarget(self, action: #selector(addNewTaskSender(sender: )), for: .touchUpInside)
        return button
    }()
    
    lazy var getTasksButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Procurar Tarefas", for: .normal)
        button.addTarget(self, action: #selector(getTask(sender: )), for: .touchUpInside)
        return button
    }()
    
    lazy var toggleCompletedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Tarefa Completa", for: .normal)
        button.addTarget(self, action: #selector(markCompleted(sender: )), for: .touchUpInside)
        return button
    }()

    lazy var deleteTasksButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Deletar Tarefas", for: .normal)
        button.addTarget(self, action: #selector(deletedTask(sender: )), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
    }
    
    // MARK: - Action Buttons
    
    @objc
    func addNewTaskSender(sender: UIButton) {
        CoreDataManager.shared.addNewTask(name: "Nova Tarefa", dueOn: Date().addingTimeInterval(100000))
    }
    
    @objc
    func getTask(sender: UIButton) {
        let tasks = CoreDataManager.shared.getAll()
        for task in tasks {
            print("\(task.name ?? "")")
        }
    }
    
    @objc
    func markCompleted(sender: UIButton) {
        let tasks = CoreDataManager.shared.getAll()
        for task in tasks {
            CoreDataManager.shared.toggleCompleted(id: task.id ?? UUID())
        }
        
        for task in tasks {
            print("\(task.name ?? ""): \(task.completed), \(task.completedOn?.formatted(date: .abbreviated, time: .omitted) ?? "")")
        }
    }
    
    @objc
    func deletedTask(sender: UIButton) {
        let tasks = CoreDataManager.shared.getAll()
        for task in tasks {
            CoreDataManager.shared.deleteTask(id: task.id ?? UUID())
        }
        
        let fetchedTasks = CoreDataManager.shared.getAll()
        print("\(fetchedTasks.count)")
        
        for task in tasks {
            print("\(task.name ?? ""): \(task.completed), \(task.completedOn?.formatted(date: .abbreviated, time: .omitted) ?? "")")
        }
    }
}

