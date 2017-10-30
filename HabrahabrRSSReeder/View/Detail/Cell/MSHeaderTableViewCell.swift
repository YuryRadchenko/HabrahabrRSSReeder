//
//  MSHeaderTableViewCell.swift
//  HabrahabrRSSReeder
//
//  Created by Yury Radchenko on 30.10.2017.
//  Copyright © 2017 iPachenko. All rights reserved.
//

import UIKit

final class MSHeaderTableViewCell: UITableViewCell, CellDequeueReusable {
    
    @IBOutlet weak var headerLabel: UILabel! {
        didSet {
            headerLabel.numberOfLines = 0
            headerLabel.text = ""
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setSelectionNone()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(news: MSNews?, cellType: DetailTableModel) {
        
        switch cellType {
            
        case .rowTitle:
            self.headerLabel.text = news?.title
            self.headerLabel.textColor = .black
            self.headerLabel.font = UIFont.systemFont(ofSize: 17)
            
        case .rowDate:
            self.headerLabel.text = news?.pudDateFormatted
            self.headerLabel.textColor = .gray
            self.headerLabel.font = UIFont.standard
            
        case .rowContent:
            self.headerLabel.text = news?.contentString
            self.headerLabel.textColor = .black
            self.headerLabel.font = UIFont.standard
        }
    }
}

