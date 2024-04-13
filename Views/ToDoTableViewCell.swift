//
//  ToDoTableViewCell.swift
//  TasksApp
//
//  Created by Kaique Lopes de Oliveira on 12/04/24.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    lazy var taskNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()

    lazy var dueOrCompleteLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var completeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    // MARK: - UI Configs
    
    func setupViews() {
        selectionStyle = .none
        [taskNameLabel, dueOrCompleteLabel, completeLabel].forEach { views in
            contentView.addSubview(views)
        }
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            taskNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            taskNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            taskNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            dueOrCompleteLabel.topAnchor.constraint(equalTo: taskNameLabel.bottomAnchor, constant: 8),
            dueOrCompleteLabel.leadingAnchor.constraint(equalTo: taskNameLabel.leadingAnchor),
            dueOrCompleteLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            completeLabel.topAnchor.constraint(equalTo: taskNameLabel.bottomAnchor, constant: 16),
            completeLabel.trailingAnchor.constraint(equalTo: taskNameLabel.trailingAnchor),
            completeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            contentView.bottomAnchor.constraint(equalTo: taskNameLabel.bottomAnchor, constant: 8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with task: TaskViewModel) {
        let attributedString = NSMutableAttributedString(string: task.name)
        
        if task.completed {
            attributedString.addAttribute(NSAttributedString.Key .strikethroughStyle, value:  NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributedString.length))
            taskNameLabel.font = UIFont.systemFont(ofSize: 16)
        } else {
            taskNameLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        }
        
        taskNameLabel.attributedText = attributedString
        
        dueOrCompleteLabel.text = task.completed ? "Tarefa Completa \(task.completedOn?.formatted(date: .abbreviated, time: .omitted))" :
        "Vencem em: \(task.dueOn.formatted(date: .abbreviated, time: .omitted))"
        
        completeLabel.text = task.completed ? "Tarefa Completa" : "Tarefa Incompleta"
        completeLabel.textColor = task.completed ? .green : .red
    }
}
