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

    var body: some View {
        VStack(spacing: 15) {
            Text("SnowballButton is just a convenient button with icons on either side. Use ButtonStyle (.danger, .plain, etc) to style")

            Text("Tapped Button: \(tappedButtonString)")

            Spacer()

            VStack {
                HStack {
                    SnowballButton(leftSystemIcon: "clipboard") {
                        self.tappedButtonString = "clipboard icon only"
                    }
                    .buttonStyle(.snowballFilled)
                    SnowballButton(leftSystemIcon: "clipboard") {
                        self.tappedButtonString = "clipboard icon only"
                    }
                    .buttonStyle(.snowballTinted)
                    SnowballButton(leftSystemIcon: "clipboard") {
                        self.tappedButtonString = "clipboard icon only"
                    }
                    .buttonStyle(.snowballDefault)
                    SnowballButton(leftSystemIcon: "clipboard") {
                        self.tappedButtonString = "clipboard icon only"
                    }
                    .buttonStyle(.snowballDanger)
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        SnowballButton("clipboard", leftSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard with *left* icon and text"
                        }
                        .buttonStyle(.snowballFilled)
                        SnowballButton("clipboard", leftSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard with *left* icon and text"
                        }
                        .buttonStyle(.snowballTinted)
                        SnowballButton("clipboard", leftSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard with *left* icon and text"
                        }
                        .buttonStyle(.snowballDefault)
                        SnowballButton("clipboard", leftSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard with *left* icon and text"
                        }
                        .buttonStyle(.snowballDanger)
                    }
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        SnowballButton("clipboard", rightSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard with *right* icon and text"
                        }
                        .buttonStyle(.snowballFilled)
                        SnowballButton("clipboard", rightSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard with *right* icon and text"
                        }
                        .buttonStyle(.snowballTinted)
                        SnowballButton("clipboard", rightSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard with *right* icon and text"
                        }
                        .buttonStyle(.snowballDefault)
                        SnowballButton("clipboard", rightSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard with *right* icon and text"
                        }
                        .buttonStyle(.snowballDanger)
                    }
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        SnowballButton("clipboard") {
                            self.tappedButtonString = "clipboard text only"
                        }
                        .buttonStyle(.snowballFilled)
                        SnowballButton("clipboard") {
                            self.tappedButtonString = "clipboard text only"
                        }
                        .buttonStyle(.snowballTinted)
                        SnowballButton("clipboard") {
                            self.tappedButtonString = "clipboard text only"
                        }
                        .buttonStyle(.snowballDefault)
                        SnowballButton("clipboard") {
                            self.tappedButtonString = "clipboard text only"
                        }
                        .buttonStyle(.snowballDanger)
                    }
                }
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        SnowballButton("clipboard", leftSystemIcon: "clipboard", rightSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard with *left and right* icon and text"
                        }
                        .buttonStyle(.snowballFilled)
                        SnowballButton("clipboard", leftSystemIcon: "clipboard", rightSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard with *left and right* icon and text"
                        }
                        .buttonStyle(.snowballTinted)
                        SnowballButton("clipboard", leftSystemIcon: "clipboard", rightSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard with *left and right* icon and text"
                        }
                        .buttonStyle(.snowballDefault)
                        SnowballButton("clipboard", leftSystemIcon: "clipboard", rightSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard with *left and right* icon and text"
                        }
                        .buttonStyle(.snowballDanger)
                    }
                }

                Divider()
                VStack {
                    HStack {
                        SnowballButton(leftSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard icon only"
                        }
                        .buttonStyle(.snowballFilled(buttonSize: .large))
                        SnowballButton(leftSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard icon only"
                        }
                        .buttonStyle(.snowballTinted(.large))
                        SnowballButton(leftSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard icon only"
                        }
                        .buttonStyle(.snowballDefault(.large))
                        SnowballButton(leftSystemIcon: "clipboard") {
                            self.tappedButtonString = "clipboard icon only"
                        }
                        .buttonStyle(.snowballDanger(.large))
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            SnowballButton("clipboard", leftSystemIcon: "clipboard") {
                                self.tappedButtonString = "clipboard with *left* icon and text"
                            }
                            .buttonStyle(.snowballFilled(buttonSize: .large))
                            SnowballButton("clipboard", leftSystemIcon: "clipboard") {
                                self.tappedButtonString = "clipboard with *left* icon and text"
                            }
                            .buttonStyle(.snowballTinted(.large))
                            SnowballButton("clipboard", leftSystemIcon: "clipboard") {
                                self.tappedButtonString = "clipboard with *left* icon and text"
                            }
                            .buttonStyle(.snowballDefault(.large))
                            SnowballButton("clipboard", leftSystemIcon: "clipboard") {
                                self.tappedButtonString = "clipboard with *left* icon and text"
                            }
                            .buttonStyle(.snowballDanger(.large))
                        }
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            SnowballButton("clipboard", rightSystemIcon: "clipboard") {
                                self.tappedButtonString = "clipboard with *right* icon and text"
                            }
                            .buttonStyle(.snowballFilled(buttonSize: .large))
                            SnowballButton("clipboard", rightSystemIcon: "clipboard") {
                                self.tappedButtonString = "clipboard with *right* icon and text"
                            }
                            .buttonStyle(.snowballTinted(.large))
                            SnowballButton("clipboard", rightSystemIcon: "clipboard") {
                                self.tappedButtonString = "clipboard with *right* icon and text"
                            }
                            .buttonStyle(.snowballDefault(.large))
                            SnowballButton("clipboard", rightSystemIcon: "clipboard") {
                                self.tappedButtonString = "clipboard with *right* icon and text"
                            }
                            .buttonStyle(.snowballDanger(.large))
                        }
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            SnowballButton("clipboard") {
                                self.tappedButtonString = "clipboard text only"
                            }
                            .buttonStyle(.snowballFilled(buttonSize: .large))
                            SnowballButton("clipboard") {
                                self.tappedButtonString = "clipboard text only"
                            }
                            .buttonStyle(.snowballTinted(.large))
                            SnowballButton("clipboard") {
                                self.tappedButtonString = "clipboard text only"
                            }
                            .buttonStyle(.snowballDefault(.large))
                            SnowballButton("clipboard") {
                                self.tappedButtonString = "clipboard text only"
                            }
                            .buttonStyle(.snowballDanger(.large))
                        }
                    }

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            SnowballButton("clipboard", leftSystemIcon: "clipboard", rightSystemIcon: "clipboard") {
                                self.tappedButtonString = "clipboard with *left and right* icon and text"
                            }
                            .buttonStyle(.snowballFilled(buttonSize: .large))
                            SnowballButton("clipboard", leftSystemIcon: "clipboard", rightSystemIcon: "clipboard") {
                                self.tappedButtonString = "clipboard with *left and right* icon and text"
                            }
                            .buttonStyle(.snowballTinted(.large))
                            SnowballButton("clipboard", leftSystemIcon: "clipboard", rightSystemIcon: "clipboard") {
                                self.tappedButtonString = "clipboard with *left and right* icon and text"
                            }
                            .buttonStyle(.snowballDefault(.large))
                            SnowballButton("clipboard", leftSystemIcon: "clipboard", rightSystemIcon: "clipboard") {
                                self.tappedButtonString = "clipboard with *left and right* icon and text"
                            }
                            .buttonStyle(.snowballDanger(.large))
                        }
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
