//
//  ROCDataSource.swift
//  Pods
//
//  Created by Maximilian Alexander on 3/17/17.
//
//

import Foundation
import Chatto
import Realm
import RealmSwift

open class ROCDataSource<T: ROCChatMessage>: ChatDataSourceProtocol {
    
    open var chatItems: [ChatItemProtocol] =  []
    open var hasMorePrevious: Bool = false
    open var hasMoreNext: Bool = false
    open var delegate: ChatDataSourceDelegateProtocol?
    open func loadNext() {
        
    }
    open func loadPrevious() {
        
    }
    open func adjustNumberOfMessages(preferredMaxCount: Int?, focusPosition: Double, completion: ((Bool)) -> Void) {
    }
    
    
    open var _token: NotificationToken?
    public var results: Results<T> {
        return _results
    }
    private var _results: Results<T>
    
    public init(results: Results<T>){
        self._results = results
    }
    
    open func observe(){
      self._token?.invalidate()
      self.delegate?.chatDataSourceDidUpdate(self, updateType: .reload)
      self._token = self._results.observe({ [weak self] (changes) in
        guard let `self` = self else { return }
        var chatItems = [ChatItemProtocol]()
        for r in self.results {
            let copy = T(value: r, schema: RLMSchema.partialShared())
            let mutableAttrString = NSMutableAttributedString(string: copy.text)
            let textMessageModel = ROCTextMessageModel(messageModel: copy, text: mutableAttrString)
            chatItems.append(textMessageModel)
        }
        self.chatItems = chatItems
        self.delegate?.chatDataSourceDidUpdate(self)
      })
    }
    
    public func reload(){
        self.delegate?.chatDataSourceDidUpdate(self, updateType: .reload)
    }
    
    public func stop(){
      _token?.invalidate()
    }
    
    deinit {
        _token?.invalidate()
    }
}
