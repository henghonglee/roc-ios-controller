//
//  ROCTextMessageViewModelBuilder.swift
//  Pods
//
//  Created by Maximilian Alexander on 3/17/17.
//
//

import Foundation
import ChattoAdditions

public class ROCTextMessageViewModelBuilder: ViewModelBuilderProtocol {
    public init() {}
    
    let messageViewModelBuilder = MessageViewModelDefaultBuilder()
    
    public func createViewModel(_ textMessage: ROCTextMessageModel) -> ROCTextMessageViewModel {
        let messageViewModel = self.messageViewModelBuilder.createMessageViewModel(textMessage)
        let textMessageViewModel = ROCTextMessageViewModel(textMessage: textMessage, messageViewModel: messageViewModel)
        return textMessageViewModel
    }
    
    public func canCreateViewModel(fromModel model: Any) -> Bool {
        return model is ROCTextMessageModel
    }
    
}
