//
//  ViewController.swift
//  ShapesTest
//
//  Created by Marc Vandehey on 8/20/17.
//  Copyright © 2017 SkyVan Labs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBAction func onTriangleClicked(_ sender: Any) {
    containerView.showTriangle()
  }

  @IBAction func onSquareClicked(_ sender: Any) {
    containerView.showSquare()
  }

  @IBAction func onHexagonClicked(_ sender: Any) {
    containerView.showHexagon()
  }

  @IBOutlet weak var containerView: ShapeContainer!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}
