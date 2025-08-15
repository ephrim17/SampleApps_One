//
//  ClassicTabBarViewController.swift
//  SampleAppSwiftFM
//
//  Created by ephrim.daniel on 07/08/25.
//

import UIKit

class ClassicTabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
        self.delegate = self
    }
    
    func setupVCs () {
        var viewControllers = [UIViewController]()

        let tabDatas = [
            "A":[
                "name" : "Neked ajánljuk",
                "image" : "sparkles.rectangle.stack",
                "vc": ViewController1()
                ],
            "B":[
                "name" : "Termékek",
                "image" : "macbook.and.iphone",
                "vc": ViewController2()
                ],
            "C":[
                "name" : "Hozz ki belőle többet",
                "image" : "safari",
                "vc": ViewController3()
                ],
            "E":[
                "name" : "Keresés",
                "image" : "magnifyingglass",
                "vc": SearchViewController()
                ],
            "D":[
                "name" : "Táska",
                "image" : "bag",
                "vc": ViewController5()
                ]
            ]

        let sortedTabs = tabDatas.sorted(by: { $0.0 < $1.0 })
        for key in sortedTabs {
            let tabItem = key.value
            let vc = createNavController(
                for: tabItem["vc"] as! UIViewController,
                title: NSLocalizedString (tabItem["name"] as! String, comment:""),
                image: UIImage (systemName: tabItem["image"] as! String)!
            )
            viewControllers.append(vc)
        }
        self.viewControllers = viewControllers
    }

    fileprivate func createNavController
                (for rootViewController: UIViewController,
                 title: String,
                 image: UIImage)
                    -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
}


class ViewController1: UIViewController {

    let someImageView: UIImageView = {
       let theImageView = UIImageView()
        theImageView.image = UIImage(systemName: "safari").map { $0.withRenderingMode(.alwaysTemplate) }
        theImageView.tintColor = .label
       theImageView.translatesAutoresizingMaskIntoConstraints = false //You need to call this property so the image is added to your view
       return theImageView
    }()

    override func viewDidLoad() {
       super.viewDidLoad()

       view.addSubview(someImageView) //This add it the view controller without constraints
       someImageViewConstraints() //This function is outside the viewDidLoad function that controls the constraints
    }

    // do not forget the `.isActive = true` after every constraint
    func someImageViewConstraints() {
        someImageView.widthAnchor.constraint(equalToConstant: 180).isActive = true
        someImageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        someImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        someImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 28).isActive = true
    }

}

class ViewController2: UIViewController {
    override func viewDidLoad() {

    }
}

class ViewController3: UIViewController {
    override func viewDidLoad() {
    }
}

class ViewController5: UIViewController {
    override func viewDidLoad() {
    }
}
