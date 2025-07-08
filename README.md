![alt text](https://st4.depositphotos.com/1594920/38712/i/950/depositphotos_387122742-stock-photo-large-group-many-wild-cats.jpg)
# Genes y cerebro: filogenia de los felinos
Este estudio explora la evolución cerebral del género Panthera mediante análisis filogenéticos de genes relacionados con el desarrollo neurobiológico.
*************** 
## Introducción
La evolución cerebral en felinos permite explorar vínculos entre genética y comportamiento. Se ha sugerido que una mayor encefalización, al implicar más neuronas por unidad de masa, podría reflejar mayor capacidad cognitiva. Dentro del orden Carnivora, los felinos ofrecen un modelo idóneo por su filogenia bien conocida y registro fósil amplio[^1]. Investigaciones recientes han mostrado que la sociabilidad influye en el volumen relativo de la corteza anterior (CA), con leones y guepardos —ambos sociales— mostrando los valores más altos y bajos, respectivamente. Además, se ha identificado dimorfismo sexual en leones, con hembras presentando mayor volumen relativo de CA. Sin embargo, la función exacta de esta región cerebral en felinos sigue siendo poco comprendida y requiere más estudios[^2]. Este proyecto propone reconstruir un árbol filogenético basado en genes asociados al desarrollo cerebral en felinos, con el fin de identificar patrones evolutivos que puedan estar asociados a cambios del encéfalo. Se seleccionarán cuatro genes clave relacionados al desarrollo cerebral cuyas secuencias serán descargadas desde la base de datos NCBI. Estas secuencias serán alineadas usando MUSCLE, y se generarán árboles filogenéticos para cada gen con IQ-TREE. Luego, se generará un árbol consenso mediante ASTRAL editando archivos en Atom si es necesario. Finalmente, el árbol consenso, enriquecido con los gene concordance factors, será graficado en FigTree.
![alt text](https://previews.123rf.com/images/eraxion/eraxion2107/eraxion210700010/171103216-3d-rendered-illustration-of-the-cat-anatomy-the-brain.jpg)
****************
## Programas 
* Iqtree
* Figtree
* Muscle
* Astral
* Atom
* NCBI
**************
## Cómo usar el programa
1. Se escogieron los siguientes genes por estar directamente relacionados al desarrollo cerebral en los mamíferos: 
    * Tbr1
    * Chd7
    * Hes6
    * NEUROG2
2. El género Panthera cuenta con 5 especies, en esta ocasión trabajaremos con 7 especies pues las otras dos corresponden al género Neofelis el cuál será nuestro grupo externo. Debido a que las descargas de genes desde NCBI se pueden realizar a nivel de especie y no de género se creó el programa **Descargar_genes.sh, que se encuentra adjunto en los documentos de este proyecto.** Este es un archivo ejecutable que contiene lo siguiente:
 
* Genes con su ID
 
genes=(["Tbr1"]="10716"
["Chd7"]="79145"
["Hes6"]="55502"
["NEUROG2"]="63973")

* Especies (5 género Panthera) (2 género Neofelis)

species=("Panthera leo"
"Panthera onca"
"Panthera pardus"
"Panthera tigris"
"Panthera uncia"
"Neofelis nebulosa"
"Neofelis diardi")

* Un loop para descargar los genes de cada especie

for gene in "${!genes[@]}";do
 gene_id="${!genes[@gene]}"
 for sp in "${!species[@]}";do
  clean_sp=$(echo "$sp" | sed 's/ /_/g')
  filename="${gene}_${clean_sp}.zip"
  echo "Descargando $gene para $sp..."
  ./datasets download gene symbol "$gene_id" taxon "$sp" --filename "$filename" 
********************
## Autor
* Katherine Aguirre _Estudiante de Biologìa en la Pontificia Universidad Catòlica del Ecuador_
***************
## Referencias

[^1]:Finarelli, John A., y John J. Flynn. 2009. «Brain-size Evolution And Sociality In Carnivora». Proceedings Of The National Academy Of Sciences 106 (23): 9345-49. https://doi.org/10.1073/pnas.0901780106.

[^2]:Sakai, Sharleen T., Bradley M. Arsznov, Ani E. Hristova, Elise J. Yoon, y Barbara L. Lundrigan. 2016. «Big Cat Coalitions: A Comparative Analysis Of Regional Brain Volumes In Felidae». Frontiers In Neuroanatomy 10 (octubre). https://doi.org/10.3389/fnana.2016.00099.

