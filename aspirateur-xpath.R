## 2/11/2015 - Aspirateur tout-terrain : xpath -> data.frame
## A partir d'une liste de pages parsées et d'une liste de xpath, va tout
## chercher et le met dans une data.frame (avec check de longueur à chaque fois
## pour NA ou concaténation). 
## Si on spécifie xpath.interm (xpath intermédiaire), fonctionne noeud
## intermédiaire par noeud intermédiaire.

aspirateur <- function(pages, xpath.finaux, xpath.interm= "/html", collapse= " | ") {
  if (!is.list(pages)) stop("L'élément 'pages' doit être une liste.")
  if (!is.list(xpath.finaux)) stop("L'élément 'xpath.finaux' doit être une liste.")
  do.call(rbind, lapply(pages, function(la.page) {
    noeuds <- xpathApply(la.page, xpath.interm) 
    do.call(rbind, lapply(noeuds, function(le.noeud) {
      brut <- lapply(xpath.finaux, function(le.xpath) 
        xpathSApply(le.noeud, le.xpath, function(x) if ("XMLAttributeValue" %in% class(x)) { x } else xmlValue(x)))
      as.data.frame(lapply(brut, function(vect) { 
        if (!length(vect)) { NA } else if (length(vect) > 1) { paste(vect, collapse= collapse) } else vect
      }))
    }))
  }))
}


## Exemple d'utilisation : craigslist
# library(RCurl)
# library(XML)
# adresses <- paste0("http://sfbay.craigslist.org/search/zip?s=", seq(100,500, by= 100))
# pages <- lapply(adresses, function(x) {Sys.sleep(1); htmlParse(getURL(x)) })
# names(pages) <- adresses
# 
# xpath.interm <- "//span[@class='txt']"
# xpath.finaux <- list(intitule= ".//a", date= ".//time", ville= ".//small")
# craig <- aspirateur(pages, xpath.finaux, xpath.interm)
