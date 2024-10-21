ntaxa <- c(20, 50, 100, 200)

nsimul <- 100
library(stringr)
library(readr)


for(itaxa in ntaxa) {
  for(isimul in seq(0, nsimul-1)) {
    file_path <- paste("output/output_", itaxa, "/Validation_Sim_",isimul,"/sequences.tsv", sep="")
    
    pomofile <- read_delim(file_path, 
                            delim = "\t", escape_double = FALSE, 
                            col_names = FALSE, col_types = cols(X2 = col_character()), 
                            trim_ws = TRUE)
    
    for (i in seq(1, nrow(pomofile))) {
    
      if ((!(pomofile$X2[i] == "0")) && (!(pomofile$X2[i] == "1"))) {
       
        pomofile$X2[i] <- "(0 1)"
      }
    }
    
    write.table(pomofile, sep = "\t", 
                file = paste("output/output_", itaxa, "/Validation_Sim_", isimul,"/sequences.csv", sep = ""),
                row.names=FALSE, col.names=FALSE, quote = F,
              )
    csv_context <-read_lines(paste("output/output_", itaxa, "/Validation_Sim_",isimul,"/sequences.csv", sep = ""))
    header <- str_interp("
#NEXUS

Begin data;
Dimensions ntax=${itaxa} nchar=1;
Format datatype=Standard symbols=\"01\" missing=? gap=-;
Matrix
  ")
    ender <- "
;
End;"
    update_nexus <- c(header, csv_context, ender)
    write_lines(update_nexus,
                file = paste("output/output_", itaxa, "/Validation_Sim_",isimul,"/sequences.nex", sep = ""))
  }
}

q()
