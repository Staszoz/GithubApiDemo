//
//  RepositorySearchViewController.swift
//  GitBrowser
//
//  Created by Станислав Калиберов on 02.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import UIKit

class RepositorySearchViewController: UIViewController {
    
    //MARK: - @IBOutlets
    @IBOutlet weak var searchTextField: UITextField!
    
    
    //MARK: - Properties
    var presenter: RepositorySearchViewOutput?
    
    
    //MARK: - IBActions
    @IBAction func didTapSearch(_ sender: UIButton) {
        presenter?.didTapSearch(text: searchTextField.text)
    }
    
    @IBAction func didTapShowHistory(_ sender: UIButton) {
        presenter?.didTapShowHistory()
    }
    
}

extension RepositorySearchViewController: RepositorySearchViewInput {
}


