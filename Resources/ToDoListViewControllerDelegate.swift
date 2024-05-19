//
//  ToDoListViewControllerDelegate.swift
//  TasksApp
//
//  Created by Kaique Lopes de Oliveira on 19/05/24.
//

import UIKit

extension ToDoListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let task = viewModel.task(by: indexPath.row)
        
        let completeAction = UIContextualAction(style: .normal, title: task.completed ? "Nao completa" : "Completa") { [weak self] (action, view, completionHandler) in
            self?.completeTask(at: indexPath)
            completionHandler(true)
        }
        completeAction.backgroundColor = task.completed ? UIColor.systemRed : UIColor.systemGreen
        let configuration = UISwipeActionsConfiguration(actions: [completeAction])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }
    
    func completeTask(at indexPath: IndexPath) {
        let task = viewModel.task(by: indexPath.row)
        viewModel.toggleCompleted(task: task)
        
        if task.completed {
            celebrationView.isHidden = false
            celebrationView.play { finished in
                self.celebrationView.isHidden = finished
            }
        }
        
        tableview.reloadRows(at: [indexPath], with: .automatic)
        tableview.reloadRows(at: [IndexPath.SubSequence(row: 0, section: 0)], with: .automatic)
    }
}
