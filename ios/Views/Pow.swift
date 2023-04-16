//
//  PowExample.swift
//  test-swiftui
//
//  Created by Gary Tokman on 4/13/23.
//

import SwiftUI
import Pow
import Combine

struct PowUIView: View {
    
    @ObservedObject var props: Props
    
    @State var localValue = ""
    @State var localSize = CGSize.zero
    
    func animationView(lessThanZero: Bool) -> some View {
        Text(localValue)
            .foregroundColor(lessThanZero ? Color.red : Color.green)
            .shadow(color: (lessThanZero ? Color.red : Color.green).opacity(0.4), radius: 0.5, y: 0.5)
    }
    
    var body: some View {
        ZStack {
            let lessThanZero = localValue.contains("-")
            let pick = SoundEffect(
                lessThanZero ? "drip.falling" : "drip.rising"
            )
            Label {
                Text(localValue)
                    .monospacedDigit()
                    .changeEffect(
                        props.type == .none
                        ? .shine
                        : props.type == .rise
                        ? .rise(origin: .bottom) { animationView(lessThanZero: lessThanZero) }
                        : .spray(origin: .bottom) { animationView(lessThanZero: lessThanZero) },
                        value: localValue
                    )
                    .changeEffect(props.isSoundOn ?
                        .feedback(pick) :
                            .feedback(SoundEffect("none")), value: localValue)
                    .font(.system(size: 17.5, design: .rounded))
            } icon: {
                Image(systemName: "arrow.up.forward")
                    .foregroundStyle(lessThanZero ? Color.red : Color.green)
                    .rotationEffect(.degrees(lessThanZero ? -180 : 0))
            }
            .background(
                Color.gray.opacity(0.0001)
                    .frame(width: localSize.width, height: localSize.height)
            )
        }
        .onReceive(props.$size) { value in
            withAnimation(.movingParts.overshoot(duration: 0.4)) {
                localSize = value
            }
        }
        .onReceive(props.$value) { value in
            withAnimation(.movingParts.overshoot(duration: 0.4)) {
                localValue = value
            }
        }
    }
}
