//
//  extensionTabBarViewController.swift
//  SampleAppSwiftFM
//
//  Created by ephrim.daniel on 07/08/25.
//

import UIKit


extension TabBarViewController {
    
    func makeSections() -> [UITabGroup] {
        var groups = [UITabGroup]()
        
        let sections = ["Section 1"]
        for sections in sections {
            let group = UITabGroup(title: sections, image: nil, identifier: sections)
            if let children = makeSectionTabs() {
                group.children = children
            }
            let navigationController = UINavigationController()
            navigationController.navigationBar.prefersLargeTitles = true
            group.managingNavigationController = navigationController
            group.preferredPlacement = .sidebarOnly
            groups.append(group)
        }
        return groups
    }
    
    func makeSectionTabs() -> [UITab]? {
        var sectionTabs = [UITab]()
        let sections = ["Option1", "Option2", "Option3"]
        
        for section in sections {
            let tab = UITab(
                title: section,
                image: UIImage(systemName: "list.bullet"),
                identifier: section
            ) { [self] tab in
                getOptionViewController(tab: tab)
            }
            tab.preferredPlacement = .sidebarOnly
            sectionTabs.append(tab)
        }
        return sectionTabs
    }
    
    func getOptionViewController(tab: UITab) -> UIViewController {
        switch tab.title {
        case "Option1":
            OptionVC1()
        case "Option2":
            OptionVC2()
        case "Option3":
            OptionVC3()
        default:
            DefaultVC()
        }
    }
    
    private func setupTabBarAppearance() {
        let standardTabBarAppearance = self.tabBar.standardAppearance
        
        let tabBarItemAppearance = UITabBarItemAppearance()
        tabBarItemAppearance.normal.badgeBackgroundColor = .systemBlue
        tabBarItemAppearance.normal.badgePositionAdjustment.horizontal = 5
        
        let attribute: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white]
        tabBarItemAppearance.normal.badgeTextAttributes = attribute
        
        standardTabBarAppearance.stackedLayoutAppearance = tabBarItemAppearance
        standardTabBarAppearance.inlineLayoutAppearance = tabBarItemAppearance
        standardTabBarAppearance.compactInlineLayoutAppearance = tabBarItemAppearance
        
        self.tabBar.standardAppearance = standardTabBarAppearance
    }
}


class OptionVC1: UIViewController {
    override func viewDidLoad() {
    }
}

class OptionVC2: UIViewController {
    override func viewDidLoad() {
    }
}

class OptionVC3: UIViewController {
    override func viewDidLoad() {
    }
}

class DefaultVC: UIViewController {
    override func viewDidLoad() {
    }
}
