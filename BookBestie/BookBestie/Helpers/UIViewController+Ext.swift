//
//  UIViewController+Ext.swift
//  BookBestie
//
//  Created by Laura Gongaware on 8/2/22.
//

import Foundation
import UIKit

extension UIViewController {
    func presentErrorToUser(localizedError: LocalizedError) {
        let alertController = UIAlertController(title: "ERROR", message: localizedError.errorDescription, preferredStyle: .actionSheet)
        let dismissAction = UIAlertAction(title: "Dismiss", style: .default)
        alertController.addAction(dismissAction)
        self.present(alertController, animated: true)
    }
}
