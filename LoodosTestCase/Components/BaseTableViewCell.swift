//
//  BaseTableViewCell.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 26.03.2022.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    class var reuseIdentifier: String {
        return "\(self)"
    }

    class var nibInstance: UINib {
        return .init(nibName: "\(self)", bundle: nil)
    }

    class var defaultHeight: CGFloat {
        return UITableView.automaticDimension
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

}


extension UITableView {

    func registerCell<T: BaseTableViewCell>(_ instance: T.Type) {
        self.register(instance.nibInstance, forCellReuseIdentifier: instance.reuseIdentifier)
    }

    func generateReusableCell<T: BaseTableViewCell>(_ instance: T.Type, indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: instance.reuseIdentifier, for: indexPath) as! T
    }
}
