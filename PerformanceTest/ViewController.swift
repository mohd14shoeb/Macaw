//
//  ViewController.swift
//  PerformanceTest
//
//  Created by Simon Corsin on 9/6/17.
//  Copyright © 2017 Exyte. All rights reserved.
//

import Cocoa
import AppKit
import Macaw

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func doPerf(_ sender: Any) {
        let url = URL(string: "file:///Users/simoncorsin/Documents/test_0.svg")!
        let content = try! String(contentsOf: url)

        let time = CACurrentMediaTime()

        for _ in 0..<100 {
            let _ = try! SVGParser.parse(text: content)
        }

        print("Done with the parsing in \(CACurrentMediaTime() - time)s")
    }


}

