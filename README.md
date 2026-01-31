# HackBio Stage 1 – Bioinformatics Mini Project (R)

**Author:** Busayo Tofio  
**Track:** Bioinformatics  
**Programming Language:** R  

This repository contains solutions to the HackBio Stage 1 Bioinformatics Mini Project. The project demonstrates fundamental bioinformatics reasoning, biological correctness, and basic R programming skills through two computational tasks.

---

## Project Overview

The goal of this project is to translate biological concepts into robust and reproducible R workflows. Two tasks were completed:

- GC content calculation for DNA sequences  
- Protein molecular weight estimation  

Both tasks emphasize correct biological assumptions, input validation, and clean R function design.

---

## Essay: Step-by-Step Approach to the Project

### Translating Biology into Code

Each task was approached by first understanding the biological definition and then breaking it into computational steps. Sequences were decomposed into their basic units (nucleotides or amino acids), validated, and processed using vectorized operations in R.

---

### Using Task 1 to Explain GC Content Calculation

GC content represents the proportion of guanine (G) and cytosine (C) nucleotides in a DNA sequence. Because biological data may be written in uppercase or lowercase, the function was designed to handle mixed cases.

Steps taken:
1. Convert the sequence to uppercase.
2. Split the sequence into individual nucleotides.
3. Count the number of G and C bases.
4. Compute GC percentage relative to sequence length.

---

## Task 1: Robust GC Percentage Calculator

### R Function

```r
gc_content <- function(sequence) {
  sequence <- toupper(sequence)
  nucleotides <- unlist(strsplit(sequence, ""))
  gc_count <- sum(nucleotides %in% c("G", "C"))
  gc_percent <- (gc_count / length(nucleotides)) * 100
  return(gc_percent)
}

## Using Task 2 to Explain Protein Molecular Weight Calculation

Proteins are linear chains of amino acids, each with a defined molecular weight. This task required mapping biological knowledge into a searchable structure while ensuring invalid inputs were rejected.

###Steps taken:
1. Store amino acid weights as a named numeric vector.
2. Convert input to uppercase.
3. Split the protein sequence into amino acids.
4. Validate that all characters are standard amino acids.
5. Return 0 for invalid sequences.
6. Sum weights and convert from Daltons to kiloDaltons.

## Task 2: Protein Molecular Weight Calculator

```r
protein_weight <- function(protein = "BUSAYO") {
  aa_weights <- c(
    A = 89.09, R = 174.20, N = 132.12, D = 133.10, C = 121.15,
    E = 147.13, Q = 146.15, G = 75.07, H = 155.16, I = 131.18,
    L = 131.18, K = 146.19, M = 149.21, F = 165.19, P = 115.13,
    S = 105.09, T = 119.12, W = 204.23, Y = 181.19, V = 117.15
  )

  protein <- toupper(protein)
  amino_acids <- unlist(strsplit(protein, ""))

  if (any(!amino_acids %in% names(aa_weights))) {
    return(0)
  }

  total_weight_da <- sum(aa_weights[amino_acids])
  total_weight_kda <- total_weight_da / 1000
  return(total_weight_kda)
}
### output
```r
protein_weight("MAG")
# [1] 0.31337

protein_weight("BAG")
# [1] 0

protein_weight()
# [1] 0

### Key Skills Demonstrated
1. Custom R function design
2. Input validation and error handling
3. Vectorized computation
4. Application of biological domain knowledge
5. Reproducible and readable code


##Conclusion
This project demonstrates how biological questions can be transformed into reliable computational solutions using R. By combining biological reasoning with defensive programming practices, the functions produce accurate and meaningful results suitable for bioinformatics workflows.
