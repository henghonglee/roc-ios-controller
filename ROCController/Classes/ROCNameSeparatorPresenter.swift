//
//  ROCNameSeparatorPresenter.swift
//  Pods
//
//  Created by Maximilian Alexander on 3/27/17.
//
//

import UIKit
import Chatto

open class ROCNameSeparatorPresenter: ChatItemPresenterProtocol {
    
    let model: ROCNameSeparatorModel
    init (model: ROCNameSeparatorModel) {
        self.model = model
    }
    
    private static let cellReuseIdentifier = ROCNameSeparatorCollectionViewCell.self.description()
    
    public static func registerCells(_ collectionView: UICollectionView) {
        collectionView.register(ROCNameSeparatorCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
    }
    
    public func dequeueCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: ROCNameSeparatorPresenter.cellReuseIdentifier, for: indexPath)
    }
    
    public func configureCell(_ cell: UICollectionViewCell, decorationAttributes: ChatItemDecorationAttributesProtocol?) {
        guard let cell = cell as? ROCNameSeparatorCollectionViewCell else {
            assert(false, "expecting status cell")
            return
        }
      var alignment: NSTextAlignment
      switch model.isIncoming {
      case .incoming, .admin:
        alignment = .left
//      case :
//        alignment = .center
      case .outgoing:
        alignment = .right
      }
        cell.setTextOnLabel(model.name, alignment)
        
    }
    
    open var canCalculateHeightInBackground: Bool {
        return true
    }
    
    open func heightForCell(maximumWidth width: CGFloat, decorationAttributes: ChatItemDecorationAttributesProtocol?) -> CGFloat {
        return 24
    }
}
