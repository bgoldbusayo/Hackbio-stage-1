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

