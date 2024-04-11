//
//  AddNewTaskViewController.swift
//  TasksApp
//
//  Created by Kaique Lopes de Oliveira on 11/04/24.
//

import UIKit

class AddNewTaskViewController: UIViewController {

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
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
