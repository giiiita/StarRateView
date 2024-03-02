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
    @Binding var rate: Double

    private var starSize: CGFloat = 20
    private var starPadding: CGFloat = 8.0
    private var backgroundStarColor: Color = .white
    private var borderStarColor: Color = .gray
    private var forgroundStarColor: Color = .yellow
    private var corners: Int = 5
    private var smoothness: CGFloat = 0.45
    private var borderOffset: CGFloat = 0.2
    private var borderWidth: CGFloat = 5

    public init(starCount: Int, rate: Binding<Double>) {
        self.starCount = starCount
        self._rate = rate
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
            ForEach(0..<self.starCount, id: \.self) { index in
                ZStack(alignment: .center) {
                    Star(corners: self.corners, smoothness: self.smoothness)
                        .fill(self.borderStarColor)
                        .frame(width: self.starSize, height: self.starSize)
                    Star(corners: self.corners, smoothness: self.smoothness)
                        .fill(self.backgroundStarColor)
                        .frame(width: self.starSize - 5, height: self.starSize - 5)
                        .offset(y: self.borderOffset)
                    Star(corners: self.corners, smoothness: self.smoothness)
                        .fill(self.forgroundStarColor)
                        .frame(width: self.starSize, height: self.starSize)
                        .mask( Rectangle().padding(.trailing, self.calcStarSize(index: index)))
                }
                .onTapGesture {
                    rate = Double(index + 1)
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
    public func borderStarColor(_ borderStarColor: Color) -> Self {
        mutating(keyPath: \.borderStarColor, value: borderStarColor)
    }
    public func corners(_ corners: Int) -> Self {
        mutating(keyPath: \.corners, value: corners)
    }
    public func smoothness(_ corners: CGFloat) -> Self {
        mutating(keyPath: \.smoothness, value: smoothness)
    }
    public func borderOffset(_ borderOffset: CGFloat) -> Self {
        mutating(keyPath: \.borderOffset, value: borderOffset)
    }
    public func borderWidth(_ borderWidth: CGFloat) -> Self {
        mutating(keyPath: \.borderWidth, value: borderWidth)
    }
}

#Preview {
    StarRateView(starCount: 5, rate: .constant(2.5))
        .borderStarColor(.gray)
}
