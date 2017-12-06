//
//  String + Extension.swift
//  GitBrowser
//
//  Created by Станислав Калиберов on 06.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import Foundation

extension String {
    
    func truncate(length: Int?, trailing: String = "…") -> String {
        if let _length = length, count > _length {
            return String(prefix(_length)) + trailing
        } else {
            return self
        }
    }
}

