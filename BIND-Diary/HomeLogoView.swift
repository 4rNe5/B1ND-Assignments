//
//  HomeLogoView.swift
//  BIND-Diary
//
//  Created by 4rNe5 on 2023/08/17.
//

import SwiftUI

struct HomeLogoView: View {
    var body: some View {
            Rectangle()
                .inset(by: 0.5)
                .stroke(Color(red: 0.17, green: 0.4, blue: 0.71), lineWidth: 1)
                .frame(width: 353, height: 92)
    }
}
struct HomeLogoView_Previews: PreviewProvider {
    static var previews: some View {
        HomeLogoView()
    }
}
