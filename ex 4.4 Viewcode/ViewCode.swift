//
//  ViewCode.swift
//  ex 4.4 Viewcode
//
//  Created by jeovane.barbosa on 21/12/22.
//

import Foundation

protocol Viewcode {
    
    func setupView()
    
    func buildHierarchy()
    
    func setupConstraints()
    
    func applyAdditionalChanges()
}

extension Viewcode {
    
    func setupView() {
        buildHierarchy()
        setupConstraints()
        applyAdditionalChanges()
    }
}
