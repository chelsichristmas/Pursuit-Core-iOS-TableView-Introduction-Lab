//
//  ViewController.swift
//  TableViewIntroductionLab
//
//  Created by Benjamin Stone on 8/6/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    var tasks = [[Task]]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }

    
    func loadData() {
        tasks = Task.statusSections()
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks[section].count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell (withIdentifier: "taskCell", for: indexPath)
        
        
        let task = tasks[indexPath.section][indexPath.row]
        
        cell.textLabel?.text = task.name
        cell.detailTextLabel?.text = task.dueDate.description(with: .current)
        return cell
    }
    
   func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      
    return tasks[section].first?.status.rawValue
      }
    
}
