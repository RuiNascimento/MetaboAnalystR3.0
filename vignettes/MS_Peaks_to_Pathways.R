## ----eval=F-------------------------------------------------------------------
#  library(MetaboAnalystR)
#  
#  # Create objects for storing processed data from the MS peaks to pathways module
#  mSet <- InitDataObjects("mass_all", "mummichog", FALSE)
#  
#  # Set the format of the peak list, contains m.z, p.value, and t.score
#  SetPeakFormat("mpt")
#  
#  # Set parameters for analysis, in this case the mass accuracy is set to 5 ppm, the mode of the MS instrument is negative
#  mSet <- UpdateInstrumentParameters(mSet, 5, "negative");
#  
#  # Read in peak-list data
#  mSet <- Read.PeakListData(mSet, "https://www.metaboanalyst.ca/MetaboAnalyst/resources/data/mummichog_ibd.txt");
#  
#  # Sanity check of the uploaded data
#  mSet <- SanityCheckMummichogData(mSet)
#  
#  # Perform the mummichog algorithm, in this case the pathway library is from the human MFN model. First set the
#  # algorithm to be used to mummichog, then set the p-value cutoff. We're setting the version to "v1"
#  # as this data does not contain retention time information.
#  # This function may take sometime for processing, and will output the pathway-results and the compound matching tables in your working directory
#  mSet<-SetPeakEnrichMethod(mSet, "mum", "v1")
#  mSet<-SetMummichogPval(mSet, 0.2)
#  mSet<-PerformPSEA(mSet, "hsa_mfn", "current", permNum = 1000)
#  mSet<-PlotPeaks2Paths(mSet, "peaks_to_paths_0_", "png", 72, width=NA)
#  
#  # To view the results of the pathway analysis in R, use mSet$mummi.resmat
#  
#  # Use this function to view a table of the significant / non-significant compound hits and m/z matching details in a selected pathway
#  mSet <- GetMummichogPathSetDetails(mSet, "Vitamin E metabolism")
#  
#  # Use this function to view a table of matching details (i.e. adducts, t-scores, m.z) for a compound
#  mSet <- GetCompoundDetails(mSet, "CE5843")
#  

## ---- eval=FALSE--------------------------------------------------------------
#  # Create objects for storing processed data from the MS peaks to pathways module
#  mSet<-InitDataObjects("mass_all", "mummichog", FALSE)
#  
#  # Set peak formart - contains m/z features, p-values and t-scores
#  SetPeakFormat("mpt")
#  
#  mSet<-UpdateInstrumentParameters(mSet, 5.0, "mixed");
#  
#  mSet<-Read.PeakListData(mSet, "https://www.metaboanalyst.ca/MetaboAnalyst/resources/data/mummichog_mixed.txt");
#  
#  mSet<-SanityCheckMummichogData(mSet)
#  
#  # Customize currency
#  curr.vec <- c("Water (C00001)","Proton (C00080)","Oxygen (C00007)","NADPH (C00005)","NADP (C00006)","NADH (C00004)","NAD (C00003)","Adenosine triphosphate (C00002)","Pyrophosphate (C00013)","Phosphate (C00009)","Carbon dioxide (C00011)","Hydrogen (C00282)","Hydrogen peroxide (C00027)","Sodium (C01330)")
#  
#  # Map selected currency to user's data
#  mSet<-Setup.MapData(mSet, curr.vec);
#  mSet<-PerformCurrencyMapping(mSet)
#  
#  # Now customize adducts
#  add.vec <- c("M [1+]","M+H [1+]","M+2H [2+]","M+3H [3+]","M+Na [1+]","M+H+Na [2+]","M+K [1+]","M+H2O+H [1+]","M-H2O+H [1+]","M-H4O2+H [1+]","M(C13)+H [1+]","M(C13)+2H [2+]","M(C13)+3H [3+]","M(Cl37)+H [1+]","M-NH3+H [1+]","M-CO+H [1+]","M-CO2+H [1+]","M-HCOOH+H [1+]","M+HCOONa [1+]","M-HCOONa+H [1+]","M+NaCl [1+]","M-C3H4O2+H [1+]","M+HCOOK [1+]","M-HCOOK+H [1+]","M-H [1-]","M-2H [2-]","M-H2O-H [1-]","M-H+O [1-]","M+K-2H [1-]","M+Na-2H [1- ]","M+Cl [1-]","M+Cl37 [1-]","M+HCOO [1-]","M+CH3COO [1-]")
#  
#  # Set up the selected adducts
#  mSet<-Setup.AdductData(mSet, add.vec);
#  mSet<-PerformAdductMapping(mSet, "mixed")
#  
#  # Perform mummichog algorithm using selected currency and adducts, using Version1 of the mummichog algorithm
#  mSet<-SetPeakEnrichMethod(mSet, "mum", "v1")
#  
#  mSet<-SetMummichogPval(mSet, 1.0E-5)
#  
#  mSet<-PerformPSEA(mSet, "hsa_mfn", "current", 100)
#  
#  mSet<-PlotPeaks2Paths(mSet, "peaks_to_paths_0_", "png", 72, width=NA)
#  

## ---- eval=FALSE--------------------------------------------------------------
#  
#  mSet<-InitDataObjects("mass_all", "mummichog", FALSE)
#  SetPeakFormat("mprt")
#  mSet<-UpdateInstrumentParameters(mSet, 5.0, "negative");
#  mSet<-Read.PeakListData(mSet, "https://www.metaboanalyst.ca/MetaboAnalyst/resources/data/mummichog_rt.txt");
#  mSet<-SanityCheckMummichogData(mSet)
#  mSet<-SetPeakEnrichMethod(mSet, "mum", "v2")
#  mSet<-SetMummichogPval(mSet, 0.2)
#  mSet<-PerformPSEA(mSet, "hsa_mfn", "current", 100)
#  mSet<-PlotPeaks2Paths(mSet, "peaks_to_paths_0_", "png", 300, width=NA)
#  

## ---- eval=FALSE--------------------------------------------------------------
#  
#  # Disable force primary ion
#  mSet <- UpdateInstrumentParameters(mSet, instrumentOpt, msModeOpt,
#                                     force_primary_ion = "no", rt_frac = 0.02,
#                                     rt_tol = NA)
#  
#  # Change retention time fraction when calculating the retention time window
#  mSet <- UpdateInstrumentParameters(mSet, instrumentOpt, msModeOpt,
#                                     force_primary_ion = "yes", rt_frac = 0.025,
#                                     rt_tol = NA)
#  
#  # Set the retention time window (in seconds)
#  mSet <- UpdateInstrumentParameters(mSet, instrumentOpt, msModeOpt,
#                                     force_primary_ion = "yes", rt_frac = 0.02,
#                                     rt_tol = 25)

## ---- eval=FALSE--------------------------------------------------------------
#  PreparePDFReport(mSet, "My Name")

