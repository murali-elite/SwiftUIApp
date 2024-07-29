//
//  ResetActionsButtonView.swift
//  CalixIOSUIToolkit
//
//  Created by labmacuser3 on 7/22/24.
//  Copyright © 2024 Calix Inc. All rights reserved.
//

import SwiftUI

/// A view containing the submit and cancel buttons for the reset password popup.
public struct ResetActionsButtonView: View {
    // MARK: - Constants

    private enum Constants {
        static let spacing: CGFloat = 20
    }

    // MARK: - Propertys
    var assets: ResetPasswordAssetsProtocol
    var submitAction: () -> Void
    var cancelAction: () -> Void

    /// The content and behavior of the `ResetSubmitCancelButtonView`.
    public var body: some View {
        VStack(spacing: Constants.spacing) {
            Button(action: submitAction) {
                if #available(iOS 15.0, *) {
                    submitButtonText()
                        .foregroundStyle(assets.submitForgroundColor)
                } else {
                    submitButtonText()
                }
            }

            Button(action: cancelAction) {
                if #available(iOS 15.0, *) {
                    cancelButtonText()
                        .foregroundStyle(assets.cancelForgroundColor)
                } else {
                    cancelButtonText()
                }
            }
        }
    }

    /// Creates an instance of `ResetSubmitCancelButtonView`.
    public init(assets: ResetPasswordAssetsProtocol = ResetPasswordAssets(),
                submitAction: @escaping () -> Void,
                cancelAction: @escaping () -> Void) {
        self.assets = assets
        self.submitAction = submitAction
        self.cancelAction = cancelAction
    }

    @ViewBuilder
    private func submitButtonText() -> some View {
        Text(LoginResetPageString.submit.localized())
            .buttonStyleViewModifier(backgroundColor: assets.submitBackgroundColor)
            .foregroundColor(assets.submitForgroundColor)
    }

    @ViewBuilder
    private func cancelButtonText() -> some View {
        Text(LoginResetPageString.cancel.localized())
            .buttonStyleViewModifier(borderColor: assets.cancelForgroundColor)
            .foregroundColor(assets.cancelForgroundColor)
    }
}
