//
//  BaseChatMessage.swift
//  Pods
//
//  Created by Maximilian Alexander on 3/17/17.
//
//

import Foundation
import RealmSwift
import Chatto
import ChattoAdditions

open class ROCChatMessage: Object {
    
    @objc public dynamic var chatMessageId: String = UUID().uuidString
    @objc public dynamic var timestamp: Date = Date()
    @objc public dynamic var userId: String = UUID().uuidString
    @objc public dynamic var userDisplayName: String = ""
    
    @objc public dynamic var text: String = ""
    @objc public dynamic var mimeType: String = "text/plain"
    
    /**
     * You can store JSON or any blob data here.
     */
    @objc public dynamic var binaryData: NSData? = nil
    
    override open static func primaryKey() -> String? {
        return "chatMessageId"
    }
    
    override open static func indexedProperties() -> [String] {
        return ["timestamp"]
    }
    
}

extension ROCChatMessage: ROCMessageModelProtocol {
    
    public var uid: String {
        return chatMessageId
    }
    
    public var type: ChatItemType {
        return mimeType
    }
    
    public var date: Date {
        return timestamp as Date
    }
    
    public var senderId: String {
        return userId
    }
    
    @objc open var isIncoming : DeliveryDirection {
        return .incoming
    }
    
    public var status: MessageStatus {
        return .success
    }
    
}
