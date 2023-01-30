//
//  ViewController.swift
//  FurnitureAR
//
//  Created by sameeramjad.
//  Copyright © 2022 sameeramjad. All rights reserved.
//
//

import UIKit

class AppNavController: UINavigationController, HalfModalPresentable {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return isHalfModalMaximized() ? .default : .lightContent
    }
}
