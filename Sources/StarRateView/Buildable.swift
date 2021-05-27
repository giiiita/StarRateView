//
//  Buildable.swift
//  
//
//  Created by giiiita on 2021/05/27.
//

protocol Buildable { }

extension Buildable {
    func mutating<T>(keyPath: WritableKeyPath<Self, T>, value: T) -> Self {
        var newSelf = self
        newSelf[keyPath: keyPath] = value
        return newSelf
    }
}
