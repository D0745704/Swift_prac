//
//  ContentView.swift
//  D0745704_hw
//
//  Created by 仲輝 on 2021/4/14.
//

import SwiftUI

struct ContentView: View {
    @State var username: String = ""
    @State var password: String = ""
    @State var sliderTemp = 18.0
    @State private var selectedDegree = 0
    @State private var ButtonSwitch = false
    var ageMin = 18.0
    var ageMax = 35.0
    var typesOfDegree = ["undergraduate","master"]
    private var enableButton: Bool {
        !username.isEmpty && !password.isEmpty
        && ButtonSwitch
    }
    
    var body: some View {
        VStack{
            HStack{
                Text("Username")
                TextField("Username",text: $username)
                    .frame(width: 245.0)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            HStack{
                Text("Password")
                SecureField("Password",text: $password)
                    .frame(width:250.0)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            HStack{
                Text("Age:\(Int(ageMin))")
                Slider(value: $sliderTemp,in: ageMin...ageMax)
                    .frame(width: 210.0)
                Text("Age:\(Int(ageMax))")
                
            }.padding()
            Text("Your Age: \(Int(sliderTemp))")
                .fontWeight(.bold)
            HStack{
                Picker(selection: $selectedDegree, label: /*@START_MENU_TOKEN@*/Text("Picker")/*@END_MENU_TOKEN@*/.bold()){
                    ForEach(0..<typesOfDegree.count){
                        Text(self.typesOfDegree[$0]).tag($0)
                    }
                }
                .frame(width: 180.0, height: 100.0)
            }
            Text("Degree:\(typesOfDegree[selectedDegree])")
            HStack{
                Toggle(isOn: $ButtonSwitch){
                    Text("I'm a student from FCU").bold()
                }.padding()
                .frame(width: 290.0)
                .background(ButtonSwitch ? Color.yellow :Color.white)
            }
            Button("Sign Up"){
                print("Sign in using \(self.username) and \(self.password)")
            }.disabled(!enableButton)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
