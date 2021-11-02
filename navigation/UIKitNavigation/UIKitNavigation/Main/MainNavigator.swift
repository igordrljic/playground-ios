//
//  MainNavigator.swift
//  UIKitNavigation
//
//  Created by Igor Drljic on 29.10.21..
//

import UIKit

class MainNavigator {
    let mainViewController = MainViewController()
    
    let searchNavigator = SearchNavigator()
    
    private enum Tabs: Int, CaseIterable {
        case search
        case history
        case settings
        
        var title: String {
            switch self {
            case .search:
                return "Search"
            case .history:
                return "History"
            case .settings:
                return "Settings"
            }
        }
    }
    
    private let tabs: [Tabs] = [.search, .history, .settings]
    
    init() {
        mainViewController.navigationDelegate = self
        setViewControllers()
    }
    
    private func setViewControllers() {
        var viewControllers = [UIViewController]()
        for tab in tabs {
            let viewController = viewController(for: tab)
            viewControllers.append(viewController)
        }
        mainViewController.viewControllers = viewControllers
    }
    
    private func viewController(for tab: Tabs) -> UIViewController {
        let viewController: UIViewController
        switch tab {
        case .search:
            viewController = searchNavigator.searchViewController
        case .history:
            viewController = HistoryViewController()
        case .settings:
            viewController = SettingsViewController()
        }
        viewController.navigationItem.title = tab.title
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem = UITabBarItem(title: tab.title, image: nil, selectedImage: nil)
        return navigationController
    }
}

extension MainNavigator: MainNavigationDelegate {
    func showSearch() {
        setSelected(tab: .search)
    }
    func showHistory() {
        setSelected(tab: .history)
    }
    func showSettings() {
        setSelected(tab: .settings)
    }
    
    private func setSelected(tab: Tabs) {
        mainViewController.selectedIndex = tab.rawValue
    }
}
