//
//  PushedDetailViewController.swift
//  SplitView
//
//  Created by Bob Wakefield on 2/15/17.
//  Copyright © 2017 Bob Wakefield. All rights reserved.
//

import UIKit

class PushedDetailViewController: UIViewController {

    @IBOutlet weak var navStackSize: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print( "viewDidLoad \(self.restorationIdentifier!) \(self.navigationController!.viewControllers.count)" )
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear( animated )
        print( "viewDidAppear \(self.restorationIdentifier!) \(self.navigationController!.viewControllers.count)" )
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        print( "viewDidDisappear \(self.restorationIdentifier!)" )
        super.viewDidDisappear( animated )
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear( animated )

        if let navController = self.navigationController {

            let stackCount = navController.viewControllers.count
                
            navStackSize.text = "Nav Stack Size: \(stackCount)"
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
