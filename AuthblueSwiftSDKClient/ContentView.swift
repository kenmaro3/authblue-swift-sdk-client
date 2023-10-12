import SwiftUI
import AuthblueSwiftSDK

struct ContentView: View {
    @State private var type = "hero"
    
    func register(){
        type = "register"
    }
    func readInfo(){
        type = "readInfo"
    }
    func agreement(){
        type = "agreement"
    }

    
    @State var name = "kenmaro"
    @State var email = "miha.ken.19@gmail.com"
    @AppStorage("authblue_api_token") var authblueApiToken: String = ""
    @AppStorage("authblue_personal_email") var personalEmail: String = ""
    @AppStorage("authblue_personal_age") var personalAge: String = ""
    
    @AppStorage("authblue_dynamic_link_client_id") var dynamicLinkClientId: String = Bundle.main.object(forInfoDictionaryKey: "authblue_client_id") as! String
    @AppStorage("authblue_dynamic_link_client_name") var dynamicLinkClientName: String = Bundle.main.object(forInfoDictionaryKey: "authblue_client_name") as! String

 
    var body: some View {
        if(type=="hero"){
            VStack {
                HeroView()
                Button("Register", action: {type="register"})
                Button("Read Info", action: {type="readInfo"})
                Button("Agreement", action: {type="agreement"})
            }
            .padding(.bottom, 16)
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .background(Color("Background").ignoresSafeArea())
            .buttonStyle(PrimaryButtonStyle())
            .onAppear {
                personalEmail = email
                personalAge = "30"
                dynamicLinkClientId = Bundle.main.object(forInfoDictionaryKey: "authblue_client_id") as! String
                dynamicLinkClientName = Bundle.main.object(forInfoDictionaryKey: "authblue_client_name") as! String

                AuthblueSwiftSDK.APIClient.createUserWithAuth(username: name, email: email){ result in
                    switch result{
                        
                        
                    case.success(let data):
                        print("here00000000")
                        print(data)
                        authblueApiToken = data.result?.access_token ?? ""
                        
                    case .failure(let error):
                        print(error)
                    }
                    
                }
            }
            
        }
        else if(type=="register"){
            AuthblueSwiftSDK.MNCRegister { res in
                type="hero"
            }
            
        }else if(type=="readInfo"){
            AuthblueSwiftSDK.ModalViewForReadInfoFromMNC { res in
                print(res)
                type="hero"
            }
            
        }else if(type=="agreement"){
            AuthblueSwiftSDK.AgreementRequest{ res in
                print(res)
                type="hero"
            }
                .onAppear(perform: {
                })
        }
    }
}

#Preview {
    ContentView()
}
