//
//  ROCTextMessageHandler.swift
//  Pods
//
//  Created by Maximilian Alexander on 3/17/17.
//
//

import Foundation
import ChattoAdditions


public class ROCTextMessageHandler: BaseMessageInteractionHandlerProtocol {

  public func userDidSelectMessage(viewModel: ROCTextMessageViewModel) {
    // no-op
  }

  public func userDidDeselectMessage(viewModel: ROCTextMessageViewModel) {
    // no-op
  }

  private let baseHandler: ROCBaseMessageHandler
  public init (baseHandler: ROCBaseMessageHandler) {
      self.baseHandler = baseHandler
  }
  
  public func userDidTapOnFailIcon(viewModel: ROCTextMessageViewModel, failIconView: UIView) {
      self.baseHandler.userDidTapOnFailIcon(viewModel: viewModel)
  }
  
  public func userDidTapOnAvatar(viewModel: ROCTextMessageViewModel) {
      self.baseHandler.userDidTapOnAvatar(viewModel: viewModel)
  }
  
  public func userDidTapOnBubble(viewModel: ROCTextMessageViewModel) {
      self.baseHandler.userDidTapOnBubble(viewModel: viewModel)
  }
  
  public func userDidBeginLongPressOnBubble(viewModel: ROCTextMessageViewModel) {
      self.baseHandler.userDidBeginLongPressOnBubble(viewModel: viewModel)
  }
  
  public func userDidEndLongPressOnBubble(viewModel: ROCTextMessageViewModel) {
      self.baseHandler.userDidEndLongPressOnBubble(viewModel: viewModel)
  }

  public func userDidTapOnURL(_ url: URL) -> Bool {
    return self.baseHandler.userDidTapOnURL(url)
  }
}
