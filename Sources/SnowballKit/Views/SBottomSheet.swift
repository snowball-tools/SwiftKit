//
//  SBottomSheet.swift
//  
//
//  Created by Vivian Phung on 5/1/23.
//

import SwiftUI

struct SBottomSheet<Content: View>: View {
    @Binding var isPresented: Bool
    let content: Content
    @GestureState private var dragOffset: CGFloat = 0

    init(isPresented: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self._isPresented = isPresented
        self.content = content()
    }

    var body: some View {
        VStack {
            Spacer()

            VStack {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 40, height: 5)
                    .foregroundColor(Color(.systemGray4))
                    .padding(.top)

                content
            }
            .padding([.horizontal, .bottom], 10)
            .frame(width: UIScreen.main.bounds.width)
            .background(Color(.systemBackground))
            .cornerRadius(20)
            .offset(y: max(isPresented ? 0 : UIScreen.main.bounds.height, dragOffset))
            .animation(.spring(), value: isPresented)
            .animation(.spring(), value: dragOffset)
            .gesture(
                DragGesture()
                    .updating($dragOffset) { value, state, _ in
                        state = value.translation.height
                    }
                    .onEnded { value in
                        let dismissThreshold = UIScreen.main.bounds.height * 0.25
                        if value.translation.height > dismissThreshold {
                            withAnimation {
                                isPresented = false
                            }
                        }
                    }
            )
        }
    }
}

struct SBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SBottomSheet(isPresented: .constant(true)) {
                Text("hello World!")
            }
            .previewLayout(.device)
            
            SBottomSheet(isPresented: .constant(true)) {
                VStack {
                    Text("hello world!")
                        .foregroundColor(.black)
                    Text("hello world!")
                        .foregroundColor(.black)
                    Text("hello world!")
                        .foregroundColor(.black)
                    Text("hello world!")
                        .foregroundColor(.black)
                }
            }
            .previewLayout(.device)
        }
        .background(Color.gray)
        .ignoresSafeArea(.all)
    }
}
