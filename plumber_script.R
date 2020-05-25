memory_obj <- 55


#* @get /get_prediction
function(input_integer = 1){ 	
	library(magrittr)

	input_integer <- 
		input_integer %>% 
		as.numeric
		

	input_integer <- 
		input_integer + 3
	input_integer <- input_integer+memory_obj
}
