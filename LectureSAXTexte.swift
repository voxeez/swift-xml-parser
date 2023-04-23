import Foundation

class LectureSAXTexte : NSObject, XMLParserDelegate{

    var txt:String = ""
    var xmlAnalyser:XMLParser?

    init(xmlPath:URL){
        xmlAnalyser = XMLParser(contentsOf:xmlPath)
        xmlAnalyser?.delegate = self
        var xmlReading_ok = xmlAnalyser?.parse()
        if xmlReading_ok{
            print("Analyse Ok !")
        }
        else{
            print("Analyse error")
        }
    }

    func parser(_ parser:XMLParser, didStartElement elementName:String, namespaceURI:String?, qualifiedName qName:String?, attributes attributeDict:[String:String]=[:]){
        strElement = elementName
        if (strElement == "Texte"){
            txt += "(t "
        }
        else if (elementName == "Liste"){
            txt += "(l "
        }
        else if (elementName == "Mot"){
            var mots = "m:"
            mots += attributesDict["nom"]
            txt += mots
        }
    }

    func parser(_ parser:XMLParser, didStartElement elementName:String, namespaceURI:String?, qualifiedName qName:String?, attributes attributeDict:[String:String]=[:]){
        strElement = elementName
        if (strElement == "Texte" || elementName == "Liste"){
            txt += ")"
        }
        
    }

    func parser(_ parser:XMLParser, foundCharacters string:String){
        let data = string.trimmingCharacters(in:CharacterSet.whitespacesAndNewlines)
        if (!data.isEmpty){
            
        }
    }

}

var urlPath = URL(fileURLWithPath:"texte.xml")
var saxAnalyser = LectureSAXTexte(xmlPath:urlPath)
print(saxAnalyser.txt)