//
//  DiaryCell.swift
//  BIND-Diary
//
//  Created by 4rNe5 on 2023/08/17.
//

import SwiftUI

struct DiaryCell: View {
    var title: String
    var content: String

    var body: some View {
            RoundedRectangle(cornerRadius: 10)
                .inset(by: 0.5)
                .stroke(Color(red: 0.17, green: 0.4, blue: 0.71), lineWidth: 1)
                .frame(width: 353, height: 92)
                .overlay(HStack{
                    VStack(alignment: .leading, spacing: 4) {
                        Text(title)
                            .fontWeight(.medium)
                            .foregroundColor(Color(red: 0.2, green: 0.2, blue: 0.2))
                            .lineLimit(1)
                        
                        Text(content)
                            .foregroundColor(Color.black)
                            .frame(maxHeight: .infinity, alignment: .topLeading)
                            
                    }
                    .padding(.top, 10)
                    .padding(.leading, 20)
                    .multilineTextAlignment(.leading)
                    Spacer()
                }
                .font(.system(size: 14))
            )
            
        .padding(10)
    }
}


struct DiaryCell_Previews: PreviewProvider {
    static var previews: some View {
        DiaryCell(title: "2023년 06월 18일 (일)", content: "Good")
    }
}
