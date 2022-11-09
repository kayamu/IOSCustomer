//
//  Webservice.swift
//  SwiftClient
//
//  Muharrem Kaya
// class for Webservice connection with the application
// this class able to handle Http requests like post, put,delete and patch for several classes
// Customers, customer health info,customer contact info, menus , menu ingredients and login authentication

//This class has been shared accross the application

import Foundation

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

struct LoginRequestBody: Encodable {
    let username: String
    let password: String
//    let rememberMe: Bool
}

struct LoginResponse: Codable {
    let id_token: String?
    let message: String?
    let success: Bool?
}


enum httpMethods{
    case post
    case delete
    case patch
    case put
}



class Webservice {
    
    let urlString = "http://localhost:8080"
    

    //Getting token
    func login(completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        
        let username = "admin"
        let password = "admin"
        
        
        guard let url = URL(string: "\(urlString)/api/authenticate") else {
            completion(.failure(.custom(errorMessage: "URL is not correct")))
            return
        }
        
        
        
        let body = LoginRequestBody(username: username, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No data")))
                return
            }
            
              
            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            guard let token = loginResponse.id_token else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            
            print("Your token is \(token)")
            completion(.success(token))
            
        }.resume()
    }



    //Get methods
    func getIngredients(token: String, completion: @escaping (Result<[Ingredients], NetworkError>) -> Void) {
        guard let url = URL(string: "\(urlString)/api/ingredients") else {
            print("URL Error")
            completion(.failure(.invalidURL))
            return
        }
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                print("no data")
                completion(.failure(.noData))
                return
            }
            guard let ingradients = try? JSONDecoder().decode([Ingredients].self, from: data) else {
                print("decoding error")
                completion(.failure(.decodingError))
                return
            }
            
            print("ingredients get successfully")
            completion(.success(ingradients))
        }.resume()
    }
    
    //Get Menus methods
    func getMenus(token: String, completion: @escaping (Result<[Menus], NetworkError>) -> Void) {
        guard let url = URL(string: "\(urlString)/api/menus") else {
            print("URL Error")
            completion(.failure(.invalidURL))
            return
        }
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                print("no data")
                completion(.failure(.noData))
                return
            }
            guard let items = try? JSONDecoder().decode([Menus].self, from: data) else {
                print("decoding error")
                completion(.failure(.decodingError))
                return
            }
            
            print("ingredients get successfully")
            completion(.success(items))
        }.resume()
    }
    
    
    
    //Get by parameter Methods
    func getCustomerByUID(token: String, uid:String, completion: @escaping (Result<Customer, NetworkError>) -> Void) {
        guard let url = URL(string: "\(urlString)/api/customers/UID/\(uid)") else {
            completion(.failure(.invalidURL))
            return
        }
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                print("no data")
                completion(.failure(.noData))
                return
            }
            guard let customers = try? JSONDecoder().decode(Customer.self, from: data) else {
                print("decoding error")
                completion(.failure(.decodingError))
                return
            }
            
            print("success")
            completion(.success(customers))
        }.resume()
    }
    
    func getMenuByID(token: String, uid:String, completion: @escaping (Result<Menus, NetworkError>) -> Void) {
        guard let url = URL(string: "\(urlString)/api/manus/\(uid)") else {
            completion(.failure(.invalidURL))
            return
        }
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                print("no data")
                completion(.failure(.noData))
                return
            }
            guard let customers = try? JSONDecoder().decode(Menus.self, from: data) else {
                print("decoding error")
                completion(.failure(.decodingError))
                return
            }
            
            print("success")
            completion(.success(customers))
        }.resume()
    }
    
    
  
    //Get Customer Health Info
    func getCustomerHealthWithIngredientsByID(token: String, id:Int, completion: @escaping (Result<CustomerHealthsWithIndredients, NetworkError>) -> Void) {
        
        print("Customer health Id \(id)")
    
        guard let url = URL(string: "\(urlString)/api/customer-healths/\(id)") else {
            print("invalid URL")
            completion(.failure(.invalidURL))
            return
        }
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                print("no data")
                completion(.failure(.noData))
                return
            }
            guard let item = try? JSONDecoder().decode(CustomerHealthsWithIndredients.self, from: data)
            else {
                print("Health Couldnt Parse data")
                completion(.failure(.decodingError))
                return
            }
            
            print("success")
            completion(.success(item))
        }.resume()
    }
    
    
    
    
    
   
 
    
    //Patch methods
    
    //Customer Update function
    func customerById(token: String, customer:Customer, id: Int, httpType : httpMethods, completion: @escaping (Result<Customer, NetworkError>) -> Void) {
        print("Customer id \(id)")
        
        guard let url = URL(string: "\(urlString)/api/customers/\(id)") else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        
        switch httpType {
        case .post:
            request.httpMethod = "POST"
        case .delete:
            request.httpMethod = "DELETE"
        case .patch:
            request.httpMethod = "PATCH"
        case .put:
            request.httpMethod = "PUT"
        }
        
        
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let encodedResult = try JSONEncoder().encode(customer)
            print(encodedResult.debugDescription)

            request.httpBody = encodedResult
            print((request.httpBody?.description ?? "") as String)
        } catch let error {
            print(error.localizedDescription)
        }
        
        
        let task = URLSession.shared.dataTask(with: request){ data,resp,error in
            print("================================= response")
            print(String(data: data ?? Data.init(), encoding: .utf8) ?? "")
            
            if let httpResponse = resp as? HTTPURLResponse {
                
                let statuscode = httpResponse.statusCode
                print("statusCode: \(statuscode)")
                
                completion(.success(customer))
            }
        }
        task.resume()

        completion(.success(customer))
       
    }
    
    func customerContactById(token: String, item:CustomerContact, id: Int, httpType : httpMethods, completion: @escaping (Result<CustomerContact, NetworkError>) -> Void) {
    
        var val : String = ""
        if id != 0 {val = "/\(id)"}  else {item.id = nil}


        guard let url = URL(string: "\(urlString)/api/customer-contacts\(val)") else {
            completion(.failure(.invalidURL))
            return
        }
        
        var request = URLRequest(url: url)
        //request.httpMethod = "POST"
        
        switch httpType {
        case .post:
            request.httpMethod = "POST"
        case .delete:
            request.httpMethod = "DELETE"
        case .patch:
            request.httpMethod = "PATCH"
        case .put:
            request.httpMethod = "PUT"
        }
        
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(item)

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
              
            guard let customerContact = try? JSONDecoder().decode(CustomerContact.self, from: data) else {
                completion(.failure(.decodingError))
                return
            }
            
            completion(.success(customerContact))
            
        }.resume()
        
    }
    
    

    
    
    //Update Customer Health info
    func customerHealthsById(token: String, item:CustomerHealths, id: Int, httpType : httpMethods,  completion: @escaping (Result<CustomerHealths, NetworkError>) -> Void) {
        
        
        print("************************Health Update***************************************")
        
        var val : String = ""
        if id != 0 {val = "/\(id)"}  else {item.id = nil}


        guard let url = URL(string: "\(urlString)/api/customer-healths\(val)") else {
            print("URL Error")
            
            completion(.failure(.invalidURL))
            return
        }
        
        
        
        
        var request = URLRequest(url: url)
        //request.httpMethod = "POST"
        
        switch httpType {
        case .post:
            request.httpMethod = "POST"
        case .delete:
            request.httpMethod = "DELETE"
        case .patch:
            request.httpMethod = "PATCH"
        case .put:
            request.httpMethod = "PUT"
        }
        
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(item)

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                
                print("No Data")
                completion(.failure(.noData))
                return
            }
              
            guard let customerHealth = try? JSONDecoder().decode(CustomerHealths.self, from: data) else {
                
                print("Decoding Error")
                completion(.failure(.decodingError))
                return
            }
            
            print("Sucessful added \(customerHealth.id ?? 0)")
            completion(.success(customerHealth))
            
        }.resume()
    }
    
    
    func customerHealthsWithIndredientsById(token: String, item:CustomerHealthsWithIndredients, id: Int, httpType : httpMethods,  completion: @escaping (Result<CustomerHealthsWithIndredients, NetworkError>) -> Void) {
        
        
        print("************************Health Update***************************************")
        
        var val : String = ""
        if id != 0 {val = "/\(id)"}  else {item.id = nil}


        guard let url = URL(string: "\(urlString)/api/customer-healths\(val)") else {
            print("URL Error")
            
            completion(.failure(.invalidURL))
            return
        }
        
        
        
        
        var request = URLRequest(url: url)
        //request.httpMethod = "POST"
        
        switch httpType {
        case .post:
            request.httpMethod = "POST"
        case .delete:
            request.httpMethod = "DELETE"
        case .patch:
            request.httpMethod = "PATCH"
        case .put:
            request.httpMethod = "PUT"
        }
        
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(item)

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                
                print("No Data")
                completion(.failure(.noData))
                return
            }
              
            guard let customerHealth = try? JSONDecoder().decode(CustomerHealthsWithIndredients.self, from: data) else {
                
                print("Decoding Error")
                completion(.failure(.decodingError))
                return
            }
            
            print("Sucessful added \(customerHealth.id ?? 0)")
            completion(.success(customerHealth))
            
        }.resume()
    }
    
}

