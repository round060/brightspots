inUrl10  <- "https://pasta.lternet.edu/package/data/eml/edi/1136/3/d3e430bc9695084b28cbb86dd6d1b4ab" 
infile10 <- tempfile()
try(download.file(inUrl10,infile10,method="curl"))
if (is.na(file.size(infile10))) download.file(inUrl10,infile10,method="auto")


dt10 <-read.csv(infile10,header=F 
                ,skip=1
                ,sep=","  
                ,quot='"' 
                , col.names=c(
                  "zoneid",     
                  "spatial_division",     
                  "year",     
                  "datacoveragepct",     
                  "precision",     
                  "nlcd_openwater11_pct",     
                  "nlcd_icesnow12_pct",     
                  "nlcd_devopen21_pct",     
                  "nlcd_devlow22_pct",     
                  "nlcd_devmed23_pct",     
                  "nlcd_devhi24_pct",     
                  "nlcd_barren31_pct",     
                  "nlcd_fordec41_pct",     
                  "nlcd_forcon42_pct",     
                  "nlcd_formix43_pct",     
                  "nlcd_shrub52_pct",     
                  "nlcd_grass71_pct",     
                  "nlcd_past81_pct",     
                  "nlcd_cultcrop82_pct",     
                  "nlcd_wetwood90_pct",     
                  "nlcd_wetemerg95_pct"    ), check.names=TRUE)

unlink(infile10)

# Fix any interval or ratio columns mistakenly read in as nominal and nominal columns read as numeric or dates read as strings

