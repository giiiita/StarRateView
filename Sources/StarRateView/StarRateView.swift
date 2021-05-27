//
//  StarRateView.swift
//  
//
//  Created by giiiita on 2021/05/27.
//

import SwiftUI

@available(iOS 13.0, *)
public struct StarRateView: View {
    let starCount: Int
    let rate: Double
    
    private var starSize: CGFloat = 20
    private var starPadding: CGFloat = 8.0
    private var backgroundStarColor: Color = .white
    private var forgroundStarColor: Color = .yellow
    private var corners: Int = 5
    private var smoothness: CGFloat = 0.45
    
    public init(starCount: Int, rate: Double) {
        self.starCount = starCount
        self.rate = rate
    }
    
    private func calcStarSize(index: Int) -> CGFloat {
        if index + 1 <= Int(rate) {
            return 0
        } else if rate.truncatingRemainder(dividingBy: 1) > 0 && Int(ceil(rate)) >= index + 1 {
            return CGFloat(1 - rate.truncatingRemainder(dividingBy: 1)) * self.starSize
        }
        return self.starSize
    }
    
    public var body: some View {
        HStack(alignment: .center, spacing: self.starPadding) {
            ForEach(0..<self.starCount) { index in
                ZStack(alignment: .center) {
                    Star(corners: self.corners, smoothness: self.smoothness)
                        .fill(self.backgroundStarColor)
                        .frame(width: self.starSize, height: self.starSize)
                    Star(corners: self.corners, smoothness: self.smoothness)
                        .fill(self.forgroundStarColor)
                        .frame(width: self.starSize, height: self.starSize)
                        .mask( Rectangle().padding(.trailing, self.calcStarSize(index: index)))
                }
            }
        }
    }
}

@available(iOS 13.0, *)
extension StarRateView: Buildable {
    public func starSize(_ starSize: CGFloat) -> Self {
        mutating(keyPath: \.starSize, value: starSize)
    }
    public func starPadding(_ starPadding: CGFloat) -> Self {
        mutating(keyPath: \.starPadding, value: starPadding)
    }
    public func forgroundStarColor(_ forgroundStarColor: Color) -> Self {
        mutating(keyPath: \.forgroundStarColor, value: forgroundStarColor)
    }
    public func backgroundStarColor(_ backgroundStarColor: Color) -> Self {
        mutating(keyPath: \.backgroundStarColor, value: backgroundStarColor)
    }
    public func corners(_ corners: Int) -> Self {
        mutating(keyPath: \.corners, value: corners)
    }
    public func smoothness(_ corners: CGFloat) -> Self {
        mutating(keyPath: \.smoothness, value: smoothness)
    }
}
