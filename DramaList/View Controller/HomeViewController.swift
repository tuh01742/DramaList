//
//  HomeViewController.swift
//  DramaList
//
//  Created by Rabia Tanveer on 5/1/21.
//  Copyright © 2021 Rabia Tanveer. All rights reserved.
//

import UIKit
import SafariServices

//UI
//Network Request

class HomeViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MovieTableViewCell.nib(), forCellReuseIdentifier: MovieTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        searchTextField.delegate = self
      
    }
    
    //TextField
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchMovies()
        return true
    }
    
    func searchMovies(){
        
       searchTextField.resignFirstResponder()
        
        guard let text = searchTextField.text, !text.isEmpty else{
            
            return
        }
        let query = text.replacingOccurrences(of: " ", with: "%20")
        
        movies.removeAll()

        URLSession.shared.dataTask(with: URL(string: "https://www.omdbapi.com/?apikey=3aea79ac&s=\(query)&type=movie")!,
            completionHandler: { data, response, error in
            
            guard let data = data, error == nil else{
                return
            }
            
            //convert
            var result: MovieResult?
            do{
                result = try JSONDecoder().decode(MovieResult.self, from: data)
            }
            catch{
                print("error")
            }
            
            guard let finalResult = result else{
                return
            }
            
           // print("\(finalResult.Search.first?.Title)")
            
            //update our movie array
            let newMovies = finalResult.Search
            self.movies.append(contentsOf: newMovies)

            
            

            
            // Refresh our table
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }).resume()
    }
    
    //Table
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as! MovieTableViewCell
    cell.configure(with: movies[indexPath.row])
   //cell.configure(with: movies[indexPath.row])
    return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Show movie details
        let url = "https://www.imdb.com/title/\(movies[indexPath.row].imdbID)/"
        let vc = SFSafariViewController(url: URL(string: url)!)
        present(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}




    
    struct MovieResult: Codable {
        let Search: [Movie]
    }
    
    struct Movie: Codable{
        
        let Title: String
        let Year: String
        let imdbID: String
        let _Type: String
        let Poster: String
        
        private enum CodingKeys: String, CodingKey {
            case Title, Year, imdbID, _Type = "Type", Poster
        }
        
    }

