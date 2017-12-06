//
//  RepositorySearchModuleViewController.swift
//  GitBrowser
//
//  Created Станислав Калиберов on 04.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//
//

import UIKit

private let kTitleIconName = "GitHub_Logo"

class RepositorySearchModuleViewController: UIViewController {
    
    //MARK: - @IBOutlets
    @IBOutlet weak var searchTextField: UITextField!
    
    
    //MARK: - Properties
	var output: RepositorySearchModuleViewOutput?

    //MARK: - Life cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavigationBar()
    }
    
    //MARK: - IBActions
    @IBAction func didTapSearch(_ sender: UIButton) {
        output?.didTapSearch(text: searchTextField.text)
    }
    
    @IBAction func didTapShowHistory(_ sender: UIButton) {
        output?.didTapShowHistory()
    }
}

extension RepositorySearchModuleViewController: RepositorySearchModuleViewInput {
    
    func configureNavigationBar() {
        let imageView = UIImageView(image:UIImage(named: kTitleIconName))
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    }
}
