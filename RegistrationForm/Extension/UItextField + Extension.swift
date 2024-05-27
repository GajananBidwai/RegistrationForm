//
//  UItextField + Extension.swift
//  RegistrationForm
//
//  Created by Neosoft on 27/05/24.
//

import Foundation
import UIKit

extension UITextField {
    func addPaddingToTheTextField() {
        let paddingView : UIView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        self.leftView = paddingView
        self.leftViewMode = .always
        paddingView.backgroundColor = .green
    }
}

extension UITextField {
    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame:
                  CGRect(x: 10, y: 7, width: 25, height: 25))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
                  CGRect(x: 20, y: 0, width: 40, height: 40))
        iconContainerView.addSubview(iconView)

        leftView = iconContainerView
        leftViewMode = .always
    }
}
