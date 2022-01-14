//
//  loadingView.swift
//  Weather (iOS)
//
//  Created by Peter Njonde on 2021-12-13.
//

import SwiftUI

struct loadingView: View {
    var body: some View {
        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct loadingView_Previews: PreviewProvider {
    static var previews: some View {
        loadingView()
    }
}
