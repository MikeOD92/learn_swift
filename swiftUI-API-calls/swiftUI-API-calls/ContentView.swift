//
//  ContentView.swift
//  swiftUI-API-calls
//
//  Created by Michael O'Dell on 10/11/22.
//

import SwiftUI
// should add image cacheing
struct URLImage: View {
    let urlString: String
    @State var data: Data?
    
    var body: some View{
        if let data = data, let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 70)
                .background(.gray)
            
        }else{
            Image(systemName: "Video")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 70)
                .background(.gray)
                .onAppear{
                    fetchData()
                }
        }
    }
    
    private func fetchData(){
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url){
            data, _, _ in
            self.data = data
        }
        task.resume()
    }
}
struct Course:  Hashable, Codable {
    let name: String
    let image: String
}

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List{
                ForEach(viewModel.courses, id: \.self) { course in
                    HStack{
                        URLImage(urlString: course.image)
                        Text(course.name)
                            .bold()
                    }
                }
            }
            .navigationTitle("Courses")
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
