//
//  ViewController.swift
//  TasksApp
//
//  Created by Kaique Lopes de Oliveira on 16/01/24.
//

import UIKit
import CoreData


class ToDoListViewController: UIViewController {
    
    var viewModel = TaskListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        title = "Minhas Tarefas"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTask))
    }
    
    @objc
    func addNewTask() {
        navigationController?.pushViewController(AddNewTaskViewController(), animated: true)
    }
}
/*
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
        view.backgroundColor = UIColor.blue
        title = "Kaique"
        addViews()
        configConstraints()
    }
    
    // MARK: - UI Configuration
    
    func addViews() {
        [addNewButton, getTasksButton, toggleCompletedButton, deleteTasksButton].forEach { control in
            view.addSubview(control)
        }
    }
    
    func configConstraints() {
        NSLayoutConstraint.activate([
            addNewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            addNewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            addNewButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            
            getTasksButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            getTasksButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            getTasksButton.topAnchor.constraint(equalTo: addNewButton.bottomAnchor, constant: 8),
            
            toggleCompletedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            toggleCompletedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            toggleCompletedButton.topAnchor.constraint(equalTo: getTasksButton.bottomAnchor, constant: 8),
            
            deleteTasksButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            deleteTasksButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            deleteTasksButton.topAnchor.constraint(equalTo: toggleCompletedButton.bottomAnchor, constant: 8),

            

        ])
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
*/
