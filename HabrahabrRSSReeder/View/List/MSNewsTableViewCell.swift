//
//  MSNewsTableViewCell.swift
//  HabrahabrRSSReeder
//
//  Created by Yury Radchenko on 30.10.2017.
//  Copyright © 2017 iPachenko. All rights reserved.
//

import UIKit

final class MSNewsTableViewCell: UITableViewCell, CellDequeueReusable {
    
    @IBOutlet weak var titleNews: UILabel! {
        didSet {
            titleNews.numberOfLines = 0
            titleNews.font = UIFont.systemFont(ofSize: 14)
        }
    }
    
    static let rowHeight = CellSettings.rowHeightStandard
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(news: MSNews) {
        self.titleNews.text = news.title
    }
}

