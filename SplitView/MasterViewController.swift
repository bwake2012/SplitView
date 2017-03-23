//
//  MasterViewController.swift
//  SplitView
//
//  Created by Bob Wakefield on 1/15/17.
//  Copyright © 2017 Bob Wakefield. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

    fileprivate var collapseDetailViewController = true

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        if let splitViewController = splitViewController {

            splitViewController.delegate = self
        }
        
        self.transitioningDelegate = nil

        print( "viewDidLoad \(self.restorationIdentifier!)" )
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear( animated )
        print( "viewDidAppear \(self.restorationIdentifier!) \(self.view.frame)" )
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear( animated )
        print( "viewDidDisappear \(self.restorationIdentifier!)" )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare( for segue: UIStoryboardSegue, sender: Any? ) {

        var viewController: DetailViewController?
        
        if let navController = segue.destination as? UINavigationController  {
            
            viewController = navController.topViewController as? DetailViewController
        }
        
        if nil == viewController {
            
            viewController = segue.destination as? DetailViewController
        }

        if let viewController = viewController {
            
            collapseDetailViewController = false
            
            // Manage the display mode button
            if let splitViewController = splitViewController {
                viewController.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
            }
            viewController.navigationItem.leftItemsSupplementBackButton = true
            
            // Configure the secondary view controller
            viewController.detailItem = Date()
        }
    }
}

extension MasterViewController: UISplitViewControllerDelegate {
    
    func splitViewController(
            _ splitViewController: UISplitViewController,
            collapseSecondary secondaryViewController: UIViewController,
            onto primaryViewController: UIViewController
        ) -> Bool {
        
        return collapseDetailViewController
    }
    
}

