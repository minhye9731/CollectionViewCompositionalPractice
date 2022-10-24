//
//  ReusableProtocol.swift
//  CollectionViewCompositionalPractice
//
//  Created by 강민혜 on 10/25/22.
//

import UIKit

private protocol ReusableProtocol: AnyObject {
    static var reuseIdentifier: String { get }
}

extension UIViewController: ReusableProtocol {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: ReusableProtocol {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
