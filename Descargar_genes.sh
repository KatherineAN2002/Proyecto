declare -A genes=(["Tbr1"]="10716"
["Chd7"]="79145"
["Hes6"]="55502"
["NEUROG2"]="63973")
species=("Panthera leo"
"Panthera onca"
"Panthera pardus"
"Panthera tigris"
"Panthera uncia"
"Neofelis nebulosa"
"Neofelis diardi")
 
for gene in "${!genes[@]}";do
 gene_id="${!genes[@gene]}"
 for sp in "${!species[@]}";do
  clean_sp=$(echo "$sp" | sed 's/ /_/g')
  filename="${gene}_${clean_sp}.zip"
  echo "Descargando $gene para $sp..."
  ./datasets download gene symbol "$gene_id" taxon "$sp" --filename "$filename"
 done
done

