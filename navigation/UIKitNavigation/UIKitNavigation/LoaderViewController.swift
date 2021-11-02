//
//  LoaderViewController.swift
//  UIKitNavigation
//
//  Created by Igor Drljic on 2.11.21..
//

import UIKit

class LoaderViewController: UIViewController {
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
        activityIndicator.startAnimating()
    }
        
    func setViews() {
        view.backgroundColor = .systemBlue
        
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.color = .white
    }
    
    func setConstraints() {
        [activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
         activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)]
            .forEach {
                $0.isActive = true
            }
    }
}
