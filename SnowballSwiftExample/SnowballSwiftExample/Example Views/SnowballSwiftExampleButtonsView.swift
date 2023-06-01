//
//  SnowballSwiftExampleButtonsView.swift
//  SnowballSwiftExample
//
//  Created by Vivian Phung on 5/22/23.
//

import SwiftUI
import SnowballSwiftKit
import SnowballAssetKit

struct SnowballSwiftExampleButtonsView: View {
    @State var tappedButtonString: String = ""
    @State var buttonDisabled: Bool = false

    var body: some View {
        VStack(spacing: 15) {
            Text("SnowballButton is just a convenient button with icons on either side. Use ButtonStyle (.danger, .plain, etc) to style")

            Text("Tapped Button: \(tappedButtonString)")

            Spacer()

            SnowballButton(self.buttonDisabled ? "enable buttons" : "disable buttons") {
                self.buttonDisabled.toggle()
            }

            VStack {
                HStack {
                    SnowballButton(leftSystemIcon: "clipboard") {
                        self.tappedButtonString = "clipboard icon only"
                        self.buttonDisabled = true
                    }
                    .buttonStyle(.snowballFilled)
                    .disabled(buttonDisabled)
                    SnowballButton(leftSystemIcon: "clipboard") {
                        self.tappedButtonString = "clipboard icon only"
                        self.buttonDisabled = true
                    }
                    .buttonStyle(.snowballTinted)
                    .disabled(buttonDisabled)
                    SnowballButton(leftSystemIcon: "clipboard") {
                        self.tappedButtonString = "clipboard icon only"
                        self.buttonDisabled = true
                    }
                    .buttonStyle(.snowballDefault)
                    .disabled(buttonDisabled)
                    SnowballButton(leftSystemIcon: "clipboard") {
                        self.tappedButtonString = "clipboard icon only"
                        self.buttonDisabled = true
                    }
                    .buttonStyle(.snowballDanger)
                    .disabled(buttonDisabled)
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        SnowballButton("clipboard", leftSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard with *left* icon and text"
                            self.buttonDisabled = true
                        }
                        .buttonStyle(.snowballFilled)
                        .disabled(buttonDisabled)
                        SnowballButton("clipboard", leftSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard with *left* icon and text"
                            self.buttonDisabled = true
                        }
                        .buttonStyle(.snowballTinted)
                        .disabled(buttonDisabled)
                        SnowballButton("clipboard", leftSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard with *left* icon and text"
                            self.buttonDisabled = true
                        }
                        .buttonStyle(.snowballDefault)
                        .disabled(buttonDisabled)
                        SnowballButton("clipboard", leftSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard with *left* icon and text"
                            self.buttonDisabled = true
                        }
                        .buttonStyle(.snowballDanger)
                        .disabled(buttonDisabled)
                    }
                    .padding(.horizontal, 5)
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        SnowballButton("clipboard", rightSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard with *right* icon and text"
                            self.buttonDisabled = true
                        }
                        .buttonStyle(.snowballFilled)
                        .disabled(buttonDisabled)
                        SnowballButton("clipboard", rightSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard with *right* icon and text"
                            self.buttonDisabled = true
                        }
                        .buttonStyle(.snowballTinted)
                        .disabled(buttonDisabled)
                        SnowballButton("clipboard", rightSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard with *right* icon and text"
                            self.buttonDisabled = true
                        }
                        .buttonStyle(.snowballDefault)
                        .disabled(buttonDisabled)
                        SnowballButton("clipboard", rightSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard with *right* icon and text"
                            self.buttonDisabled = true
                        }
                        .buttonStyle(.snowballDanger)
                        .disabled(buttonDisabled)
                    }
                    .padding(.horizontal, 5)
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        SnowballButton("clipboard") {
                            self.tappedButtonString = "clipboard text only"
                            self.buttonDisabled = true
                        }
                        .buttonStyle(.snowballFilled)
                        .disabled(buttonDisabled)
                        SnowballButton("clipboard") {
                            self.tappedButtonString = "clipboard text only"
                            self.buttonDisabled = true
                        }
                        .buttonStyle(.snowballTinted)
                        .disabled(buttonDisabled)
                        SnowballButton("clipboard") {
                            self.tappedButtonString = "clipboard text only"
                            self.buttonDisabled = true
                        }
                        .buttonStyle(.snowballDefault)
                        .disabled(buttonDisabled)
                        SnowballButton("clipboard") {
                            self.tappedButtonString = "clipboard text only"
                            self.buttonDisabled = true
                        }
                        .buttonStyle(.snowballDanger)
                        .disabled(buttonDisabled)
                    }
                    .padding(.horizontal, 5)
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        SnowballButton("clipboard", leftSystemIcon: "clipboard", rightSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard with *left and right* icon and text"
                            self.buttonDisabled = true
                        }
                        .buttonStyle(.snowballFilled)
                        .disabled(buttonDisabled)
                        SnowballButton("clipboard", leftSystemIcon: "clipboard", rightSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard with *left and right* icon and text"
                            self.buttonDisabled = true
                        }
                        .buttonStyle(.snowballTinted)
                        .disabled(buttonDisabled)
                        SnowballButton("clipboard", leftSystemIcon: "clipboard", rightSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard with *left and right* icon and text"
                            self.buttonDisabled = true
                        }
                        .buttonStyle(.snowballDefault)
                        .disabled(buttonDisabled)
                        SnowballButton("clipboard", leftSystemIcon: "clipboard", rightSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard with *left and right* icon and text"
                            self.buttonDisabled = true
                        }
                        .buttonStyle(.snowballDanger)
                        .disabled(buttonDisabled)
                    }
                    .padding(.horizontal, 5)
                }

                Divider()
                VStack {
                    HStack {
                        SnowballButton(leftSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard icon only"
                            self.buttonDisabled = true
                        }
                        .buttonStyle(.snowballFilled(buttonSize: .large))
                        .disabled(buttonDisabled)
                        SnowballButton(leftSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard icon only"
                            self.buttonDisabled = true
                        }
                        .buttonStyle(.snowballTinted(.large))
                        .disabled(buttonDisabled)
                        SnowballButton(leftSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard icon only"
                            self.buttonDisabled = true
                        }
                        .buttonStyle(.snowballDefault(.large))
                        .disabled(buttonDisabled)
                        SnowballButton(leftSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard icon only"
                            self.buttonDisabled = true
                        }
                        .buttonStyle(.snowballDanger(.large))
                        .disabled(buttonDisabled)
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            SnowballButton("clipboard", leftSystemIcon: "clipboard") {
                                self.tappedButtonString = "clipboard with *left* icon and text"
                                self.buttonDisabled = true
                            }
                            .buttonStyle(.snowballFilled(buttonSize: .large))
                            .disabled(buttonDisabled)
                            SnowballButton("clipboard", leftSystemIcon: "clipboard") {
                                self.tappedButtonString = "clipboard with *left* icon and text"
                                self.buttonDisabled = true
                            }
                            .buttonStyle(.snowballTinted(.large))
                            .disabled(buttonDisabled)
                            SnowballButton("clipboard", leftSystemIcon: "clipboard") {
                                self.tappedButtonString = "clipboard with *left* icon and text"
                                self.buttonDisabled = true
                            }
                            .buttonStyle(.snowballDefault(.large))
                            .disabled(buttonDisabled)
                            SnowballButton("clipboard", leftSystemIcon: "clipboard") {
                                self.tappedButtonString = "clipboard with *left* icon and text"
                                self.buttonDisabled = true
                            }
                            .buttonStyle(.snowballDanger(.large))
                            .disabled(buttonDisabled)
                        }
                        .padding(.horizontal, 5)
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            SnowballButton("clipboard", rightSystemIcon: "clipboard") {
                                self.tappedButtonString = "clipboard with *right* icon and text"
                                self.buttonDisabled = true
                            }
                            .buttonStyle(.snowballFilled(buttonSize: .large))
                            .disabled(buttonDisabled)
                            SnowballButton("clipboard", rightSystemIcon: "clipboard") {
                                self.tappedButtonString = "clipboard with *right* icon and text"
                                self.buttonDisabled = true
                            }
                            .buttonStyle(.snowballTinted(.large))
                            .disabled(buttonDisabled)
                            SnowballButton("clipboard", rightSystemIcon: "clipboard") {
                                self.tappedButtonString = "clipboard with *right* icon and text"
                                self.buttonDisabled = true
                            }
                            .buttonStyle(.snowballDefault(.large))
                            .disabled(buttonDisabled)
                            SnowballButton("clipboard", rightSystemIcon: "clipboard") {
                                self.tappedButtonString = "clipboard with *right* icon and text"
                                self.buttonDisabled = true
                            }
                            .buttonStyle(.snowballDanger(.large))
                            .disabled(buttonDisabled)
                        }
                        .padding(.horizontal, 5)
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            SnowballButton("clipboard") {
                                self.tappedButtonString = "clipboard text only"
                                self.buttonDisabled = true
                            }
                            .buttonStyle(.snowballFilled(buttonSize: .large))
                            .disabled(buttonDisabled)
                            SnowballButton("clipboard") {
                                self.tappedButtonString = "clipboard text only"
                                self.buttonDisabled = true
                            }
                            .buttonStyle(.snowballTinted(.large))
                            .disabled(buttonDisabled)
                            SnowballButton("clipboard") {
                                self.tappedButtonString = "clipboard text only"
                                self.buttonDisabled = true
                            }
                            .buttonStyle(.snowballDefault(.large))
                            .disabled(buttonDisabled)
                            SnowballButton("clipboard") {
                                self.tappedButtonString = "clipboard text only"
                                self.buttonDisabled = true
                            }
                            .buttonStyle(.snowballDanger(.large))
                            .disabled(buttonDisabled)
                        }
                        .padding(.horizontal, 5)
                    }

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            SnowballButton("clipboard", leftSystemIcon: "clipboard", rightSystemIcon: "clipboard") {
                                self.tappedButtonString = "clipboard with *left and right* icon and text"
                                self.buttonDisabled = true
                            }
                            .buttonStyle(.snowballFilled(buttonSize: .large))
                            .disabled(buttonDisabled)
                            SnowballButton("clipboard", leftSystemIcon: "clipboard", rightSystemIcon: "clipboard") {
                                self.tappedButtonString = "clipboard with *left and right* icon and text"
                                self.buttonDisabled = true
                            }
                            .buttonStyle(.snowballTinted(.large))
                            .disabled(buttonDisabled)
                            SnowballButton("clipboard", leftSystemIcon: "clipboard", rightSystemIcon: "clipboard") {
                                self.tappedButtonString = "clipboard with *left and right* icon and text"
                                self.buttonDisabled = true
                            }
                            .buttonStyle(.snowballDefault(.large))
                            .disabled(buttonDisabled)
                            SnowballButton("clipboard", leftSystemIcon: "clipboard", rightSystemIcon: "clipboard") {
                                self.tappedButtonString = "clipboard with *left and right* icon and text"
                                self.buttonDisabled = true
                            }
                            .buttonStyle(.snowballDanger(.large))
                            .disabled(buttonDisabled)
                        }
                        .padding(.horizontal, 5)
                    }
                }
            }
        }
    }
}

struct SnowballSwiftExampleButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        SnowballSwiftExampleButtonsView()
    }
}
