library(plotly)

library(viridis)
# purple
viridis_pal(option = "D")(1)


# Create a sequence of N values
N_values <- 2:11

# Define the function for calculating values
group_work_series_value <- function(N) {
  return((N + 1) / (2 * N))
}

# Calculate values using the formula
values_by_formula <- sapply(N_values, group_work_series_value)

# Create a data frame
data <- data.frame(N = N_values, Value = values_by_formula)

# Create the interactive plot with purple dots
fig <- plot_ly(data, x = ~N, y = ~Value, type = 'scatter', mode = 'markers',
               marker = list(size = 10, color = viridis_pal(option = "D")(1)),
               hoverinfo = 'text',
               text = ~paste('N=', N, ', V=', round(Value, 2)))

# Customize layout
fig <- fig %>% layout(title = 'Large Share of Work Done in a Group (N = 2 to 11)',
                      xaxis = list(title = 'Number of People in Group (N)'),
                      yaxis = list(title = 'Value by Formula (N+1)/(2N)'))

# Show the plot
fig