if (class(dt10$zoneid)!="factor") dt10$zoneid<- as.factor(dt10$zoneid)
if (class(dt10$spatial_division)!="factor") dt10$spatial_division<- as.factor(dt10$spatial_division)
if (class(dt10$year)=="factor") dt10$year <-as.numeric(levels(dt10$year))[as.integer(dt10$year) ]               
if (class(dt10$year)=="character") dt10$year <-as.numeric(dt10$year)
if (class(dt10$datacoveragepct)=="factor") dt10$datacoveragepct <-as.numeric(levels(dt10$datacoveragepct))[as.integer(dt10$datacoveragepct) ]               
if (class(dt10$datacoveragepct)=="character") dt10$datacoveragepct <-as.numeric(dt10$datacoveragepct)
if (class(dt10$precision)=="factor") dt10$precision <-as.numeric(levels(dt10$precision))[as.integer(dt10$precision) ]               
if (class(dt10$precision)=="character") dt10$precision <-as.numeric(dt10$precision)
if (class(dt10$nlcd_openwater11_pct)=="factor") dt10$nlcd_openwater11_pct <-as.numeric(levels(dt10$nlcd_openwater11_pct))[as.integer(dt10$nlcd_openwater11_pct) ]               
if (class(dt10$nlcd_openwater11_pct)=="character") dt10$nlcd_openwater11_pct <-as.numeric(dt10$nlcd_openwater11_pct)
if (class(dt10$nlcd_icesnow12_pct)=="factor") dt10$nlcd_icesnow12_pct <-as.numeric(levels(dt10$nlcd_icesnow12_pct))[as.integer(dt10$nlcd_icesnow12_pct) ]               
if (class(dt10$nlcd_icesnow12_pct)=="character") dt10$nlcd_icesnow12_pct <-as.numeric(dt10$nlcd_icesnow12_pct)
if (class(dt10$nlcd_devopen21_pct)=="factor") dt10$nlcd_devopen21_pct <-as.numeric(levels(dt10$nlcd_devopen21_pct))[as.integer(dt10$nlcd_devopen21_pct) ]               
if (class(dt10$nlcd_devopen21_pct)=="character") dt10$nlcd_devopen21_pct <-as.numeric(dt10$nlcd_devopen21_pct)
if (class(dt10$nlcd_devlow22_pct)=="factor") dt10$nlcd_devlow22_pct <-as.numeric(levels(dt10$nlcd_devlow22_pct))[as.integer(dt10$nlcd_devlow22_pct) ]               
if (class(dt10$nlcd_devlow22_pct)=="character") dt10$nlcd_devlow22_pct <-as.numeric(dt10$nlcd_devlow22_pct)
if (class(dt10$nlcd_devmed23_pct)=="factor") dt10$nlcd_devmed23_pct <-as.numeric(levels(dt10$nlcd_devmed23_pct))[as.integer(dt10$nlcd_devmed23_pct) ]               
if (class(dt10$nlcd_devmed23_pct)=="character") dt10$nlcd_devmed23_pct <-as.numeric(dt10$nlcd_devmed23_pct)
if (class(dt10$nlcd_devhi24_pct)=="factor") dt10$nlcd_devhi24_pct <-as.numeric(levels(dt10$nlcd_devhi24_pct))[as.integer(dt10$nlcd_devhi24_pct) ]               
if (class(dt10$nlcd_devhi24_pct)=="character") dt10$nlcd_devhi24_pct <-as.numeric(dt10$nlcd_devhi24_pct)
if (class(dt10$nlcd_barren31_pct)=="factor") dt10$nlcd_barren31_pct <-as.numeric(levels(dt10$nlcd_barren31_pct))[as.integer(dt10$nlcd_barren31_pct) ]               
if (class(dt10$nlcd_barren31_pct)=="character") dt10$nlcd_barren31_pct <-as.numeric(dt10$nlcd_barren31_pct)
if (class(dt10$nlcd_fordec41_pct)=="factor") dt10$nlcd_fordec41_pct <-as.numeric(levels(dt10$nlcd_fordec41_pct))[as.integer(dt10$nlcd_fordec41_pct) ]               
if (class(dt10$nlcd_fordec41_pct)=="character") dt10$nlcd_fordec41_pct <-as.numeric(dt10$nlcd_fordec41_pct)
if (class(dt10$nlcd_forcon42_pct)=="factor") dt10$nlcd_forcon42_pct <-as.numeric(levels(dt10$nlcd_forcon42_pct))[as.integer(dt10$nlcd_forcon42_pct) ]               
if (class(dt10$nlcd_forcon42_pct)=="character") dt10$nlcd_forcon42_pct <-as.numeric(dt10$nlcd_forcon42_pct)
if (class(dt10$nlcd_formix43_pct)=="factor") dt10$nlcd_formix43_pct <-as.numeric(levels(dt10$nlcd_formix43_pct))[as.integer(dt10$nlcd_formix43_pct) ]               
if (class(dt10$nlcd_formix43_pct)=="character") dt10$nlcd_formix43_pct <-as.numeric(dt10$nlcd_formix43_pct)
if (class(dt10$nlcd_shrub52_pct)=="factor") dt10$nlcd_shrub52_pct <-as.numeric(levels(dt10$nlcd_shrub52_pct))[as.integer(dt10$nlcd_shrub52_pct) ]               
if (class(dt10$nlcd_shrub52_pct)=="character") dt10$nlcd_shrub52_pct <-as.numeric(dt10$nlcd_shrub52_pct)
if (class(dt10$nlcd_grass71_pct)=="factor") dt10$nlcd_grass71_pct <-as.numeric(levels(dt10$nlcd_grass71_pct))[as.integer(dt10$nlcd_grass71_pct) ]               
if (class(dt10$nlcd_grass71_pct)=="character") dt10$nlcd_grass71_pct <-as.numeric(dt10$nlcd_grass71_pct)
if (class(dt10$nlcd_past81_pct)=="factor") dt10$nlcd_past81_pct <-as.numeric(levels(dt10$nlcd_past81_pct))[as.integer(dt10$nlcd_past81_pct) ]               
if (class(dt10$nlcd_past81_pct)=="character") dt10$nlcd_past81_pct <-as.numeric(dt10$nlcd_past81_pct)
if (class(dt10$nlcd_cultcrop82_pct)=="factor") dt10$nlcd_cultcrop82_pct <-as.numeric(levels(dt10$nlcd_cultcrop82_pct))[as.integer(dt10$nlcd_cultcrop82_pct) ]               
if (class(dt10$nlcd_cultcrop82_pct)=="character") dt10$nlcd_cultcrop82_pct <-as.numeric(dt10$nlcd_cultcrop82_pct)
if (class(dt10$nlcd_wetwood90_pct)=="factor") dt10$nlcd_wetwood90_pct <-as.numeric(levels(dt10$nlcd_wetwood90_pct))[as.integer(dt10$nlcd_wetwood90_pct) ]               
if (class(dt10$nlcd_wetwood90_pct)=="character") dt10$nlcd_wetwood90_pct <-as.numeric(dt10$nlcd_wetwood90_pct)
if (class(dt10$nlcd_wetemerg95_pct)=="factor") dt10$nlcd_wetemerg95_pct <-as.numeric(levels(dt10$nlcd_wetemerg95_pct))[as.integer(dt10$nlcd_wetemerg95_pct) ]               
if (class(dt10$nlcd_wetemerg95_pct)=="character") dt10$nlcd_wetemerg95_pct <-as.numeric(dt10$nlcd_wetemerg95_pct)

