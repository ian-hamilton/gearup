select 
field15,
convert(varchar, substring(field15, 1, 2) + '/' + substring(field15, 3,2) + '/' + substring(field15, 5,2), 101)
from ctc.A1_IT_import_stage_alpha