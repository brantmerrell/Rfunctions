

##subset.R
identical (subset(care_outcome$Hospital.Name, care_outcome$State=="TX"),
           subset(care_outcome, care_outcome$State=="TX", Hospital.Name))

identical(x, y, num.eq = TRUE, single.NA = TRUE, attrib.as.set = TRUE,
          ignore.bytecode = TRUE, ignore.environment = FALSE)