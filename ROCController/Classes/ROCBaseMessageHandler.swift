//
//  ROCBaseMessageHandler.swift
//  Pods
//
//  Created by Maximilian Alexander on 3/17/17.
//
//

import Foundation
import Chatto
import ChattoAdditions

open class ROCBaseMessageHandler: BaseMessageInteractionHandlerProtocol {

  public init() {
  }
  
  open func userDidTapOnFailIcon(viewModel: ROCMessageViewModelProtocol) {

  }

  open func userDidTapOnAvatar(viewModel: ROCMessageViewModelProtocol) {
  }

  open func userDidTapOnBubble(viewModel: ROCMessageViewModelProtocol) {

  }

  open func userDidBeginLongPressOnBubble(viewModel: ROCMessageViewModelProtocol) {

  }

  open func userDidEndLongPressOnBubble(viewModel: ROCMessageViewModelProtocol) {

  }
  open func userDidTapOnURL(_ url: URL) -> Bool {
    return true
  }

  open func userDidTapOnFailIcon(viewModel: ROCMessageViewModelProtocol, failIconView: UIView) {

  }

  open func userDidSelectMessage(viewModel: ROCMessageViewModelProtocol) {

  }

  open func userDidDeselectMessage(viewModel: ROCMessageViewModelProtocol) {

  }
}
