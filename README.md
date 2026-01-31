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
