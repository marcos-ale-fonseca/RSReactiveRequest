//
//  ObservableType+SubscribeAndObserveOn.swift
//  medicos
//
//  Created by Renato Massi on 06/08/2018.
//  Copyright © 2018 redspark. All rights reserved.
//

import Foundation
import RxSwift

extension ObservableType {

    public func subscribeAndObserveOn(_ scheduler: ImmediateSchedulerType?) -> Observable<E> {
        guard let scheduler = scheduler else {
            return asObservable()
        }

        return subscribeOn(scheduler)
            .observeOn(scheduler)
    }

}

extension PrimitiveSequenceType where TraitType == SingleTrait {

    public func subscribeAndObserveOn(_ scheduler: ImmediateSchedulerType?) -> Single<ElementType> {
        return primitiveSequence
        .asObservable()
        .subscribeAndObserveOn(scheduler)
        .asSingle()
    }

}

extension PrimitiveSequenceType where TraitType == CompletableTrait {

    public func subscribeAndObserveOn(_ scheduler: ImmediateSchedulerType?) -> Completable {
        return primitiveSequence
            .asObservable()
            .subscribeAndObserveOn(scheduler)
            .ignoreElements()
    }

}
