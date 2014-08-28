//
//  ViewController.swift
//  WebService
//
//  Created by Rafael Luiz on 26/08/14.
//  Copyright (c) 2014 MouseTela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let titulo: NSString = "titulo"
    let conteudo: NSString = "conteudo"
    let conjuntoDados: NSMutableArray = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lendoJson()
        escrevendoJson()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func lendoJson(){
    
    var urlPath = "http://mousetela.com.br/webservice/json.php"
    var jsonURL: NSURL = NSURL(string: urlPath)
    var URLrequest: NSURLRequest = NSURLRequest(URL: jsonURL)
    var response: AutoreleasingUnsafePointer<NSURLResponse?>=nil
    
    var jsonSource: NSData =  NSURLConnection.sendSynchronousRequest(URLrequest, returningResponse: response, error:nil)
    
    let jsonObjects = NSJSONSerialization.JSONObjectWithData(jsonSource, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSMutableArray
    
    
    var dataDict: NSDictionary
    
        
       for dataDict : AnyObject in jsonObjects {
            var titulo_dados: NSString = dataDict.objectForKey("titulo") as NSString
            var conteudo_dados: NSString = dataDict.objectForKey("conteudo") as NSString
            let dicionario = [titulo: titulo_dados, conteudo: conteudo_dados]
            conjuntoDados.addObject(dicionario)

       }
    }
    
    func escrevendoJson(){
        
        for (var i = 0; i < conjuntoDados.count ; i++){
            
            var tmpDict: NSDictionary = conjuntoDados[i] as NSDictionary
            
            let descricaoTitulo: NSMutableString = tmpDict.objectForKeyedSubscript(titulo) as NSMutableString
            
            let descricaoConteudo: NSMutableString = tmpDict.objectForKeyedSubscript(conteudo) as NSMutableString
            
             println("Titulo:"+descricaoTitulo+" Conteudo:"+descricaoConteudo+"")
            

        
        }
        
    }
    
}

