//
//  TabBarViewController.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 25/01/25.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		UITabBar.appearance().barTintColor = .systemBackground
		tabBar.tintColor = .label
		//setupVCs()
        rootTabSetup()
        self.delegate = self
        self.mode = .tabSidebar
	}
    
    private func rootTabSetup(){
        self.tabs = [
           UITab(title: "Bag",
                 image: UIImage(systemName: "bag"),
                 
                 identifier: "First Tab") { _ in
                     // Return the view controller that the tab displays.
                     ViewController1()
                 },
           
           UITab(title: "Products",
                 image: UIImage(systemName: "macbook.and.iphone"),
                 
                 identifier: "Second Tab") { _ in
                     // Return the view controller that the tab displays.
                     ViewController2()
                 },
           
           UITab(title: "Go Further",
                 image: UIImage(systemName: "safari"),
                 identifier: "Third Tab") { _ in
                     // Return the view controller that the tab displays.
                     ViewController3()
                 },
           UISearchTab { _ in
               // Return the view controller that the tab displays.
               UINavigationController(
                   rootViewController: SearchViewController()
               )
           }

        ]
        for tab in tabs {
            //tab.preferredPlacement = .movable
            tab.preferredPlacement = .fixed
        }
        
        //tabs.append(contentsOf: makeSections())
    }
}

class SearchViewController: UIViewController, UISearchResultsUpdating {

    private var searchController: UISearchController!
    var originalData = ["Apple", "Banana", "Cherry", "Date", "Elderberry"]
    var filteredData = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        filteredData = originalData // Initially show all data
    }

    private func setupSearchController() {
        searchController = UISearchController(searchResultsController: nil) // Or a dedicated results controller
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "What are you looking for?"
        navigationItem.searchController = searchController
        definesPresentationContext = true // Important for correct presentation behavior
        setupDictationButton()
    }

    // MARK: - UISearchResultsUpdating

    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            filteredData = originalData.filter { $0.lowercased().contains(searchText.lowercased()) }
        } else {
            filteredData = originalData
        }
        // Reload your table view or collection view here
        // e.g., myTableView.reloadData()
    }
    
    func setupDictationButton() {
        searchController.searchBar.showsBookmarkButton = true
        searchController.searchBar.setImage(UIImage(systemName: "mic.fill"), for: .bookmark, state: .normal)
       }
    
    
    @objc func dictationButtonTapped() {
        print("Dictation button tapped!")
    }
}
