//
//  MSNewsDetailTableViewController.swift
//  HabrahabrRSSReeder
//
//  Created by Yury Radchenko on 30.10.2017.
//  Copyright © 2017 iPachenko. All rights reserved.
//

import UIKit

final class MSNewsDetailTableViewController: UITableViewController {
    
    var news: MSNews?
    fileprivate let dataTypes = DetailTableModel.allValues
    
    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorStyle = .none
        self.tableView.contentInset = TableSettings.contentInset
        
        self.tableView.estimatedRowHeight = CellSettings.rowHeightStandard
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.title = "News"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.news != nil) ? self.dataTypes.count : 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataType = self.dataTypes[indexPath.row]
        let cell = MSHeaderTableViewCell.cell(table: tableView, indexPath: indexPath)
        cell.configure(news: self.news, cellType: dataType)
        return cell
    }
}

// MARK: - RYStoryboardInstanceable -
extension MSNewsDetailTableViewController: StoryboardInstanceable {
    internal static var storyboardName: StoryboardName = .main
}
