//
//  ROCDecorator.swift
//  Pods
//
//  Created by Maximilian Alexander on 3/17/17.
//
//

import Foundation
import Chatto
import ChattoAdditions

final class ROCDecorator: ChatItemsDecoratorProtocol {
    struct Constants {
        static let shortSeparation: CGFloat = 3
        static let normalSeparation: CGFloat = 10
        static let timeIntervalThresholdToIncreaseSeparation: TimeInterval = 120
    }
    
    func decorateItems(_ chatItems: [ChatItemProtocol]) -> [DecoratedChatItem] {
        var decoratedChatItems = [DecoratedChatItem]()
        let calendar = Calendar.current
        
        for (index, chatItem) in chatItems.enumerated() {
            let next: ChatItemProtocol? = (index + 1 < chatItems.count) ? chatItems[index + 1] : nil
            let prev: ChatItemProtocol? = (index > 0) ? chatItems[index - 1] : nil
            
            let bottomMargin = self.separationAfterItem(chatItem, next: next)
            var showsTail = false
            let additionalItems =  [DecoratedChatItem]()
            
            var addTimeSeparator = false
            var addNameSeparator = false
            
            var nameSeparator: DecoratedChatItem? = nil
            
            if let currentMessage = chatItem as? MessageModelProtocol {
                if let nextMessage = next as? MessageModelProtocol {
                    showsTail = currentMessage.senderId != nextMessage.senderId
                } else {
                    showsTail = true
                }
                
                addNameSeparator = showsTail
                
                if let previousMessage = prev as? MessageModelProtocol {
                    addTimeSeparator = !calendar.isDate(currentMessage.date, inSameDayAs: previousMessage.date)
                    addNameSeparator = currentMessage.senderId != previousMessage.senderId
                } else {
                    addTimeSeparator = true
                    addNameSeparator = false
                }
            
                
                if addTimeSeparator {
                    let dateTimeStamp = DecoratedChatItem(chatItem: ROCTimeSeparatorModel(uid: "\(currentMessage.uid)-time-separator", date: currentMessage.date.toWeekDayAndDateString()), decorationAttributes: nil)
                    decoratedChatItems.append(dateTimeStamp)
                }
                
                if addNameSeparator {
                  let rocMessageModel = chatItem as! ROCTextMessageModel
                  let name = rocMessageModel._messageModel.userDisplayName
                    let nameSeparatorModel = ROCNameSeparatorModel(uId: "\(currentMessage.uid)-name-seperator", name: name, isIncoming: currentMessage.isIncoming)
                    nameSeparator = DecoratedChatItem(chatItem: nameSeparatorModel, decorationAttributes: nil)
                }
            }
            
            if let nameSeparator = nameSeparator {
                decoratedChatItems.append(nameSeparator)
            }

          let base = BaseMessageDecorationAttributes(canShowFailedIcon: false, isShowingTail: showsTail, isShowingAvatar: showsTail, isShowingSelectionIndicator: false, isSelected: false)
            decoratedChatItems.append(DecoratedChatItem(
                chatItem: chatItem,
                decorationAttributes: ChatItemDecorationAttributes(bottomMargin:  bottomMargin,
                                                                   messageDecorationAttributes: base)))
            decoratedChatItems.append(contentsOf: additionalItems)
            
            
        }
        
        return decoratedChatItems
    }
    
    func separationAfterItem(_ current: ChatItemProtocol?, next: ChatItemProtocol?) -> CGFloat {
        guard let nexItem = next else { return 0 }
        guard let currentMessage = current as? MessageModelProtocol else { return Constants.normalSeparation }
        guard let nextMessage = nexItem as? MessageModelProtocol else { return Constants.normalSeparation }
        
        if currentMessage.senderId != nextMessage.senderId {
            return Constants.normalSeparation
        } else if nextMessage.date.timeIntervalSince(currentMessage.date) > Constants.timeIntervalThresholdToIncreaseSeparation {
            return Constants.normalSeparation
        } else {
            return Constants.shortSeparation
        }
    }
    
}
