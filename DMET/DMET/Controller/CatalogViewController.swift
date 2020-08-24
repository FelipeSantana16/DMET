//
//  CatalogViewController.swift
//  DMET
//
//  Created by Felipe Santana on 14/08/20.
//  Copyright © 2020 Felipe Santana. All rights reserved.
//

import UIKit
//COMO ENVIAR DADOS PRA PROXIMA TELA:
//let viewControllerB = ViewControllerB()
//viewControllerB.selectedName = "Taylor Swift"
//navigationController?.pushViewController(viewControllerB, animated: true)

class CatalogViewController: UIViewController {
    
    let appName = UILabel()
    let hello = UILabel()
    let table = UITableView()
    var departments = [Department]() {

        didSet {

            DispatchQueue.main.async {

                self.table.reloadData()
                //let isFirstLaunch: Bool = (UserDefaults.standard.value(forKey: "FirstLaunch") as? Bool) ?? false
                
//                if !isFirstLaunch {
//                    print("primeira vez que ta rodando")
//                    UserDefaults.standard.set(true, forKey: "FirstLaunch")
                        self.getDepartmentsObjects()
                    
//                } else {
//                    print("tem que puxar da memoria")//puxa os dados da memoria
//                }
                
            }

        }

    }
    
    var departmentsObjects = [Int: [ArtObject]]()
    
