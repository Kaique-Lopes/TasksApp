//
//  AddNewTaskViewController.swift
//  TasksApp
//
//  Created by Kaique Lopes de Oliveira on 11/04/24.
//

import UIKit

class AddNewTaskViewController: UIViewController {
    
    let viewModel = AddNewTaskViewModel()
    
    lazy var taskNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Nome Tarefa"
        return label
    }()
    
    lazy var taskNameTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Digite o nome da tarefa"
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    lazy var dueOnLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Data de Vencimento"
        return label
    }()
    
    lazy var dueOnDatePicker: UIDatePicker = {
        let date = UIDatePicker()
        date.translatesAutoresizingMaskIntoConstraints = false
        date.datePickerMode = .date
        date.minimumDate = Date()
        return date
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        view.backgroundColor = .white
        title = "Adicionar Tarefa"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveTask))
        
        [taskNameLabel, taskNameTextField, dueOnLabel, dueOnDatePicker].forEach { views in
            view.addSubview(views)
        }
        
        setupConstraints()
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            taskNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            taskNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            
            taskNameTextField.topAnchor.constraint(equalTo: taskNameLabel.bottomAnchor, constant: 8),
            taskNameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            taskNameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            dueOnLabel.topAnchor.constraint(equalTo: taskNameTextField.bottomAnchor, constant: 8),
            dueOnLabel.leadingAnchor.constraint(equalTo: taskNameTextField.leadingAnchor, constant: 8),
            
            dueOnDatePicker.topAnchor.constraint(equalTo: taskNameTextField.bottomAnchor, constant: 8),
            dueOnDatePicker.trailingAnchor.constraint(equalTo: taskNameTextField.trailingAnchor, constant: 8)
        ])
    }
    
    @objc
    func saveTask() {
        guard let taskname = taskNameTextField.text, !taskname.isEmpty else {
            let alert = UIAlertController(title: "Error", message: "Nome da tarefa Vazia", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        return
        }
        let dueOn = dueOnDatePicker.date
        viewModel.addTask(name: taskname, dueOn: dueOn)
        navigationController?.popViewController(animated: true)
    }
}
