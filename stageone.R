# 1. Load the library (already seen in your console)
library(readxl)

# 2. Run the function on a single column
# This creates a NEW column in your table called 'GC_Percentage'
r_docs$GC_Percentage <- sapply(r_docs$Sequence, gc_content)

# 3. Look at your updated table
View(r_docs)