# Convert Missing Values to NA for non-dates

dt10$nlcd_openwater11_pct <- ifelse((trimws(as.character(dt10$nlcd_openwater11_pct))==trimws("NA")),NA,dt10$nlcd_openwater11_pct)               
suppressWarnings(dt10$nlcd_openwater11_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_openwater11_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_openwater11_pct))
dt10$nlcd_icesnow12_pct <- ifelse((trimws(as.character(dt10$nlcd_icesnow12_pct))==trimws("NA")),NA,dt10$nlcd_icesnow12_pct)               
suppressWarnings(dt10$nlcd_icesnow12_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_icesnow12_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_icesnow12_pct))
dt10$nlcd_devopen21_pct <- ifelse((trimws(as.character(dt10$nlcd_devopen21_pct))==trimws("NA")),NA,dt10$nlcd_devopen21_pct)               
suppressWarnings(dt10$nlcd_devopen21_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_devopen21_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_devopen21_pct))
dt10$nlcd_devlow22_pct <- ifelse((trimws(as.character(dt10$nlcd_devlow22_pct))==trimws("NA")),NA,dt10$nlcd_devlow22_pct)               
suppressWarnings(dt10$nlcd_devlow22_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_devlow22_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_devlow22_pct))
dt10$nlcd_devmed23_pct <- ifelse((trimws(as.character(dt10$nlcd_devmed23_pct))==trimws("NA")),NA,dt10$nlcd_devmed23_pct)               
suppressWarnings(dt10$nlcd_devmed23_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_devmed23_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_devmed23_pct))
dt10$nlcd_devhi24_pct <- ifelse((trimws(as.character(dt10$nlcd_devhi24_pct))==trimws("NA")),NA,dt10$nlcd_devhi24_pct)               
suppressWarnings(dt10$nlcd_devhi24_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_devhi24_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_devhi24_pct))
dt10$nlcd_barren31_pct <- ifelse((trimws(as.character(dt10$nlcd_barren31_pct))==trimws("NA")),NA,dt10$nlcd_barren31_pct)               
suppressWarnings(dt10$nlcd_barren31_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_barren31_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_barren31_pct))
dt10$nlcd_fordec41_pct <- ifelse((trimws(as.character(dt10$nlcd_fordec41_pct))==trimws("NA")),NA,dt10$nlcd_fordec41_pct)               
suppressWarnings(dt10$nlcd_fordec41_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_fordec41_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_fordec41_pct))
dt10$nlcd_forcon42_pct <- ifelse((trimws(as.character(dt10$nlcd_forcon42_pct))==trimws("NA")),NA,dt10$nlcd_forcon42_pct)               
suppressWarnings(dt10$nlcd_forcon42_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_forcon42_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_forcon42_pct))
dt10$nlcd_formix43_pct <- ifelse((trimws(as.character(dt10$nlcd_formix43_pct))==trimws("NA")),NA,dt10$nlcd_formix43_pct)               
suppressWarnings(dt10$nlcd_formix43_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_formix43_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_formix43_pct))
dt10$nlcd_shrub52_pct <- ifelse((trimws(as.character(dt10$nlcd_shrub52_pct))==trimws("NA")),NA,dt10$nlcd_shrub52_pct)               
suppressWarnings(dt10$nlcd_shrub52_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_shrub52_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_shrub52_pct))
dt10$nlcd_grass71_pct <- ifelse((trimws(as.character(dt10$nlcd_grass71_pct))==trimws("NA")),NA,dt10$nlcd_grass71_pct)               
suppressWarnings(dt10$nlcd_grass71_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_grass71_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_grass71_pct))
dt10$nlcd_past81_pct <- ifelse((trimws(as.character(dt10$nlcd_past81_pct))==trimws("NA")),NA,dt10$nlcd_past81_pct)               
suppressWarnings(dt10$nlcd_past81_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_past81_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_past81_pct))
dt10$nlcd_cultcrop82_pct <- ifelse((trimws(as.character(dt10$nlcd_cultcrop82_pct))==trimws("NA")),NA,dt10$nlcd_cultcrop82_pct)               
suppressWarnings(dt10$nlcd_cultcrop82_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_cultcrop82_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_cultcrop82_pct))
dt10$nlcd_wetwood90_pct <- ifelse((trimws(as.character(dt10$nlcd_wetwood90_pct))==trimws("NA")),NA,dt10$nlcd_wetwood90_pct)               
suppressWarnings(dt10$nlcd_wetwood90_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_wetwood90_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_wetwood90_pct))
dt10$nlcd_wetemerg95_pct <- ifelse((trimws(as.character(dt10$nlcd_wetemerg95_pct))==trimws("NA")),NA,dt10$nlcd_wetemerg95_pct)               
suppressWarnings(dt10$nlcd_wetemerg95_pct <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt10$nlcd_wetemerg95_pct))==as.character(as.numeric("NA"))),NA,dt10$nlcd_wetemerg95_pct))


