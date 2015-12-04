# aspirateur-xpath
Aspirateur de contenu de page web, éventuellement par noeuds intermédiaires. 
Arguments :
- pages : une liste de pages html (parsées avec htmlParse du package XML)
- xpath.interm (optionnel) : adresse XPath des noeuds intermédiaires
- xpath.finaux : liste des adresses XPath des noeuds finaux
- collapse (optionnel) : caractère intermédiaire pour la concaténation (quand deux résultats ou plus pour un seul xpath final)

# aspirateur deluxe
La même chose, mais sans avoir besoin de parser les pages au préalable.
Arguments :
- adresses : un vecteur d'adresses URL
- xpath.interm (optionnel) : adresse XPath des noeuds intermédiaires
- xpath.finaux : liste des adresses XPath des noeuds finaux
- collapse (optionnel) : caractère intermédiaire pour la concaténation (quand deux résultats ou plus pour un seul xpath final)

