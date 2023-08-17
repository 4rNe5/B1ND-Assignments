//
//  WriteView.swift
//  BIND-Diary
//
//  Created by 4rNe5 on 2023/08/17.
//

import SwiftUI

struct WriteView: View {
    @State var DiaryWriteField: String
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .inset(by: 0.5)
                .stroke(Color(red: 0.17, green: 0.4, blue: 0.71), lineWidth: 1)
                .frame(width: 361, height: 160)
                .overlay(
                    TextField("일기를 작성해주세요", text: $DiaryWriteField, axis:.vertical)
                        .padding(14) // 패딩을 추가하여 텍스트가 박스의 가장자리에 닿지 않도록 합니다.
                        .padding(.bottom, 100)
                        .font(.system(size: 14))
                )
            Spacer()
        }
    }
}

struct WriteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteView(DiaryWriteField: "")
    }
}
