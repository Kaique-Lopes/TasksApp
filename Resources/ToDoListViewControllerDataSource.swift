//
//  ToDoListViewControllerDataSource.swift
//  TasksApp
//
//  Created by Kaique Lopes de Oliveira on 19/05/24.
//

import UIKit

extension ToDoListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(by: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    
}
