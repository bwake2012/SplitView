//
//  DetailViewController.swift
//  SplitView
//
//  Created by Bob Wakefield on 1/16/17.
//  Copyright © 2017 Bob Wakefield. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    static let dateTimeFormatter: DateFormatter = {
    
        var formatter = DateFormatter()
        
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
    
        return formatter
    }()
    
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var navStackSize: UILabel!
    
    var detailItem: Date?

    override func viewDidLoad() {

        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        if let detailItem = self.detailItem {
        
            let detailText = DetailViewController.dateTimeFormatter.string( from: detailItem )
            detailLabel.text = detailText
            
            if let stackCount = self.navigationController?.viewControllers.count {
                navStackSize.text = "Nav Stack Size: \(stackCount)"
            }
        }

        print( "viewDidLoad \(self.restorationIdentifier!) \(self.navigationController!.viewControllers.count)" )
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear( animated )
        print( "viewDidAppear \(self.restorationIdentifier!) \(self.navigationController!.viewControllers.count)" )
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidDisappear( animated )
        print( "viewDidDisappear \(self.restorationIdentifier!) \(self.navigationController!.viewControllers.count)" )
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

