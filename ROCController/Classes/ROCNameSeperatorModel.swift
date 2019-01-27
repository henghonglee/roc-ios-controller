//
//  ROCNameSeperatorModel.swift
//  Pods
//
//  Created by Maximilian Alexander on 3/27/17.
//
//

import UIKit
import Chatto
import ChattoAdditions

open class ROCNameSeparatorModel: ChatItemProtocol {
    
    public let uid: String
    public let type: String = ROCNameSeparatorModel.chatItemType
    public let name: String
    public let isIncoming: DeliveryDirection
    
    public static var chatItemType: ChatItemType {
        return "ROCNameSeparatorModel"
    }
    
    public init(uId: String, name: String, isIncoming: DeliveryDirection) {
        self.uid = uId
        self.name = name
        self.isIncoming = isIncoming
    }
}
