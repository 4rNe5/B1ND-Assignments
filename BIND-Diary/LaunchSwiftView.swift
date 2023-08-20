//
//  LaunchSwiftView.swift
//  BIND-Diary
//
//  Created by 4rNe5 on 2023/08/16.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        ZStack {
            Color(red: 0.97, green: 0.97, blue: 0.97)
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("\(Text("B").foregroundColor(Color(red: 0.17, green: 0.4, blue: 0.71)))1ND 일기")
                        .font(.system(size: 42))
                        .bold()
                        .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                }
                Text("1학년 1반 이름 박준현")
                    .font(.system(size: 14))
            }
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
