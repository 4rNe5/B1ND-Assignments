import SwiftUI

struct WriteView: View {
    @State var diaryWriteField: String = ""
    @Environment(\.presentationMode) var presentationMode // Add this for back navigation
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .inset(by: 0.5)
                .stroke(Color(red: 0.17, green: 0.4, blue: 0.71), lineWidth: 1)
                .frame(width: 361, height: 160)
                .overlay(content: {
                    VStack(alignment: .leading) {
                        TextArea(text: $diaryWriteField, placeholder: "일기를 작성해주세요.", maxLength: 100)
                            .padding(14)
                        
                        Spacer()
                        
                        HStack {
                            Text("\(nonWhitespaceCharacterCount(string: diaryWriteField)) / 100")
                                .foregroundColor(Color("BBLACK"))
                                .padding(.horizontal,13)
                                .padding(.bottom,11)
                                .fontWeight(.semibold)
                            Button(action:{
                                
                            }){
                                Text("완료")
                                    .foregroundColor(Color("BBLACK"))
                            }
                        }
                    }
                })
                .padding(.top,20)
                Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Add this for back navigation
                }) {
                    HStack {
                        Image(systemName: "arrow.backward")
                        Text("뒤로")
                    }
                    .foregroundColor(Color("BBLACK"))
                }
            }
        }
    }
    
    private func nonWhitespaceCharacterCount(string: String) -> Int {
        return string.unicodeScalars.filter { !CharacterSet.whitespacesAndNewlines.contains($0) }.count
    }
}

struct WriteView_Previews: PreviewProvider {
    static var previews: some View {
        WriteView()
    }
}
