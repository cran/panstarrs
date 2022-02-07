## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(panstarrs)
library(dplyr)
library(magrittr)

## -----------------------------------------------------------------------------
coords <- ps1_mast_resolve('KQ Uma')
coords

## -----------------------------------------------------------------------------
df_cone <- ps1_cone(ra = coords$ra, 
               dec = coords$decl,
               r_arcmin = 0.01,
               table = 'mean',
               release = 'dr2')
df_cone %>% select(matches('[grizy]MeanPSFMag$'))

## -----------------------------------------------------------------------------
df_cross <- ps1_crossmatch(ra = coords$ra, 
               dec = coords$decl,
               r_arcmin = 0.01,
               table = 'mean',
               release = 'dr2')
df_cross %>% select(matches('[grizy]MeanPSFMag$'))

## -----------------------------------------------------------------------------
ps1_crossmatch(ra = c(268.70342, 168.87258), 
              dec = c(71.54292, 60.75153),
              table= 'mean',
              release = 'dr2') %>% 
  arrange(`_searchID_`, dstArcSec) %>% 
  select(1:4,7)

