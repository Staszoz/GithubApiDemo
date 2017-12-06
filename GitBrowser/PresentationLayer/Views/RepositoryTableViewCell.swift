//
//  RepositoryTableViewCell.swift
//  GitBrowser
//
//  Created by Станислав Калиберов on 03.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import UIKit

final class RepositoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var starsCountLabel: UILabel!
    @IBOutlet weak var isViewedLabel: UILabel!
    
    
    static let reuseId = "RepositoryTableViewCell"
    static let nibName = "RepositoryTableViewCell"
    

    func configure(repositoryViewModel: Repository) {
        titleLabel.text = repositoryViewModel.name
        descriptionLabel.text = repositoryViewModel.description
        starsCountLabel.text = "\(repositoryViewModel.stars)"
        isViewedLabel.isHidden = !repositoryViewModel.isViewed
    }
}