    var departmentsData = [Int: [UIImage]]() {
        
        didSet {
            
            DispatchQueue.main.async {
                self.table.reloadData()
            }
            
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle = .fullScreen
        setupHello()
        setupAppName()
        setupTable()
        view.backgroundColor = UIColor(displayP3Red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        getAllDepartments()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.barStyle = .black
    }
    
    func setupAppName() {
        
        appName.font = UIFont(name: "Baskerville-bold", size: 70)
        
        
        appName.textColor = .white
        
        appName.text = "DMET"
        
        view.addSubview(appName)
        
        setAppNameConstraints()
        
    }
    
    func setupHello() {
        
        hello.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        
        hello.textColor = .white
        
//        let isFirstLaunch: Bool = (UserDefaults.standard.value(forKey: "FirstLaunch") as? Bool) ?? false
//
//        if !isFirstLaunch {
//            UserDefaults.standard.set(true, forKey: "FirstLaunch")
//            hello.text = "Welcome to"
//        }
        
        hello.text = "Welcome to"
        
        view.addSubview(hello)
        
        setHelloConstraints()
        
    }
    
    func setupTable() {
        view.addSubview(table)
        setTableViewDelegate()
        table.register(CatalogTableViewCell.self, forCellReuseIdentifier: CatalogTableViewCell.identifier)
        table.register(SpotlightTableViewCell.self, forCellReuseIdentifier: SpotlightTableViewCell.identifier)
        table.backgroundColor = UIColor(displayP3Red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        table.separatorStyle = .none
//        table.allowsSelection = false
        setTableConstraints()
        
    }
    
    func setTableViewDelegate() {
        
        table.delegate = self
        table.dataSource = self
        
    }
    
    func setTableConstraints() {
        
        table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: appName.bottomAnchor, constant: 8).isActive = true
        table.leadingAnchor.constraint(equalTo: super.view.leadingAnchor).isActive = true
        table.trailingAnchor.constraint(equalTo: super.view.trailingAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: super.view.bottomAnchor).isActive = true
        
    }
    
    
    func setAppNameConstraints() {
        
        appName.translatesAutoresizingMaskIntoConstraints = false
        
        appName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        
        appName.topAnchor.constraint(equalTo: hello.bottomAnchor).isActive = true
        
        
    }
    
    func setHelloConstraints() {
        
        hello.translatesAutoresizingMaskIntoConstraints = false
        
        hello.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        
        hello.topAnchor.constraint(equalTo: super.view.topAnchor).isActive = true
        
    }
    
    func getDepartmentsObjects() {
            
        for departmentId in departments {
            ServiceLayer.request(route: .search(q: "art", isHighlight: nil, departmentId: departmentId.departmentId, isOnView: nil, artistOrCulture: nil, medium: nil, hasImage: true, geoLocation: nil, dateBeginAndDateEnd: nil)) { (Result) in
                    
                    switch Result {
                        
                    case .success(let data):
                        
                        guard let data = data else { return }
                        
                        guard let objectsArray = try? JSONDecoder().decode(ResponseObjects.self, from: data) else {
                            print("Deu bom nao")
                            return }
                        
                        var objectsIds = [Int]()
                        objectsIds.append(contentsOf: [
                            objectsArray.objectIDs[0],
                            objectsArray.objectIDs[1],
                            objectsArray.objectIDs[2],
                            objectsArray.objectIDs[3],
                            objectsArray.objectIDs[4],
                            objectsArray.objectIDs[5],
                            objectsArray.objectIDs[6],
                            objectsArray.objectIDs[7],
                            objectsArray.objectIDs[8],
                            objectsArray.objectIDs[9]
                        ])
                        
                        for objectId in objectsIds {
                            
                        ServiceLayer.request(route: .getArtObject(objectId: objectId)) { (Result) in
                        
                                switch Result {
                                
                                case .success(let dataObject):
                                    guard let object = dataObject else { return }
                                    guard let imageStr = try? JSONDecoder().decode(ArtObject.self, from: object
                                    ) else {
                                        print("Não foi possivel salvar o objeto")
                                        return
                                    }
                                    
                                    if self.departmentsObjects[departmentId.departmentId] != nil {
                                        
                                        self.departmentsObjects[departmentId.departmentId]?.append(contentsOf: [imageStr])
                                        
                                    } else {
                                        
                                        self.departmentsObjects[departmentId.departmentId] = [imageStr]
                                        
                                    }
                                    
                                    guard let imageUrl = URL(string: imageStr.image) else {
                                        print("Não foi possivel fazer a url do item\(objectId)")
                                        return
                                    }
                                    self.getData(from: imageUrl) { Data, _, _  in
                                            guard let imageData = Data else { return }
                                    
                                            DispatchQueue.main.async {
                                                [weak self] in
                                                if self?.departmentsData[departmentId.departmentId] != nil {
                                                    
                                                    self?.departmentsData[departmentId.departmentId]?.append(contentsOf: [UIImage(data: imageData)!])
                                                    
                                                } else {
                                                    
                                                    self?.departmentsData[departmentId.departmentId] = [UIImage(data: imageData)!]
                                                    
                                                }
                                                //self?.images.append(UIImage(data: imageData)!)
                                            }
                                            
                                        }
                                    
                                    
                                case .failure(let error):
                                    print(error)
                                    
                                }
                        
                            }
                        }
                        
                    case .failure(let error):
                        
                        print(error)
                        
                    }
                    
                }
            }
        }
        
        func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
            URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
        }
    
    
}

extension CatalogViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return 1
            
        } else {
        
        return departments.count
        
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell1 = table.dequeueReusableCell(withIdentifier: SpotlightTableViewCell.identifier, for: indexPath) as! SpotlightTableViewCell

            cell1.configure()
            cell1.backgroundColor = UIColor.clear
            return cell1
        
        } else {
        
            let cell = table.dequeueReusableCell(withIdentifier: CatalogTableViewCell.identifier, for: indexPath) as! CatalogTableViewCell
            
            let department = departments[indexPath.row]
            var imagesOfDepartment = [UIImage()]
            let departmentImagesTry = departmentsData[department.departmentId]
            if departmentImagesTry == nil {
                imagesOfDepartment = []
            } else {
                imagesOfDepartment = departmentImagesTry!
            }
            
            
            cell.set(images: imagesOfDepartment, sectionTitle: department.displayName, sectionNumber: indexPath.row + 1)
            
            cell.backgroundColor = UIColor.clear
            
            return cell
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        table.deselectRow(at: indexPath, animated: true)
        let department = departments[indexPath.row]
        var imagesOfDepartment = [UIImage()]
        let departmentImagesTry = departmentsData[department.departmentId]
        if departmentImagesTry == nil {
            imagesOfDepartment = []
        } else {
            imagesOfDepartment = departmentImagesTry!
        }
        
        let departmentArt = DepartmentArtsViewController()
        departmentArt.images = imagesOfDepartment
        departmentArt.objets = self.departmentsObjects[department.departmentId]!
        
        self.navigationController?.pushViewController(departmentArt, animated: true)
    }
    
    
    func getAllDepartments() {
            
            ServiceLayer.request(route: .getAllArtDepartments) { (Result) in
                
                switch Result {
                    
                case .success(let data):
                        
                        guard let data = data else { return }
                        guard let departmentsArray = try? JSONDecoder().decode(AllDepartaments.self, from: data) else { return }
                        
                        
                        self.departments = departmentsArray.departments
                        
                case .failure(let error):
                    print(error)
                    
                }
                
            }
            
        }
    
}
