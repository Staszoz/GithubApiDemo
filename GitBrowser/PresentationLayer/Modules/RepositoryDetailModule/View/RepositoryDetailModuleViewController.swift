//
//  RepositoryDetailModuleViewController.swift
//  GitBrowser
//
//  Created Станислав Калиберов on 05.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//
//

import UIKit
import WebKit

class RepositoryDetailModuleViewController: UIViewController {
    
    //MARK: - @IBOutlets
    @IBOutlet weak var webView: WKWebView!
    
    //MARK: - Properties
	var output: RepositoryDetailModuleViewOutput?

    //MARK: - Life cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        
        output?.didLoadView()
    }
    
    //MARK: - IBActions
    @IBAction func didTapClose(_ sender: UIButton) {
        output?.didTapCloseButton()
    }
    
    @IBAction func didGesturePerform(_ sender: UITapGestureRecognizer) {
        output?.didGesturePerform(sender: sender)
    }
}

extension RepositoryDetailModuleViewController: RepositoryDetailModuleViewInput {
    
    func openPage(with url: URL) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func dissmis(with animation: Bool) {
        dismiss(animated: animation, completion: nil)
    }
}
