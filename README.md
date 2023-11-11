# NISR_HACKATHON_2023_SUBMISSION
This repository contains R shiny app, readme file, video and two datasets used to create R shiny app. This R shiny app shows interactively how general index (CPI) change since 2009 up to 2022 and how different sectors also evolved.


_____________________________________________________CPI Dashboard_______________________________________________________

![Dashboard Screenshot ](https://github.com/MauxOs/NISR_HACKATHON_2023_SUBMISSION/assets/150527654/cd2c6c23-ed38-4b8f-b279-4a0b6aac7756)

Welcome to the CPI Dashboard! This interactive Shiny dashboard allows you to explore the trends in the Consumer Price Index (CPI) and the percentage contributions of various variables in both rural and urban economies.


Overview

- Title: Insightful CPI Chronicles: Navigating Economic Trends and Sectoral Contributions in Rural and Urban Economies.
- Author: MUGABO Jeanforbin and Maurice HIRWA UWIMANA
- Date: November 11, 2023


Getting Started

Follow these steps to set up and explore the CPI Dashboard:

1. git clone: https://github.com/MauxOs/NISR_HACKATHON_2023_SUBMISSION

2. You will find five 5 files such as app.R, video.gif, README file and excel files contaning used data.

3. Main R packages to be installed are: "shiny", "plotly", "ggplot2", "tidyverse", "openxlsx". But don't worry we have included them within R script to ease your job.

4.  Remember to first download used dataset and import them by modifying import code so that the app can load smoothly without show error.
    CPI  <- read_excel("C:/Users/user/Desktop/CPI Data.xlsx", 
                                       sheet = "All Rwanda"), this is one of path you will have modify.

6. Rscript: app.R : Run the app by double clicking this file and then inside RStudio, click RunApp button in upper-left corner.

7. Access the Dashboard:
   Open your web browser and go to http://127.0.0.1:4788

8. Features
   - Explore CPI trends over time.
   - Visualize the percentage contributions of different variables in rural and urban areas.
   - Interactive hover features for detailed insights.

9. Data Sources: We have utilised CPI dataset which can be found here: https://www.statistics.gov.rw/publication/1873 and main sheets we focused on are included in this repository.

10. Feedback:
   If you have any feedback, suggestions, or issues, please feel free to contact us at mauriceuhirwa@gmail.com and mjeanforbin@gmail.com.
   

   Happy exploring!
