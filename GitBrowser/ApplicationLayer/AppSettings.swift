//
//  AppSettings.swift
//  GitBrowser
//
//  Created by Станислав Калиберов on 06.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import UIKit

public struct AppSettings {
    
    // MARK: - Private initializer
    private init() {}
    
    // MARK: - Setup Appearance
    static func setupAppearance() {
        UINavigationBar.appearance().largeTitleTextAttributes = [
            NSAttributedStringKey.foregroundColor: UIColor.black
        ]
        UINavigationBar.appearance().prefersLargeTitles = true
        UINavigationBar.appearance().tintColor = .white
    }
}
