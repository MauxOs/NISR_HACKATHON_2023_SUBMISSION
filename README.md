# NISR_HACKATHON_2023_SUBMISSION
This repository contains R shiny app, readme file, video and two datasets used to create R shiny app. This R shiny app shows interactively how general index (CPI) evolved since 2009 up to 2022 and how different sectors also evolved, Change in General Index of November 2022 compared to November 2021 to get insight about inflation, and Percentage GDP growth since 2017 up to 2022 with contribution of each Industry to GDP.


_____________________________________________________CPI and GDP Dashboard_______________________________________________________

homepage of our dashboard
![Dashboard Screenshot 1](https://github.com/MauxOs/NISR_HACKATHON_2023_SUBMISSION/assets/150527654/609a6317-a415-422c-94db-555e0e195054)


Welcome to the CPI and GDP Dashboard! This interactive Shiny dashboard allows you to explore the trends in the Consumer Price Index (CPI), the percentage contributions of Main Categories, Variation in CPI Comparing prices in both rural and urban economies, additionally, You will navigate through GDP Tab to get insight about GDP growth rate over years and Percentage Contribution of Each Industry to GDP.


Overview

- Title: Insightful CPI and GDP dashboard: Navigating Economic Trends and Sectoral/Industrial Contributions in Rural and Urban Economies.
- Author: Maurice HIRWA UWIMANA and MUGABO Jeanforbin
- Date: November 11, 2023


Getting Started

Follow these steps to set up and explore the CPI and GDP Dashboard:

1. git clone: https://github.com/MauxOs/NISR_HACKATHON_2023_SUBMISSION

2. You will find five 5 files such as app.R, Video_NISR_HACKATHON_DASHBOARD.webm, Licence, README file and excel dataset contaning used data.

3. Main R packages to be installed are: "shiny", "shinydashboard", "plotly", "ggplot2", "tidyverse", "openxlsx". But don't worry we have included them within R script to ease your job.

4.  Remember to first download used dataset and import them by modifying import code so that the app can load smoothly without showing an error.
    CPI <- read_excel("E:/NISR Competition/CPI & GDP Data.xlsx", 
                  sheet = "All Rwanda"), this is one of path you will have to modify.

6. Rscript: "app.R" : Run the R code by double clicking this file and then inside RStudio, click RunApp button in upper-left corner.

7. Access the Dashboard: After running the app by clicking RunApp button, the app will in the pop up window and also in console, it will show you the URL which can be used to view/navigate the app within the preferred web browser. An example of URL you will find in your console: http://127.0.0.1:4788. Copy and paste the URL in preferred web browser then, boom!

8. Features
   - Explore CPI trends over time.
   - Visualize the percentage contributions of different categories to CPI in rural and urban areas.
   - Examine the rate of change of CPI on monthly and annual basis, and consider reading comments added underneath.
   - Eplore GDP growth rate since 2017 up to 2022
   - Get insight on percentage contribution of each industry to GDP.
   - Interactive hover features for detailed insights.

     Below are screenshoot of different tabs our dashboard:
     ![Dashboard Screenshot 4](https://github.com/MauxOs/NISR_HACKATHON_2023_SUBMISSION/assets/150527654/b29c60ec-0acc-48c4-933b-018390d64849)
![Dashboard Screenshot 3](https://github.com/MauxOs/NISR_HACKATHON_2023_SUBMISSION/assets/150527654/a827acf3-101d-49f2-8008-f7b80fd8cdea)
![Dashboard Screenshot 2](https://github.com/MauxOs/NISR_HACKATHON_2023_SUBMISSION/assets/150527654/064bacb3-5303-40d2-9d3d-021c1ec63a79)


9. Data Sources: We have utilised CPI and GDP dataset which can be found here: https://www.statistics.gov.rw/publication/1873 and https://www.statistics.gov.rw/publication/1914. The main sheets (retrieved data) we utilised are included in this repository.

10. Feedback:
   If you have any feedback, suggestions, or issues, please feel free to contact us at mauriceuhirwa@gmail.com and mjeanforbin@gmail.com.
   

   Happy exploring!
