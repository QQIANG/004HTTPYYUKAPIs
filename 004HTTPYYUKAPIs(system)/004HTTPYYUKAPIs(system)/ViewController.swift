//
//  ViewController.swift
//  004HTTPYYUKAPIs(system)
//
//  Created by JNYJ on 14-11-13.
//  Copyright (c) 2014年 JNYJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
        //
        DemoBiz.sharedDemoBiz().getData();
        //
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