# Here is the structure of the input data frame:
str(dt10)                            
attach(dt10)                            
# The analyses below are basic descriptions of the variables. After testing, they should be replaced.                 

"summary(zoneid)
summary(spatial_division)
summary(year)
summary(datacoveragepct)
summary(precision)
summary(nlcd_openwater11_pct)
summary(nlcd_icesnow12_pct)
summary(nlcd_devopen21_pct)
summary(nlcd_devlow22_pct)
summary(nlcd_devmed23_pct)
summary(nlcd_devhi24_pct)
summary(nlcd_barren31_pct)
summary(nlcd_fordec41_pct)
summary(nlcd_forcon42_pct)
summary(nlcd_formix43_pct)
summary(nlcd_shrub52_pct)
summary(nlcd_grass71_pct)
summary(nlcd_past81_pct)
summary(nlcd_cultcrop82_pct)
summary(nlcd_wetwood90_pct)
summary(nlcd_wetemerg95_pct) 
# Get more details on character variables

summary(as.factor(dt10$zoneid)) 
summary(as.factor(dt10$spatial_division))"
detach(dt10)               

'watershed<-filter(dt10, spatial_division=="ws")
head(watershed)
write.csv(watershed, "lagos_watershed_lulc.csv", row.names = FALSE)'


shoreline=filter(dt10, spatial_division=="buff100")
head(shoreline)
write.csv(shoreline, "lagos_shoreline_lulc.csv", row.names = FALSE)




