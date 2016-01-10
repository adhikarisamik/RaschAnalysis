clear
set more off
global path = "/Users/samikadhikari/Dropbox (Personal)/WB/noncognitivedata/RaschAnalysis"

use "$path/Employee.dta"

*Module E
forval i=1/24 {
	replace e1_`i'=. if e1_`i'==96
}

* Five factors
global extraversion "e1_1 e1_4 e1_20"
global conscientiousness "e1_2 e1_12 e1_17"
global openness "e1_3 e1_11 e1_14"
global emotionalstability "e1_5 e1_10 e1_18"
global agreeableness "e1_9 e1_16 e1_19"

global bigfive "e1_1 e1_4 e1_20 e1_2 e1_12 e1_17 e1_3 e1_11 e1_14 e1_5 e1_10 e1_18 e1_9 e1_16 e1_19"
global noncog "e1_1 - e1_24"
foreach var of varlist $noncog{
              local label : variable label `var'
			  lab var `var' `"`=substr("`label'",25,.)'"'
}

lab var e1_3 "do you come up with ideas other people haven't thought of before?"
lab var e1_23 "do you ask for help when you don’t understand something?"

*Reverse some questions (to make scales consistent)

//Extraversion
replace e1_4=5-e1_4 /*reversed*/

//Conscientiousness
replace e1_12=5-e1_12 /*reversed*/

//Emotional Stability
replace e1_10=5-e1_10 /*reversed*/
replace e1_18=5-e1_18 /*reversed*/

*Cronbach's alpha (Measure of reliability and unidimensionality(?) )

//Extraversion: 1, 4, 20
alpha e1_1 e1_4 e1_20

//Conscientiousness 2,12,17
alpha e1_2 e1_12 e1_17

//Openness to experience: 3, 11, 14
alpha e1_3 e1_11 e1_14

//Emotional Stability: 5, 10, 18
alpha e1_5 e1_10 e1_18

//Agreeableness: 9, 16, 19
alpha e1_9 e1_16 e1_19

//Overall

alpha $bigfive

*Summarize mean, sd, min, max for each question
su $extraversion
su $conscientiousness
su $openness
su $emotionalstability
su $agreeableness


*Create new variables based on BF traits

*Agreeableness
gen ag1 = e1_9 
gen ag2 = e1_16
gen ag3 = e1_19

*Conscientiousness
gen co1 = e1_2
gen co2 = e1_12
gen co3 = e1_17

*Emotional Stablity
gen em1 = e1_5
gen em2 = e1_10
gen em3 = e1_18

*Extraversion
gen ex1 = e1_1
gen ex2 = e1_4
gen ex3 = e1_20

*Openness
gen op1 = e1_3
gen op2 = e1_11
gen op3 = e1_14

*Rescale from 0-3 to transfer to R
foreach var of varlist ag1 ag2 ag3 co1 co2 co3 em1 em2 em3 ex1 ex2 ex3 op1 op2 op3{
replace `var' = `var'-1
}

*Data for Rasch Rating Scale Model using agreeableness in R
outsheet ag1 ag2 ag3 using "$path/rsmagreeableness.csv", comma replace
outsheet co1 co2 co3 using "$path/rsmconscientiousness.csv", comma replace
outsheet em1 em2 em3 using "$path/rsmemstability.csv", comma replace
outsheet ex1 ex2 ex3 using "$path/rsmextraversion.csv", comma replace
outsheet op1 op2 op3 using "$path/rsmopenness.csv", comma replace
















