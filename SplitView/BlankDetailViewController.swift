//
//  BlankDetailViewController.swift
//  SplitView
//
//  Created by Bob Wakefield on 2/16/17.
//  Copyright © 2017 Bob Wakefield. All rights reserved.
//

import UIKit

class BlankDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print( "viewDidLoad \(self.restorationIdentifier!)" )
    }
    
    override func viewDidAppear(_ animated: Bool) {

        super.viewDidAppear( animated )
        print( "viewDidAppear \(self.restorationIdentifier!)" )
    }
    
    override func viewDidDisappear(_ animated: Bool) {

        super.viewDidDisappear( animated )
        print( "viewDidDisappear \(self.restorationIdentifier!)" )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
