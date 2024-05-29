# A treemap R script produced by the Revigo server at http://revigo.irb.hr/
# If you found Revigo useful in your work, please cite the following reference:
# Supek F et al. "REVIGO summarizes and visualizes long lists of Gene Ontology
# terms" PLoS ONE 2011. doi:10.1371/journal.pone.0021800

# author: Anton Kratz <anton.kratz@gmail.com>, RIKEN Omics Science Center, Functional Genomics Technology Team, Japan
# created: Fri, Nov 02, 2012  7:25:52 PM
# last change: Fri, Nov 09, 2012  3:20:01 PM

# -----------------------------------------------------------------------------
# If you don't have the treemap package installed, uncomment the following line:
# install.packages( "treemap" );
library(treemap) 								# treemap package by Martijn Tennekes

# Set the working directory if necessary
# setwd("C:/Users/username/workingdir");

# --------------------------------------------------------------------------
# Here is your data from Revigo. Scroll down for plot configuration options.

revigo.names <- c("term_ID","description","frequency","value","uniqueness","dispensability","representative");
revigo.data <- rbind(c("GO:0007015","actin filament organization",0.48603936663276176,1.1378269888749117,0.9505026045049068,0.00844835,"actin filament organization"),
c("GO:0043547","positive regulation of GTPase activity",0.0008897712001421268,1.4279243035982891,0.8907133823923695,0.09688553,"positive regulation of GTPase activity"),
c("GO:0048015","phosphatidylinositol-mediated signaling",0.07866464715716376,2.2672431930966277,0.793163358436949,0.0069417,"phosphatidylinositol-mediated signaling"),
c("GO:0006887","exocytosis",0.34307950748970456,1.3211072511721285,0.9662855662514366,0.21409427,"phosphatidylinositol-mediated signaling"),
c("GO:0007186","G protein-coupled receptor signaling pathway",1.4238039872988981,1.0019674521517166,0.7515569225047983,0.59760635,"phosphatidylinositol-mediated signaling"),
c("GO:0035556","intracellular signal transduction",4.1384737362710275,1.4437668229900869,0.7356272209251645,0.43011621,"phosphatidylinositol-mediated signaling"),
c("GO:0045724","positive regulation of cilium assembly",0.013114882426471625,1.225525677513908,0.7626815455041422,0.36753233,"phosphatidylinositol-mediated signaling"),
c("GO:0050804","modulation of chemical synaptic transmission",0.2553224338579582,2.1651227323554245,0.7579493683339305,0.15693964,"phosphatidylinositol-mediated signaling"),
c("GO:0051209","release of sequestered calcium ion into cytosol",0.07810268639917926,2.043363610004348,0.7747013451331215,0.14394235,"phosphatidylinositol-mediated signaling"),
c("GO:0051897","positive regulation of phosphatidylinositol 3-kinase/protein kinase B signal transduction",0.026927286320090678,1.1569441223280819,0.7248625028633501,0.53055915,"phosphatidylinositol-mediated signaling"),
c("GO:0060124","positive regulation of growth hormone secretion",0.002711214183258558,1.3602925250179079,0.6912136984311792,0.52864753,"phosphatidylinositol-mediated signaling"),
c("GO:0060999","positive regulation of dendritic spine development",0.006506914039820538,2.185470603957889,0.8063429106896178,0.11441551,"phosphatidylinositol-mediated signaling"),
c("GO:1905274","regulation of modification of postsynaptic actin cytoskeleton",0.0002045734338276912,1.4828689870602823,0.8360762978583658,0.10167952,"phosphatidylinositol-mediated signaling"),
c("GO:0048820","hair follicle maturation",0.0004264000488215732,1.4171038407894778,0.9573633261118903,-0,"hair follicle maturation"),
c("GO:0031175","neuron projection development",0.5855261387173512,1.2732852088768594,0.9087987957114868,0.36635935,"hair follicle maturation"),
c("GO:0051402","neuron apoptotic process",0.022589343626876986,1.472537508741683,0.9920017498046001,0.00641452,"neuron apoptotic process"),
c("GO:0061621","canonical glycolysis",0.032421192151439154,3.348721986001856,0.9485730138585311,0,"canonical glycolysis"),
c("GO:0046488","phosphatidylinositol metabolic process",0.5598188987797269,2.1475040255961786,0.9466606260309881,0.3810578,"canonical glycolysis"));

stuff <- data.frame(revigo.data);
names(stuff) <- revigo.names;

stuff$value <- as.numeric( as.character(stuff$value) );
stuff$frequency <- as.numeric( as.character(stuff$frequency) );
stuff$uniqueness <- as.numeric( as.character(stuff$uniqueness) );
stuff$dispensability <- as.numeric( as.character(stuff$dispensability) );

# by default, outputs to a PDF file
pdf( file="revigo_treemap.pdf", width=16, height=9 ) # width and height are in inches

# check the tmPlot command documentation for all possible parameters - there are a lot more
treemap(
  stuff,
  index = c("representative","description"),
  vSize = "value",
  type = "categorical",
  vColor = "representative",
  title = "Revigo TreeMap",
  inflate.labels = FALSE,      # set this to TRUE for space-filling group labels - good for posters
  lowerbound.cex.labels = 0,   # try to draw as many labels as possible (still, some small squares may not get a label)
  bg.labels = "#CCCCCCAA",   # define background color of group labels
								 # "#CCCCCC00" is fully transparent, "#CCCCCCAA" is semi-transparent grey, NA is opaque
  position.legend = "none"
)

dev.off()

