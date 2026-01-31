# Hackbio-stage-1
\# Bioinformatics Mini Project (R)

\## Task 1: Robust GC Percentage Calculator

\### Objective

Create an R function that calculates the GC content (%) of a nucleotide sequence and correctly handles \*\*both uppercase and lowercase\*\* inputs.

For example, \`GCATTTAT\` and \`gcaTTTAT\` should both return \*\*25%\*\*.

\### R Function

\`\`\`r

gc_content <- function(sequence) {

\# Convert sequence to uppercase to handle mixed cases

sequence <- toupper(sequence)

\# Split sequence into individual nucleotides

nucleotides <- unlist(strsplit(sequence, ""))

\# Count G and C nucleotides

gc_count <- sum(nucleotides %in% c("G", "C"))

\# Calculate GC percentage

gc_percent <- (gc_count / length(nucleotides)) \* 100

return(gc_percent)

}

Example

gc_content("GCATTTAT")

\# \[1\] 25

gc_content("gcaTTTAT")

\# \[1\] 25

\---

Task 2: Protein Molecular Weight Calculator

Objective

Write an R function that:

Returns the molecular weight of a protein in kiloDaltons (kDa)

Accepts your name as the default input

Returns 0 if the sequence contains any non-protein character (e.g., B)

\---

R Function

protein_weight <- function(protein = "BUSAYO") {

\# Amino acid molecular weights (Da)

aa_weights <- c(

A = 89.09, R = 174.20, N = 132.12, D = 133.10, C = 121.15,

E = 147.13, Q = 146.15, G = 75.07, H = 155.16, I = 131.18,

L = 131.18, K = 146.19, M = 149.21, F = 165.19, P = 115.13,

S = 105.09, T = 119.12, W = 204.23, Y = 181.19, V = 117.15

)

\# Convert input to uppercase

protein <- toupper(protein)

\# Split protein sequence into individual amino acids

amino_acids <- unlist(strsplit(protein, ""))

\# Check for invalid amino acids

if (any(!amino_acids %in% names(aa_weights))) {

return(0)

}

\# Sum molecular weights (Da)

total_weight_da <- sum(aa_weights\[amino_acids\])

\# Convert to kiloDaltons

total_weight_kda <- total_weight_da / 1000

return(total_weight_kda)

}

Example

protein_weight("MAG")

\# \[1\] 0.31337

protein_weight("BAG")

\# \[1\] 0

protein_weight()

\# \[1\] 0

\---

Essay: Step-by-Step Recipe for the Protein Weight Calculator in R

Understanding the Task

The goal was to design a custom R function that computes the molecular weight of a protein sequence while ensuring biological correctness. This required handling invalid amino acids, supporting flexible user input, and returning results in standard biochemical units (kDa).

\---

Step 1: Encoding Amino Acid Knowledge

The amino acid table was converted into a named numeric vector, where each one-letter amino acid code serves as a key and its molecular weight as the value. This allows fast and reliable lookup during calculations.

Example

aa_weights\["M"\]

\# 149.21

\---

Step 2: Designing the Function Interface

The function protein_weight() was created with a default argument ("BUSAYO"). This demonstrates how default parameters work in R and also allows testing of the input-validation logic.

\---

Step 3: Standardizing User Input

Because users may provide lowercase or mixed-case sequences, the input was converted to uppercase using toupper(). This ensures consistent matching against the amino acid table.

\---

Step 4: Splitting the Protein into Components

Proteins are linear chains of amino acids. The function uses strsplit() to break the input string into individual characters, forming a vector of amino acids.

Example

unlist(strsplit("MAG", ""))

\# "M" "A" "G"

\---

Step 5: Validating the Sequence

To prevent biologically invalid results, the function checks whether every character exists in the amino acid weight table. If any invalid character (such as B) is detected, the function immediately returns 0.

Example

protein_weight("BAG")

\# 0

\---

Step 6: Calculating Molecular Weight

For valid sequences, the molecular weights of individual amino acids are retrieved and summed to obtain the total molecular weight in Daltons.

\---

Step 7: Unit Conversion

Finally, the total molecular weight is divided by 1000 to convert from Daltons (Da) to kiloDaltons (kDa), which is the standard unit used in protein biochemistry.

\---

Conclusion

This solution demonstrates how biological domain knowledge can be translated into a robust computational workflow using R. By combining vectorization, input validation, and custom functions, the protein weight calculator produces accurate and biologically meaningful results while guarding against invalid inputs.
