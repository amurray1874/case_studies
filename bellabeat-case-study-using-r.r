{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "6a5e982e",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "collapsed": true,
    "execution": {
     "iopub.execute_input": "2023-04-13T16:57:01.964065Z",
     "iopub.status.busy": "2023-04-13T16:57:01.961930Z",
     "iopub.status.idle": "2023-04-13T16:57:03.191386Z",
     "shell.execute_reply": "2023-04-13T16:57:03.189482Z"
    },
    "jupyter": {
     "outputs_hidden": true,
     "source_hidden": true
    },
    "papermill": {
     "duration": 1.248543,
     "end_time": "2023-04-13T16:57:03.194139",
     "exception": false,
     "start_time": "2023-04-13T16:57:01.945596",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.0     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.4.1     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.1.8\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.2     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.1     \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "'fitbit'"
      ],
      "text/latex": [
       "'fitbit'"
      ],
      "text/markdown": [
       "'fitbit'"
      ],
      "text/plain": [
       "[1] \"fitbit\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# This R environment comes with many helpful analytics packages installed\n",
    "# It is defined by the kaggle/rstats Docker image: https://github.com/kaggle/docker-rstats\n",
    "# For example, here's a helpful package to load\n",
    "\n",
    "library(tidyverse) # metapackage of all tidyverse packages\n",
    "\n",
    "# Input data files are available in the read-only \"../input/\" directory\n",
    "# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory\n",
    "\n",
    "list.files(path = \"../input\")\n",
    "\n",
    "# You can write up to 20GB to the current directory (/kaggle/working/) that gets preserved as output when you create a version using \"Save & Run All\" \n",
    "# You can also write temporary files to /kaggle/temp/, but they won't be saved outside of the current session"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "54cf34cb",
   "metadata": {
    "papermill": {
     "duration": 0.021001,
     "end_time": "2023-04-13T16:57:03.237534",
     "exception": false,
     "start_time": "2023-04-13T16:57:03.216533",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# About Bellabeat\n",
    "\n",
    "Bellabeat, founded in 2013 by Urska Srsen and Sando Mur, is a successful high-tech manufacturer of health-focused smart products for women. By 2016 they were positioned globally as a tech-driven wellness company for women. They now have offices around the world and have multiple products that collect data on user's activity, sleep, stress, and reproductive health. With their beautifully designed technology, their goals are two-fold - empower women around the world with knowledge about their own health and habits AND become a larger player in the global smart device market. \n",
    "\n",
    "Bellebeat's products are available through a growing number of online retailers as well as their own e-commerce channel on their website. While they've invested in traditional advertising medium, most of their marketing is focused on digital platforms. "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ccd074e1",
   "metadata": {
    "papermill": {
     "duration": 0.020891,
     "end_time": "2023-04-13T16:57:03.280292",
     "exception": false,
     "start_time": "2023-04-13T16:57:03.259401",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Business Task\n",
    "\n",
    "The objective is to uncover additional opportunities to empower more women around the world about their own health and habits AND become a larger player in the global device market. With an analysis of Bellebeat's available consumer data, Srsen believes this is possible. In order to uncover these opportunities, I'll first gather and analyze non-Bellabeat user data to gain insights into how consumers are using other smart devices. I'll then apply this knowledge to one of Bellabeat's products and make high-level recommendations for a marketing strategy.\n",
    "\n",
    "I'll present my findings and recommendations to the following:\n",
    "\n",
    "* Urska Srsen, Co-founder & Chief Creative Officer\n",
    "* Sando Mur, Co-founder & Key Member of Executive Team\n",
    "* Marketing Analytics Team\n",
    "\n",
    "\n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2e4a9d43",
   "metadata": {
    "papermill": {
     "duration": 0.013929,
     "end_time": "2023-04-13T16:57:03.316810",
     "exception": false,
     "start_time": "2023-04-13T16:57:03.302881",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Prepare\n",
    "\n",
    "**Data Sources Used** \n",
    "\n",
    "I've been asked to use FitBit Fitness Tracker Data (CC0: Public Domain, dataset made available through Mobius): This Kaggle data set\n",
    "contains personal fitness tracker from thirty fitbit users. These users consented to the submission of personal tracker data, including minute-level output for physical activity, heart rate, and sleep monitoring. It includes information about daily activity, steps, and heart rate that can be used to explore users’ habits.\n",
    "\n",
    "I'm disregarding the csv files with minute and hourly recorded data to focus on the compiled daily data. \n",
    "\n",
    "**Data Credibility & Potential Bias**\n",
    "\n",
    "Some limitations on the data do exist. While the data appears to be comprehensive and cited, it may not be reliable. The sample selection is small (30 participants) and may not be enough to reflect the overall population. Also, it is outdated (2016) and the gender is not specified.  \n",
    "\n",
    "**Data Storage**\n",
    "\n",
    "The data was downloaded directly from Mobius's Kaggle and imported here using R's read.csv. "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "6fb53bb7",
   "metadata": {
    "papermill": {
     "duration": 0.013025,
     "end_time": "2023-04-13T16:57:03.343388",
     "exception": false,
     "start_time": "2023-04-13T16:57:03.330363",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "2fff55f3",
   "metadata": {
    "collapsed": true,
    "execution": {
     "iopub.execute_input": "2023-04-13T16:57:03.406201Z",
     "iopub.status.busy": "2023-04-13T16:57:03.373324Z",
     "iopub.status.idle": "2023-04-13T16:59:03.854006Z",
     "shell.execute_reply": "2023-04-13T16:59:03.852130Z"
    },
    "jupyter": {
     "outputs_hidden": true,
     "source_hidden": true
    },
    "papermill": {
     "duration": 120.501247,
     "end_time": "2023-04-13T16:59:03.858023",
     "exception": false,
     "start_time": "2023-04-13T16:57:03.356776",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n",
      "Warning message:\n",
      "“unable to access index for repository http://cran.rstudio.com/src/contrib:\n",
      "  cannot open URL 'http://cran.rstudio.com/src/contrib/PACKAGES'”\n",
      "Warning message:\n",
      "“package ‘skimr’ is not available for this version of R\n",
      "\n",
      "A version of this package for your version of R might be available elsewhere,\n",
      "see the ideas at\n",
      "https://cran.r-project.org/doc/manuals/r-patched/R-admin.html#Installing-packages”\n",
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n",
      "Warning message:\n",
      "“unable to access index for repository http://cran.rstudio.com/src/contrib:\n",
      "  cannot open URL 'http://cran.rstudio.com/src/contrib/PACKAGES'”\n",
      "Warning message:\n",
      "“package ‘janitor’ is not available for this version of R\n",
      "\n",
      "A version of this package for your version of R might be available elsewhere,\n",
      "see the ideas at\n",
      "https://cran.r-project.org/doc/manuals/r-patched/R-admin.html#Installing-packages”\n",
      "\n",
      "Attaching package: ‘janitor’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:stats’:\n",
      "\n",
      "    chisq.test, fisher.test\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "# Load skimr for summary statistics and janitor to help with cleaning data\n",
    "\n",
    "install.packages('skimr')\n",
    "install.packages('janitor')\n",
    "library(skimr)\n",
    "library(janitor)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d7d008ba",
   "metadata": {
    "papermill": {
     "duration": 0.014366,
     "end_time": "2023-04-13T16:59:03.893380",
     "exception": false,
     "start_time": "2023-04-13T16:59:03.879014",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**1. Import/ read data and rename for clarity and ease of use.**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "f44251f7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:03.925261Z",
     "iopub.status.busy": "2023-04-13T16:59:03.923483Z",
     "iopub.status.idle": "2023-04-13T16:59:04.017976Z",
     "shell.execute_reply": "2023-04-13T16:59:04.015889Z"
    },
    "papermill": {
     "duration": 0.113404,
     "end_time": "2023-04-13T16:59:04.021053",
     "exception": false,
     "start_time": "2023-04-13T16:59:03.907649",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# get datasets and rename\n",
    "daily_activity <- read.csv(\"../input/fitbit/Fitabase Data 4.12.16-5.12.16/dailyActivity_merged.csv\")\n",
    "daily_calories <- read.csv(\"../input/fitbit/Fitabase Data 4.12.16-5.12.16/dailyCalories_merged.csv\")\n",
    "daily_intensities <- read.csv(\"../input/fitbit/Fitabase Data 4.12.16-5.12.16/dailyIntensities_merged.csv\")\n",
    "daily_steps <- read.csv(\"../input/fitbit/Fitabase Data 4.12.16-5.12.16/dailySteps_merged.csv\")\n",
    "daily_sleep <- read.csv(\"../input/fitbit/Fitabase Data 4.12.16-5.12.16/sleepDay_merged.csv\")\n",
    "weight_log <- read.csv(\"../input/fitbit/Fitabase Data 4.12.16-5.12.16/weightLogInfo_merged.csv\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2db691b7",
   "metadata": {
    "papermill": {
     "duration": 0.013899,
     "end_time": "2023-04-13T16:59:04.049962",
     "exception": false,
     "start_time": "2023-04-13T16:59:04.036063",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Process\n",
    "\n",
    "I will be using R programming language with the Tidyverse package. Tidyverse includes the following to help me clean, organize, and process the data:\n",
    "\n",
    "* readr to import csv files\n",
    "* tidyr for data cleaning\n",
    "* dplyr for data manipulation\n",
    "* lubridate to convert date/time\n",
    "* ggplot2 for visualizations"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9e673b56",
   "metadata": {
    "papermill": {
     "duration": 0.013378,
     "end_time": "2023-04-13T16:59:04.077119",
     "exception": false,
     "start_time": "2023-04-13T16:59:04.063741",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Inspect data to check for missing, null, uneccessary, and insufficient data using head() and glimpse()**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "608875f5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:04.108224Z",
     "iopub.status.busy": "2023-04-13T16:59:04.106467Z",
     "iopub.status.idle": "2023-04-13T16:59:04.169891Z",
     "shell.execute_reply": "2023-04-13T16:59:04.168090Z"
    },
    "papermill": {
     "duration": 0.081707,
     "end_time": "2023-04-13T16:59:04.172386",
     "exception": false,
     "start_time": "2023-04-13T16:59:04.090679",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 15</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Id</th><th scope=col>ActivityDate</th><th scope=col>TotalSteps</th><th scope=col>TotalDistance</th><th scope=col>TrackerDistance</th><th scope=col>LoggedActivitiesDistance</th><th scope=col>VeryActiveDistance</th><th scope=col>ModeratelyActiveDistance</th><th scope=col>LightActiveDistance</th><th scope=col>SedentaryActiveDistance</th><th scope=col>VeryActiveMinutes</th><th scope=col>FairlyActiveMinutes</th><th scope=col>LightlyActiveMinutes</th><th scope=col>SedentaryMinutes</th><th scope=col>Calories</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>4/12/2016</td><td>13162</td><td>8.50</td><td>8.50</td><td>0</td><td>1.88</td><td>0.55</td><td>6.06</td><td>0</td><td>25</td><td>13</td><td>328</td><td> 728</td><td>1985</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>4/13/2016</td><td>10735</td><td>6.97</td><td>6.97</td><td>0</td><td>1.57</td><td>0.69</td><td>4.71</td><td>0</td><td>21</td><td>19</td><td>217</td><td> 776</td><td>1797</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>4/14/2016</td><td>10460</td><td>6.74</td><td>6.74</td><td>0</td><td>2.44</td><td>0.40</td><td>3.91</td><td>0</td><td>30</td><td>11</td><td>181</td><td>1218</td><td>1776</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>4/15/2016</td><td> 9762</td><td>6.28</td><td>6.28</td><td>0</td><td>2.14</td><td>1.26</td><td>2.83</td><td>0</td><td>29</td><td>34</td><td>209</td><td> 726</td><td>1745</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>4/16/2016</td><td>12669</td><td>8.16</td><td>8.16</td><td>0</td><td>2.71</td><td>0.41</td><td>5.04</td><td>0</td><td>36</td><td>10</td><td>221</td><td> 773</td><td>1863</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>4/17/2016</td><td> 9705</td><td>6.48</td><td>6.48</td><td>0</td><td>3.19</td><td>0.78</td><td>2.51</td><td>0</td><td>38</td><td>20</td><td>164</td><td> 539</td><td>1728</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 15\n",
       "\\begin{tabular}{r|lllllllllllllll}\n",
       "  & Id & ActivityDate & TotalSteps & TotalDistance & TrackerDistance & LoggedActivitiesDistance & VeryActiveDistance & ModeratelyActiveDistance & LightActiveDistance & SedentaryActiveDistance & VeryActiveMinutes & FairlyActiveMinutes & LightlyActiveMinutes & SedentaryMinutes & Calories\\\\\n",
       "  & <dbl> & <chr> & <int> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <int> & <int> & <int> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 4/12/2016 & 13162 & 8.50 & 8.50 & 0 & 1.88 & 0.55 & 6.06 & 0 & 25 & 13 & 328 &  728 & 1985\\\\\n",
       "\t2 & 1503960366 & 4/13/2016 & 10735 & 6.97 & 6.97 & 0 & 1.57 & 0.69 & 4.71 & 0 & 21 & 19 & 217 &  776 & 1797\\\\\n",
       "\t3 & 1503960366 & 4/14/2016 & 10460 & 6.74 & 6.74 & 0 & 2.44 & 0.40 & 3.91 & 0 & 30 & 11 & 181 & 1218 & 1776\\\\\n",
       "\t4 & 1503960366 & 4/15/2016 &  9762 & 6.28 & 6.28 & 0 & 2.14 & 1.26 & 2.83 & 0 & 29 & 34 & 209 &  726 & 1745\\\\\n",
       "\t5 & 1503960366 & 4/16/2016 & 12669 & 8.16 & 8.16 & 0 & 2.71 & 0.41 & 5.04 & 0 & 36 & 10 & 221 &  773 & 1863\\\\\n",
       "\t6 & 1503960366 & 4/17/2016 &  9705 & 6.48 & 6.48 & 0 & 3.19 & 0.78 & 2.51 & 0 & 38 & 20 & 164 &  539 & 1728\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 15\n",
       "\n",
       "| <!--/--> | Id &lt;dbl&gt; | ActivityDate &lt;chr&gt; | TotalSteps &lt;int&gt; | TotalDistance &lt;dbl&gt; | TrackerDistance &lt;dbl&gt; | LoggedActivitiesDistance &lt;dbl&gt; | VeryActiveDistance &lt;dbl&gt; | ModeratelyActiveDistance &lt;dbl&gt; | LightActiveDistance &lt;dbl&gt; | SedentaryActiveDistance &lt;dbl&gt; | VeryActiveMinutes &lt;int&gt; | FairlyActiveMinutes &lt;int&gt; | LightlyActiveMinutes &lt;int&gt; | SedentaryMinutes &lt;int&gt; | Calories &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1503960366 | 4/12/2016 | 13162 | 8.50 | 8.50 | 0 | 1.88 | 0.55 | 6.06 | 0 | 25 | 13 | 328 |  728 | 1985 |\n",
       "| 2 | 1503960366 | 4/13/2016 | 10735 | 6.97 | 6.97 | 0 | 1.57 | 0.69 | 4.71 | 0 | 21 | 19 | 217 |  776 | 1797 |\n",
       "| 3 | 1503960366 | 4/14/2016 | 10460 | 6.74 | 6.74 | 0 | 2.44 | 0.40 | 3.91 | 0 | 30 | 11 | 181 | 1218 | 1776 |\n",
       "| 4 | 1503960366 | 4/15/2016 |  9762 | 6.28 | 6.28 | 0 | 2.14 | 1.26 | 2.83 | 0 | 29 | 34 | 209 |  726 | 1745 |\n",
       "| 5 | 1503960366 | 4/16/2016 | 12669 | 8.16 | 8.16 | 0 | 2.71 | 0.41 | 5.04 | 0 | 36 | 10 | 221 |  773 | 1863 |\n",
       "| 6 | 1503960366 | 4/17/2016 |  9705 | 6.48 | 6.48 | 0 | 3.19 | 0.78 | 2.51 | 0 | 38 | 20 | 164 |  539 | 1728 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         ActivityDate TotalSteps TotalDistance TrackerDistance\n",
       "1 1503960366 4/12/2016    13162      8.50          8.50           \n",
       "2 1503960366 4/13/2016    10735      6.97          6.97           \n",
       "3 1503960366 4/14/2016    10460      6.74          6.74           \n",
       "4 1503960366 4/15/2016     9762      6.28          6.28           \n",
       "5 1503960366 4/16/2016    12669      8.16          8.16           \n",
       "6 1503960366 4/17/2016     9705      6.48          6.48           \n",
       "  LoggedActivitiesDistance VeryActiveDistance ModeratelyActiveDistance\n",
       "1 0                        1.88               0.55                    \n",
       "2 0                        1.57               0.69                    \n",
       "3 0                        2.44               0.40                    \n",
       "4 0                        2.14               1.26                    \n",
       "5 0                        2.71               0.41                    \n",
       "6 0                        3.19               0.78                    \n",
       "  LightActiveDistance SedentaryActiveDistance VeryActiveMinutes\n",
       "1 6.06                0                       25               \n",
       "2 4.71                0                       21               \n",
       "3 3.91                0                       30               \n",
       "4 2.83                0                       29               \n",
       "5 5.04                0                       36               \n",
       "6 2.51                0                       38               \n",
       "  FairlyActiveMinutes LightlyActiveMinutes SedentaryMinutes Calories\n",
       "1 13                  328                   728             1985    \n",
       "2 19                  217                   776             1797    \n",
       "3 11                  181                  1218             1776    \n",
       "4 34                  209                   726             1745    \n",
       "5 10                  221                   773             1863    \n",
       "6 20                  164                   539             1728    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Rows: 940\n",
      "Columns: 15\n",
      "$ Id                       \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 1503960366, 1503960366, 1503960366, 150396036…\n",
      "$ ActivityDate             \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"4/12/2016\", \"4/13/2016\", \"4/14/2016\", \"4/15/…\n",
      "$ TotalSteps               \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m 13162, 10735, 10460, 9762, 12669, 9705, 13019…\n",
      "$ TotalDistance            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 8.50, 6.97, 6.74, 6.28, 8.16, 6.48, 8.59, 9.8…\n",
      "$ TrackerDistance          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 8.50, 6.97, 6.74, 6.28, 8.16, 6.48, 8.59, 9.8…\n",
      "$ LoggedActivitiesDistance \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …\n",
      "$ VeryActiveDistance       \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 1.88, 1.57, 2.44, 2.14, 2.71, 3.19, 3.25, 3.5…\n",
      "$ ModeratelyActiveDistance \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 0.55, 0.69, 0.40, 1.26, 0.41, 0.78, 0.64, 1.3…\n",
      "$ LightActiveDistance      \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 6.06, 4.71, 3.91, 2.83, 5.04, 2.51, 4.71, 5.0…\n",
      "$ SedentaryActiveDistance  \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …\n",
      "$ VeryActiveMinutes        \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m 25, 21, 30, 29, 36, 38, 42, 50, 28, 19, 66, 4…\n",
      "$ FairlyActiveMinutes      \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m 13, 19, 11, 34, 10, 20, 16, 31, 12, 8, 27, 21…\n",
      "$ LightlyActiveMinutes     \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m 328, 217, 181, 209, 221, 164, 233, 264, 205, …\n",
      "$ SedentaryMinutes         \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m 728, 776, 1218, 726, 773, 539, 1149, 775, 818…\n",
      "$ Calories                 \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m 1985, 1797, 1776, 1745, 1863, 1728, 1921, 203…\n"
     ]
    }
   ],
   "source": [
    "# inspect data\n",
    "head(daily_activity)\n",
    "glimpse(daily_activity)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "54b0ad51",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:04.205869Z",
     "iopub.status.busy": "2023-04-13T16:59:04.204049Z",
     "iopub.status.idle": "2023-04-13T16:59:04.239267Z",
     "shell.execute_reply": "2023-04-13T16:59:04.237382Z"
    },
    "papermill": {
     "duration": 0.054569,
     "end_time": "2023-04-13T16:59:04.241810",
     "exception": false,
     "start_time": "2023-04-13T16:59:04.187241",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Id</th><th scope=col>ActivityDay</th><th scope=col>Calories</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>4/12/2016</td><td>1985</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>4/13/2016</td><td>1797</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>4/14/2016</td><td>1776</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>4/15/2016</td><td>1745</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>4/16/2016</td><td>1863</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>4/17/2016</td><td>1728</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 3\n",
       "\\begin{tabular}{r|lll}\n",
       "  & Id & ActivityDay & Calories\\\\\n",
       "  & <dbl> & <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 4/12/2016 & 1985\\\\\n",
       "\t2 & 1503960366 & 4/13/2016 & 1797\\\\\n",
       "\t3 & 1503960366 & 4/14/2016 & 1776\\\\\n",
       "\t4 & 1503960366 & 4/15/2016 & 1745\\\\\n",
       "\t5 & 1503960366 & 4/16/2016 & 1863\\\\\n",
       "\t6 & 1503960366 & 4/17/2016 & 1728\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 3\n",
       "\n",
       "| <!--/--> | Id &lt;dbl&gt; | ActivityDay &lt;chr&gt; | Calories &lt;int&gt; |\n",
       "|---|---|---|---|\n",
       "| 1 | 1503960366 | 4/12/2016 | 1985 |\n",
       "| 2 | 1503960366 | 4/13/2016 | 1797 |\n",
       "| 3 | 1503960366 | 4/14/2016 | 1776 |\n",
       "| 4 | 1503960366 | 4/15/2016 | 1745 |\n",
       "| 5 | 1503960366 | 4/16/2016 | 1863 |\n",
       "| 6 | 1503960366 | 4/17/2016 | 1728 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         ActivityDay Calories\n",
       "1 1503960366 4/12/2016   1985    \n",
       "2 1503960366 4/13/2016   1797    \n",
       "3 1503960366 4/14/2016   1776    \n",
       "4 1503960366 4/15/2016   1745    \n",
       "5 1503960366 4/16/2016   1863    \n",
       "6 1503960366 4/17/2016   1728    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Rows: 940\n",
      "Columns: 3\n",
      "$ Id          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 1503960366, 1503960366, 1503960366, 1503960366, 1503960366…\n",
      "$ ActivityDay \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"4/12/2016\", \"4/13/2016\", \"4/14/2016\", \"4/15/2016\", \"4/16/…\n",
      "$ Calories    \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m 1985, 1797, 1776, 1745, 1863, 1728, 1921, 2035, 1786, 1775…\n"
     ]
    }
   ],
   "source": [
    "head(daily_calories)\n",
    "glimpse(daily_calories)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "24935c92",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:04.275893Z",
     "iopub.status.busy": "2023-04-13T16:59:04.274179Z",
     "iopub.status.idle": "2023-04-13T16:59:04.325494Z",
     "shell.execute_reply": "2023-04-13T16:59:04.323614Z"
    },
    "papermill": {
     "duration": 0.071496,
     "end_time": "2023-04-13T16:59:04.327918",
     "exception": false,
     "start_time": "2023-04-13T16:59:04.256422",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 10</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Id</th><th scope=col>ActivityDay</th><th scope=col>SedentaryMinutes</th><th scope=col>LightlyActiveMinutes</th><th scope=col>FairlyActiveMinutes</th><th scope=col>VeryActiveMinutes</th><th scope=col>SedentaryActiveDistance</th><th scope=col>LightActiveDistance</th><th scope=col>ModeratelyActiveDistance</th><th scope=col>VeryActiveDistance</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>4/12/2016</td><td> 728</td><td>328</td><td>13</td><td>25</td><td>0</td><td>6.06</td><td>0.55</td><td>1.88</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>4/13/2016</td><td> 776</td><td>217</td><td>19</td><td>21</td><td>0</td><td>4.71</td><td>0.69</td><td>1.57</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>4/14/2016</td><td>1218</td><td>181</td><td>11</td><td>30</td><td>0</td><td>3.91</td><td>0.40</td><td>2.44</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>4/15/2016</td><td> 726</td><td>209</td><td>34</td><td>29</td><td>0</td><td>2.83</td><td>1.26</td><td>2.14</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>4/16/2016</td><td> 773</td><td>221</td><td>10</td><td>36</td><td>0</td><td>5.04</td><td>0.41</td><td>2.71</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>4/17/2016</td><td> 539</td><td>164</td><td>20</td><td>38</td><td>0</td><td>2.51</td><td>0.78</td><td>3.19</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 10\n",
       "\\begin{tabular}{r|llllllllll}\n",
       "  & Id & ActivityDay & SedentaryMinutes & LightlyActiveMinutes & FairlyActiveMinutes & VeryActiveMinutes & SedentaryActiveDistance & LightActiveDistance & ModeratelyActiveDistance & VeryActiveDistance\\\\\n",
       "  & <dbl> & <chr> & <int> & <int> & <int> & <int> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 4/12/2016 &  728 & 328 & 13 & 25 & 0 & 6.06 & 0.55 & 1.88\\\\\n",
       "\t2 & 1503960366 & 4/13/2016 &  776 & 217 & 19 & 21 & 0 & 4.71 & 0.69 & 1.57\\\\\n",
       "\t3 & 1503960366 & 4/14/2016 & 1218 & 181 & 11 & 30 & 0 & 3.91 & 0.40 & 2.44\\\\\n",
       "\t4 & 1503960366 & 4/15/2016 &  726 & 209 & 34 & 29 & 0 & 2.83 & 1.26 & 2.14\\\\\n",
       "\t5 & 1503960366 & 4/16/2016 &  773 & 221 & 10 & 36 & 0 & 5.04 & 0.41 & 2.71\\\\\n",
       "\t6 & 1503960366 & 4/17/2016 &  539 & 164 & 20 & 38 & 0 & 2.51 & 0.78 & 3.19\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 10\n",
       "\n",
       "| <!--/--> | Id &lt;dbl&gt; | ActivityDay &lt;chr&gt; | SedentaryMinutes &lt;int&gt; | LightlyActiveMinutes &lt;int&gt; | FairlyActiveMinutes &lt;int&gt; | VeryActiveMinutes &lt;int&gt; | SedentaryActiveDistance &lt;dbl&gt; | LightActiveDistance &lt;dbl&gt; | ModeratelyActiveDistance &lt;dbl&gt; | VeryActiveDistance &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1503960366 | 4/12/2016 |  728 | 328 | 13 | 25 | 0 | 6.06 | 0.55 | 1.88 |\n",
       "| 2 | 1503960366 | 4/13/2016 |  776 | 217 | 19 | 21 | 0 | 4.71 | 0.69 | 1.57 |\n",
       "| 3 | 1503960366 | 4/14/2016 | 1218 | 181 | 11 | 30 | 0 | 3.91 | 0.40 | 2.44 |\n",
       "| 4 | 1503960366 | 4/15/2016 |  726 | 209 | 34 | 29 | 0 | 2.83 | 1.26 | 2.14 |\n",
       "| 5 | 1503960366 | 4/16/2016 |  773 | 221 | 10 | 36 | 0 | 5.04 | 0.41 | 2.71 |\n",
       "| 6 | 1503960366 | 4/17/2016 |  539 | 164 | 20 | 38 | 0 | 2.51 | 0.78 | 3.19 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         ActivityDay SedentaryMinutes LightlyActiveMinutes\n",
       "1 1503960366 4/12/2016    728             328                 \n",
       "2 1503960366 4/13/2016    776             217                 \n",
       "3 1503960366 4/14/2016   1218             181                 \n",
       "4 1503960366 4/15/2016    726             209                 \n",
       "5 1503960366 4/16/2016    773             221                 \n",
       "6 1503960366 4/17/2016    539             164                 \n",
       "  FairlyActiveMinutes VeryActiveMinutes SedentaryActiveDistance\n",
       "1 13                  25                0                      \n",
       "2 19                  21                0                      \n",
       "3 11                  30                0                      \n",
       "4 34                  29                0                      \n",
       "5 10                  36                0                      \n",
       "6 20                  38                0                      \n",
       "  LightActiveDistance ModeratelyActiveDistance VeryActiveDistance\n",
       "1 6.06                0.55                     1.88              \n",
       "2 4.71                0.69                     1.57              \n",
       "3 3.91                0.40                     2.44              \n",
       "4 2.83                1.26                     2.14              \n",
       "5 5.04                0.41                     2.71              \n",
       "6 2.51                0.78                     3.19              "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Rows: 940\n",
      "Columns: 10\n",
      "$ Id                       \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 1503960366, 1503960366, 1503960366, 150396036…\n",
      "$ ActivityDay              \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"4/12/2016\", \"4/13/2016\", \"4/14/2016\", \"4/15/…\n",
      "$ SedentaryMinutes         \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m 728, 776, 1218, 726, 773, 539, 1149, 775, 818…\n",
      "$ LightlyActiveMinutes     \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m 328, 217, 181, 209, 221, 164, 233, 264, 205, …\n",
      "$ FairlyActiveMinutes      \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m 13, 19, 11, 34, 10, 20, 16, 31, 12, 8, 27, 21…\n",
      "$ VeryActiveMinutes        \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m 25, 21, 30, 29, 36, 38, 42, 50, 28, 19, 66, 4…\n",
      "$ SedentaryActiveDistance  \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …\n",
      "$ LightActiveDistance      \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 6.06, 4.71, 3.91, 2.83, 5.04, 2.51, 4.71, 5.0…\n",
      "$ ModeratelyActiveDistance \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 0.55, 0.69, 0.40, 1.26, 0.41, 0.78, 0.64, 1.3…\n",
      "$ VeryActiveDistance       \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 1.88, 1.57, 2.44, 2.14, 2.71, 3.19, 3.25, 3.5…\n"
     ]
    }
   ],
   "source": [
    "head(daily_intensities)\n",
    "glimpse(daily_intensities)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "2fc38319",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:04.361985Z",
     "iopub.status.busy": "2023-04-13T16:59:04.360343Z",
     "iopub.status.idle": "2023-04-13T16:59:04.395915Z",
     "shell.execute_reply": "2023-04-13T16:59:04.393816Z"
    },
    "papermill": {
     "duration": 0.055122,
     "end_time": "2023-04-13T16:59:04.398299",
     "exception": false,
     "start_time": "2023-04-13T16:59:04.343177",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Id</th><th scope=col>ActivityDay</th><th scope=col>StepTotal</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>4/12/2016</td><td>13162</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>4/13/2016</td><td>10735</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>4/14/2016</td><td>10460</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>4/15/2016</td><td> 9762</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>4/16/2016</td><td>12669</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>4/17/2016</td><td> 9705</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 3\n",
       "\\begin{tabular}{r|lll}\n",
       "  & Id & ActivityDay & StepTotal\\\\\n",
       "  & <dbl> & <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 4/12/2016 & 13162\\\\\n",
       "\t2 & 1503960366 & 4/13/2016 & 10735\\\\\n",
       "\t3 & 1503960366 & 4/14/2016 & 10460\\\\\n",
       "\t4 & 1503960366 & 4/15/2016 &  9762\\\\\n",
       "\t5 & 1503960366 & 4/16/2016 & 12669\\\\\n",
       "\t6 & 1503960366 & 4/17/2016 &  9705\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 3\n",
       "\n",
       "| <!--/--> | Id &lt;dbl&gt; | ActivityDay &lt;chr&gt; | StepTotal &lt;int&gt; |\n",
       "|---|---|---|---|\n",
       "| 1 | 1503960366 | 4/12/2016 | 13162 |\n",
       "| 2 | 1503960366 | 4/13/2016 | 10735 |\n",
       "| 3 | 1503960366 | 4/14/2016 | 10460 |\n",
       "| 4 | 1503960366 | 4/15/2016 |  9762 |\n",
       "| 5 | 1503960366 | 4/16/2016 | 12669 |\n",
       "| 6 | 1503960366 | 4/17/2016 |  9705 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         ActivityDay StepTotal\n",
       "1 1503960366 4/12/2016   13162    \n",
       "2 1503960366 4/13/2016   10735    \n",
       "3 1503960366 4/14/2016   10460    \n",
       "4 1503960366 4/15/2016    9762    \n",
       "5 1503960366 4/16/2016   12669    \n",
       "6 1503960366 4/17/2016    9705    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Rows: 940\n",
      "Columns: 3\n",
      "$ Id          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 1503960366, 1503960366, 1503960366, 1503960366, 1503960366…\n",
      "$ ActivityDay \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"4/12/2016\", \"4/13/2016\", \"4/14/2016\", \"4/15/2016\", \"4/16/…\n",
      "$ StepTotal   \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m 13162, 10735, 10460, 9762, 12669, 9705, 13019, 15506, 1054…\n"
     ]
    }
   ],
   "source": [
    "head(daily_steps)\n",
    "glimpse(daily_steps)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "411dc107",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:04.432645Z",
     "iopub.status.busy": "2023-04-13T16:59:04.430954Z",
     "iopub.status.idle": "2023-04-13T16:59:04.470444Z",
     "shell.execute_reply": "2023-04-13T16:59:04.468406Z"
    },
    "papermill": {
     "duration": 0.059428,
     "end_time": "2023-04-13T16:59:04.472890",
     "exception": false,
     "start_time": "2023-04-13T16:59:04.413462",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 5</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Id</th><th scope=col>SleepDay</th><th scope=col>TotalSleepRecords</th><th scope=col>TotalMinutesAsleep</th><th scope=col>TotalTimeInBed</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>4/12/2016 12:00:00 AM</td><td>1</td><td>327</td><td>346</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>4/13/2016 12:00:00 AM</td><td>2</td><td>384</td><td>407</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>4/15/2016 12:00:00 AM</td><td>1</td><td>412</td><td>442</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>4/16/2016 12:00:00 AM</td><td>2</td><td>340</td><td>367</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>4/17/2016 12:00:00 AM</td><td>1</td><td>700</td><td>712</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>4/19/2016 12:00:00 AM</td><td>1</td><td>304</td><td>320</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 5\n",
       "\\begin{tabular}{r|lllll}\n",
       "  & Id & SleepDay & TotalSleepRecords & TotalMinutesAsleep & TotalTimeInBed\\\\\n",
       "  & <dbl> & <chr> & <int> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 4/12/2016 12:00:00 AM & 1 & 327 & 346\\\\\n",
       "\t2 & 1503960366 & 4/13/2016 12:00:00 AM & 2 & 384 & 407\\\\\n",
       "\t3 & 1503960366 & 4/15/2016 12:00:00 AM & 1 & 412 & 442\\\\\n",
       "\t4 & 1503960366 & 4/16/2016 12:00:00 AM & 2 & 340 & 367\\\\\n",
       "\t5 & 1503960366 & 4/17/2016 12:00:00 AM & 1 & 700 & 712\\\\\n",
       "\t6 & 1503960366 & 4/19/2016 12:00:00 AM & 1 & 304 & 320\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 5\n",
       "\n",
       "| <!--/--> | Id &lt;dbl&gt; | SleepDay &lt;chr&gt; | TotalSleepRecords &lt;int&gt; | TotalMinutesAsleep &lt;int&gt; | TotalTimeInBed &lt;int&gt; |\n",
       "|---|---|---|---|---|---|\n",
       "| 1 | 1503960366 | 4/12/2016 12:00:00 AM | 1 | 327 | 346 |\n",
       "| 2 | 1503960366 | 4/13/2016 12:00:00 AM | 2 | 384 | 407 |\n",
       "| 3 | 1503960366 | 4/15/2016 12:00:00 AM | 1 | 412 | 442 |\n",
       "| 4 | 1503960366 | 4/16/2016 12:00:00 AM | 2 | 340 | 367 |\n",
       "| 5 | 1503960366 | 4/17/2016 12:00:00 AM | 1 | 700 | 712 |\n",
       "| 6 | 1503960366 | 4/19/2016 12:00:00 AM | 1 | 304 | 320 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         SleepDay              TotalSleepRecords TotalMinutesAsleep\n",
       "1 1503960366 4/12/2016 12:00:00 AM 1                 327               \n",
       "2 1503960366 4/13/2016 12:00:00 AM 2                 384               \n",
       "3 1503960366 4/15/2016 12:00:00 AM 1                 412               \n",
       "4 1503960366 4/16/2016 12:00:00 AM 2                 340               \n",
       "5 1503960366 4/17/2016 12:00:00 AM 1                 700               \n",
       "6 1503960366 4/19/2016 12:00:00 AM 1                 304               \n",
       "  TotalTimeInBed\n",
       "1 346           \n",
       "2 407           \n",
       "3 442           \n",
       "4 367           \n",
       "5 712           \n",
       "6 320           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Rows: 413\n",
      "Columns: 5\n",
      "$ Id                 \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 1503960366, 1503960366, 1503960366, 1503960366, 150…\n",
      "$ SleepDay           \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"4/12/2016 12:00:00 AM\", \"4/13/2016 12:00:00 AM\", \"…\n",
      "$ TotalSleepRecords  \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, …\n",
      "$ TotalMinutesAsleep \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m 327, 384, 412, 340, 700, 304, 360, 325, 361, 430, 2…\n",
      "$ TotalTimeInBed     \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m 346, 407, 442, 367, 712, 320, 377, 364, 384, 449, 3…\n"
     ]
    }
   ],
   "source": [
    "head(daily_sleep)\n",
    "glimpse(daily_sleep)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "9aade2f7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:04.508322Z",
     "iopub.status.busy": "2023-04-13T16:59:04.506652Z",
     "iopub.status.idle": "2023-04-13T16:59:04.548212Z",
     "shell.execute_reply": "2023-04-13T16:59:04.546204Z"
    },
    "papermill": {
     "duration": 0.061512,
     "end_time": "2023-04-13T16:59:04.550644",
     "exception": false,
     "start_time": "2023-04-13T16:59:04.489132",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 8</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Id</th><th scope=col>Date</th><th scope=col>WeightKg</th><th scope=col>WeightPounds</th><th scope=col>Fat</th><th scope=col>BMI</th><th scope=col>IsManualReport</th><th scope=col>LogId</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>5/2/2016 11:59:59 PM </td><td> 52.6</td><td>115.9631</td><td>22</td><td>22.65</td><td>True </td><td>1.462234e+12</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>5/3/2016 11:59:59 PM </td><td> 52.6</td><td>115.9631</td><td>NA</td><td>22.65</td><td>True </td><td>1.462320e+12</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1927972279</td><td>4/13/2016 1:08:52 AM </td><td>133.5</td><td>294.3171</td><td>NA</td><td>47.54</td><td>False</td><td>1.460510e+12</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>2873212765</td><td>4/21/2016 11:59:59 PM</td><td> 56.7</td><td>125.0021</td><td>NA</td><td>21.45</td><td>True </td><td>1.461283e+12</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>2873212765</td><td>5/12/2016 11:59:59 PM</td><td> 57.3</td><td>126.3249</td><td>NA</td><td>21.69</td><td>True </td><td>1.463098e+12</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>4319703577</td><td>4/17/2016 11:59:59 PM</td><td> 72.4</td><td>159.6147</td><td>25</td><td>27.45</td><td>True </td><td>1.460938e+12</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 8\n",
       "\\begin{tabular}{r|llllllll}\n",
       "  & Id & Date & WeightKg & WeightPounds & Fat & BMI & IsManualReport & LogId\\\\\n",
       "  & <dbl> & <chr> & <dbl> & <dbl> & <int> & <dbl> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 5/2/2016 11:59:59 PM  &  52.6 & 115.9631 & 22 & 22.65 & True  & 1.462234e+12\\\\\n",
       "\t2 & 1503960366 & 5/3/2016 11:59:59 PM  &  52.6 & 115.9631 & NA & 22.65 & True  & 1.462320e+12\\\\\n",
       "\t3 & 1927972279 & 4/13/2016 1:08:52 AM  & 133.5 & 294.3171 & NA & 47.54 & False & 1.460510e+12\\\\\n",
       "\t4 & 2873212765 & 4/21/2016 11:59:59 PM &  56.7 & 125.0021 & NA & 21.45 & True  & 1.461283e+12\\\\\n",
       "\t5 & 2873212765 & 5/12/2016 11:59:59 PM &  57.3 & 126.3249 & NA & 21.69 & True  & 1.463098e+12\\\\\n",
       "\t6 & 4319703577 & 4/17/2016 11:59:59 PM &  72.4 & 159.6147 & 25 & 27.45 & True  & 1.460938e+12\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 8\n",
       "\n",
       "| <!--/--> | Id &lt;dbl&gt; | Date &lt;chr&gt; | WeightKg &lt;dbl&gt; | WeightPounds &lt;dbl&gt; | Fat &lt;int&gt; | BMI &lt;dbl&gt; | IsManualReport &lt;chr&gt; | LogId &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1503960366 | 5/2/2016 11:59:59 PM  |  52.6 | 115.9631 | 22 | 22.65 | True  | 1.462234e+12 |\n",
       "| 2 | 1503960366 | 5/3/2016 11:59:59 PM  |  52.6 | 115.9631 | NA | 22.65 | True  | 1.462320e+12 |\n",
       "| 3 | 1927972279 | 4/13/2016 1:08:52 AM  | 133.5 | 294.3171 | NA | 47.54 | False | 1.460510e+12 |\n",
       "| 4 | 2873212765 | 4/21/2016 11:59:59 PM |  56.7 | 125.0021 | NA | 21.45 | True  | 1.461283e+12 |\n",
       "| 5 | 2873212765 | 5/12/2016 11:59:59 PM |  57.3 | 126.3249 | NA | 21.69 | True  | 1.463098e+12 |\n",
       "| 6 | 4319703577 | 4/17/2016 11:59:59 PM |  72.4 | 159.6147 | 25 | 27.45 | True  | 1.460938e+12 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         Date                  WeightKg WeightPounds Fat BMI  \n",
       "1 1503960366 5/2/2016 11:59:59 PM   52.6    115.9631     22  22.65\n",
       "2 1503960366 5/3/2016 11:59:59 PM   52.6    115.9631     NA  22.65\n",
       "3 1927972279 4/13/2016 1:08:52 AM  133.5    294.3171     NA  47.54\n",
       "4 2873212765 4/21/2016 11:59:59 PM  56.7    125.0021     NA  21.45\n",
       "5 2873212765 5/12/2016 11:59:59 PM  57.3    126.3249     NA  21.69\n",
       "6 4319703577 4/17/2016 11:59:59 PM  72.4    159.6147     25  27.45\n",
       "  IsManualReport LogId       \n",
       "1 True           1.462234e+12\n",
       "2 True           1.462320e+12\n",
       "3 False          1.460510e+12\n",
       "4 True           1.461283e+12\n",
       "5 True           1.463098e+12\n",
       "6 True           1.460938e+12"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Rows: 67\n",
      "Columns: 8\n",
      "$ Id             \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 1503960366, 1503960366, 1927972279, 2873212765, 2873212…\n",
      "$ Date           \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"5/2/2016 11:59:59 PM\", \"5/3/2016 11:59:59 PM\", \"4/13/2…\n",
      "$ WeightKg       \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 52.6, 52.6, 133.5, 56.7, 57.3, 72.4, 72.3, 69.7, 70.3, …\n",
      "$ WeightPounds   \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 115.9631, 115.9631, 294.3171, 125.0021, 126.3249, 159.6…\n",
      "$ Fat            \u001b[3m\u001b[90m<int>\u001b[39m\u001b[23m 22, NA, NA, NA, NA, 25, NA, NA, NA, NA, NA, NA, NA, NA,…\n",
      "$ BMI            \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 22.65, 22.65, 47.54, 21.45, 21.69, 27.45, 27.38, 27.25,…\n",
      "$ IsManualReport \u001b[3m\u001b[90m<chr>\u001b[39m\u001b[23m \"True\", \"True\", \"False\", \"True\", \"True\", \"True\", \"True\"…\n",
      "$ LogId          \u001b[3m\u001b[90m<dbl>\u001b[39m\u001b[23m 1.462234e+12, 1.462320e+12, 1.460510e+12, 1.461283e+12,…\n"
     ]
    }
   ],
   "source": [
    "head(weight_log)\n",
    "glimpse(weight_log)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "41010017",
   "metadata": {
    "papermill": {
     "duration": 0.016638,
     "end_time": "2023-04-13T16:59:04.583172",
     "exception": false,
     "start_time": "2023-04-13T16:59:04.566534",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Initial Observations: There appears to be missing, null, and insuffient data as well as data that's already been aggregated.**\n",
    "\n",
    "- there are 940 observations in all except for 'weightLog' (67) and 'daily_sleep'(413)\n",
    "- daily_activity appears to have aggregated data (daily_intensities and daily_calories)\n",
    "- date variable name is different across datasets \n",
    "- date format is character\n",
    "- date in daily_sleep only is date-time stamp \n",
    "- time in daily_sleep appears to be 12:00:00 AM for all entries \n",
    "- daily_activity and daily_intensities have null values"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "e49fb5f5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:04.618267Z",
     "iopub.status.busy": "2023-04-13T16:59:04.616624Z",
     "iopub.status.idle": "2023-04-13T16:59:04.663142Z",
     "shell.execute_reply": "2023-04-13T16:59:04.661342Z"
    },
    "papermill": {
     "duration": 0.067322,
     "end_time": "2023-04-13T16:59:04.665998",
     "exception": false,
     "start_time": "2023-04-13T16:59:04.598676",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "33"
      ],
      "text/latex": [
       "33"
      ],
      "text/markdown": [
       "33"
      ],
      "text/plain": [
       "[1] 33"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "33"
      ],
      "text/latex": [
       "33"
      ],
      "text/markdown": [
       "33"
      ],
      "text/plain": [
       "[1] 33"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "33"
      ],
      "text/latex": [
       "33"
      ],
      "text/markdown": [
       "33"
      ],
      "text/plain": [
       "[1] 33"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "33"
      ],
      "text/latex": [
       "33"
      ],
      "text/markdown": [
       "33"
      ],
      "text/plain": [
       "[1] 33"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "24"
      ],
      "text/latex": [
       "24"
      ],
      "text/markdown": [
       "24"
      ],
      "text/plain": [
       "[1] 24"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "8"
      ],
      "text/latex": [
       "8"
      ],
      "text/markdown": [
       "8"
      ],
      "text/plain": [
       "[1] 8"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# count number of 'Id' combinations in each to check for unique participants\n",
    "n_distinct(daily_activity$Id)\n",
    "n_distinct(daily_calories$Id)\n",
    "n_distinct(daily_intensities$Id)\n",
    "n_distinct(daily_steps$Id)\n",
    "n_distinct(daily_sleep$Id)\n",
    "n_distinct(weight_log$Id)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d756e1b4",
   "metadata": {
    "papermill": {
     "duration": 0.016318,
     "end_time": "2023-04-13T16:59:04.699057",
     "exception": false,
     "start_time": "2023-04-13T16:59:04.682739",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Findings:**\n",
    "\n",
    "There are only eight participants recorded in weight_log. I can't proxy the data or collect more so I'll disregard it in my analysis. *The sample size is too small to represent the average result of a population.*"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "56b89ae4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:04.736353Z",
     "iopub.status.busy": "2023-04-13T16:59:04.734709Z",
     "iopub.status.idle": "2023-04-13T16:59:04.807891Z",
     "shell.execute_reply": "2023-04-13T16:59:04.805688Z"
    },
    "papermill": {
     "duration": 0.094521,
     "end_time": "2023-04-13T16:59:04.810250",
     "exception": false,
     "start_time": "2023-04-13T16:59:04.715729",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'Id'</li><li>'ActivityDate'</li><li>'TotalSteps'</li><li>'TotalDistance'</li><li>'TrackerDistance'</li><li>'LoggedActivitiesDistance'</li><li>'VeryActiveDistance'</li><li>'ModeratelyActiveDistance'</li><li>'LightActiveDistance'</li><li>'SedentaryActiveDistance'</li><li>'VeryActiveMinutes'</li><li>'FairlyActiveMinutes'</li><li>'LightlyActiveMinutes'</li><li>'SedentaryMinutes'</li><li>'Calories'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Id'\n",
       "\\item 'ActivityDate'\n",
       "\\item 'TotalSteps'\n",
       "\\item 'TotalDistance'\n",
       "\\item 'TrackerDistance'\n",
       "\\item 'LoggedActivitiesDistance'\n",
       "\\item 'VeryActiveDistance'\n",
       "\\item 'ModeratelyActiveDistance'\n",
       "\\item 'LightActiveDistance'\n",
       "\\item 'SedentaryActiveDistance'\n",
       "\\item 'VeryActiveMinutes'\n",
       "\\item 'FairlyActiveMinutes'\n",
       "\\item 'LightlyActiveMinutes'\n",
       "\\item 'SedentaryMinutes'\n",
       "\\item 'Calories'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Id'\n",
       "2. 'ActivityDate'\n",
       "3. 'TotalSteps'\n",
       "4. 'TotalDistance'\n",
       "5. 'TrackerDistance'\n",
       "6. 'LoggedActivitiesDistance'\n",
       "7. 'VeryActiveDistance'\n",
       "8. 'ModeratelyActiveDistance'\n",
       "9. 'LightActiveDistance'\n",
       "10. 'SedentaryActiveDistance'\n",
       "11. 'VeryActiveMinutes'\n",
       "12. 'FairlyActiveMinutes'\n",
       "13. 'LightlyActiveMinutes'\n",
       "14. 'SedentaryMinutes'\n",
       "15. 'Calories'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"Id\"                       \"ActivityDate\"            \n",
       " [3] \"TotalSteps\"               \"TotalDistance\"           \n",
       " [5] \"TrackerDistance\"          \"LoggedActivitiesDistance\"\n",
       " [7] \"VeryActiveDistance\"       \"ModeratelyActiveDistance\"\n",
       " [9] \"LightActiveDistance\"      \"SedentaryActiveDistance\" \n",
       "[11] \"VeryActiveMinutes\"        \"FairlyActiveMinutes\"     \n",
       "[13] \"LightlyActiveMinutes\"     \"SedentaryMinutes\"        \n",
       "[15] \"Calories\"                "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'Id'</li><li>'ActivityDay'</li><li>'Calories'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Id'\n",
       "\\item 'ActivityDay'\n",
       "\\item 'Calories'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Id'\n",
       "2. 'ActivityDay'\n",
       "3. 'Calories'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"Id\"          \"ActivityDay\" \"Calories\"   "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'Id'</li><li>'ActivityDay'</li><li>'SedentaryMinutes'</li><li>'LightlyActiveMinutes'</li><li>'FairlyActiveMinutes'</li><li>'VeryActiveMinutes'</li><li>'SedentaryActiveDistance'</li><li>'LightActiveDistance'</li><li>'ModeratelyActiveDistance'</li><li>'VeryActiveDistance'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Id'\n",
       "\\item 'ActivityDay'\n",
       "\\item 'SedentaryMinutes'\n",
       "\\item 'LightlyActiveMinutes'\n",
       "\\item 'FairlyActiveMinutes'\n",
       "\\item 'VeryActiveMinutes'\n",
       "\\item 'SedentaryActiveDistance'\n",
       "\\item 'LightActiveDistance'\n",
       "\\item 'ModeratelyActiveDistance'\n",
       "\\item 'VeryActiveDistance'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Id'\n",
       "2. 'ActivityDay'\n",
       "3. 'SedentaryMinutes'\n",
       "4. 'LightlyActiveMinutes'\n",
       "5. 'FairlyActiveMinutes'\n",
       "6. 'VeryActiveMinutes'\n",
       "7. 'SedentaryActiveDistance'\n",
       "8. 'LightActiveDistance'\n",
       "9. 'ModeratelyActiveDistance'\n",
       "10. 'VeryActiveDistance'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"Id\"                       \"ActivityDay\"             \n",
       " [3] \"SedentaryMinutes\"         \"LightlyActiveMinutes\"    \n",
       " [5] \"FairlyActiveMinutes\"      \"VeryActiveMinutes\"       \n",
       " [7] \"SedentaryActiveDistance\"  \"LightActiveDistance\"     \n",
       " [9] \"ModeratelyActiveDistance\" \"VeryActiveDistance\"      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'Id'</li><li>'ActivityDay'</li><li>'StepTotal'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Id'\n",
       "\\item 'ActivityDay'\n",
       "\\item 'StepTotal'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Id'\n",
       "2. 'ActivityDay'\n",
       "3. 'StepTotal'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"Id\"          \"ActivityDay\" \"StepTotal\"  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'Id'</li><li>'SleepDay'</li><li>'TotalSleepRecords'</li><li>'TotalMinutesAsleep'</li><li>'TotalTimeInBed'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Id'\n",
       "\\item 'SleepDay'\n",
       "\\item 'TotalSleepRecords'\n",
       "\\item 'TotalMinutesAsleep'\n",
       "\\item 'TotalTimeInBed'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Id'\n",
       "2. 'SleepDay'\n",
       "3. 'TotalSleepRecords'\n",
       "4. 'TotalMinutesAsleep'\n",
       "5. 'TotalTimeInBed'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"Id\"                 \"SleepDay\"           \"TotalSleepRecords\" \n",
       "[4] \"TotalMinutesAsleep\" \"TotalTimeInBed\"    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# check the variables with colnames() to see if any of the data has already been aggregated\n",
    "colnames(daily_activity)\n",
    "colnames(daily_calories)\n",
    "colnames(daily_intensities)\n",
    "colnames(daily_steps)\n",
    "colnames(daily_sleep)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d67736e2",
   "metadata": {
    "papermill": {
     "duration": 0.017911,
     "end_time": "2023-04-13T16:59:04.845192",
     "exception": false,
     "start_time": "2023-04-13T16:59:04.827281",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Findings:** \n",
    "\n",
    "The data in daily_calories, daily_intensities, and daily_steps has already been aggregated into daily_activity so, I'll disregard those datasets in my analysis. *I've narrowed it down to working with daily_activity and daily_sleep.***"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7510eade",
   "metadata": {
    "papermill": {
     "duration": 0.017047,
     "end_time": "2023-04-13T16:59:04.879954",
     "exception": false,
     "start_time": "2023-04-13T16:59:04.862907",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**I'll do some preliminary cleaning of these two datasets before I merge into one for analysis.**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "81909f69",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:04.918384Z",
     "iopub.status.busy": "2023-04-13T16:59:04.916839Z",
     "iopub.status.idle": "2023-04-13T16:59:04.974074Z",
     "shell.execute_reply": "2023-04-13T16:59:04.972172Z"
    },
    "papermill": {
     "duration": 0.079681,
     "end_time": "2023-04-13T16:59:04.976834",
     "exception": false,
     "start_time": "2023-04-13T16:59:04.897153",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# rename date columns from 'ActivityDate' and 'SleepDay' to 'date'\n",
    "daily_activity <- daily_activity %>%\n",
    "    rename(date = ActivityDate)\n",
    "daily_sleep <- daily_sleep %>%\n",
    "  rename(date = SleepDay)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "392c37b5",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:05.016578Z",
     "iopub.status.busy": "2023-04-13T16:59:05.015005Z",
     "iopub.status.idle": "2023-04-13T16:59:05.038598Z",
     "shell.execute_reply": "2023-04-13T16:59:05.036805Z"
    },
    "papermill": {
     "duration": 0.04623,
     "end_time": "2023-04-13T16:59:05.041078",
     "exception": false,
     "start_time": "2023-04-13T16:59:04.994848",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'Id'</li><li>'date'</li><li>'TotalSteps'</li><li>'TotalDistance'</li><li>'TrackerDistance'</li><li>'LoggedActivitiesDistance'</li><li>'VeryActiveDistance'</li><li>'ModeratelyActiveDistance'</li><li>'LightActiveDistance'</li><li>'SedentaryActiveDistance'</li><li>'VeryActiveMinutes'</li><li>'FairlyActiveMinutes'</li><li>'LightlyActiveMinutes'</li><li>'SedentaryMinutes'</li><li>'Calories'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Id'\n",
       "\\item 'date'\n",
       "\\item 'TotalSteps'\n",
       "\\item 'TotalDistance'\n",
       "\\item 'TrackerDistance'\n",
       "\\item 'LoggedActivitiesDistance'\n",
       "\\item 'VeryActiveDistance'\n",
       "\\item 'ModeratelyActiveDistance'\n",
       "\\item 'LightActiveDistance'\n",
       "\\item 'SedentaryActiveDistance'\n",
       "\\item 'VeryActiveMinutes'\n",
       "\\item 'FairlyActiveMinutes'\n",
       "\\item 'LightlyActiveMinutes'\n",
       "\\item 'SedentaryMinutes'\n",
       "\\item 'Calories'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Id'\n",
       "2. 'date'\n",
       "3. 'TotalSteps'\n",
       "4. 'TotalDistance'\n",
       "5. 'TrackerDistance'\n",
       "6. 'LoggedActivitiesDistance'\n",
       "7. 'VeryActiveDistance'\n",
       "8. 'ModeratelyActiveDistance'\n",
       "9. 'LightActiveDistance'\n",
       "10. 'SedentaryActiveDistance'\n",
       "11. 'VeryActiveMinutes'\n",
       "12. 'FairlyActiveMinutes'\n",
       "13. 'LightlyActiveMinutes'\n",
       "14. 'SedentaryMinutes'\n",
       "15. 'Calories'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"Id\"                       \"date\"                    \n",
       " [3] \"TotalSteps\"               \"TotalDistance\"           \n",
       " [5] \"TrackerDistance\"          \"LoggedActivitiesDistance\"\n",
       " [7] \"VeryActiveDistance\"       \"ModeratelyActiveDistance\"\n",
       " [9] \"LightActiveDistance\"      \"SedentaryActiveDistance\" \n",
       "[11] \"VeryActiveMinutes\"        \"FairlyActiveMinutes\"     \n",
       "[13] \"LightlyActiveMinutes\"     \"SedentaryMinutes\"        \n",
       "[15] \"Calories\"                "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'Id'</li><li>'date'</li><li>'TotalSleepRecords'</li><li>'TotalMinutesAsleep'</li><li>'TotalTimeInBed'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Id'\n",
       "\\item 'date'\n",
       "\\item 'TotalSleepRecords'\n",
       "\\item 'TotalMinutesAsleep'\n",
       "\\item 'TotalTimeInBed'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Id'\n",
       "2. 'date'\n",
       "3. 'TotalSleepRecords'\n",
       "4. 'TotalMinutesAsleep'\n",
       "5. 'TotalTimeInBed'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"Id\"                 \"date\"               \"TotalSleepRecords\" \n",
       "[4] \"TotalMinutesAsleep\" \"TotalTimeInBed\"    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# check column names to confirm success\n",
    "colnames(daily_activity)\n",
    "colnames(daily_sleep)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "e5a14941",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:05.123339Z",
     "iopub.status.busy": "2023-04-13T16:59:05.121718Z",
     "iopub.status.idle": "2023-04-13T16:59:05.145662Z",
     "shell.execute_reply": "2023-04-13T16:59:05.143770Z"
    },
    "papermill": {
     "duration": 0.046572,
     "end_time": "2023-04-13T16:59:05.148236",
     "exception": false,
     "start_time": "2023-04-13T16:59:05.101664",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# convert dates from character to date (data) \n",
    "daily_activity$date <- mdy(daily_activity$date)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "8a10628b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:05.187716Z",
     "iopub.status.busy": "2023-04-13T16:59:05.186171Z",
     "iopub.status.idle": "2023-04-13T16:59:05.248994Z",
     "shell.execute_reply": "2023-04-13T16:59:05.247377Z"
    },
    "papermill": {
     "duration": 0.085283,
     "end_time": "2023-04-13T16:59:05.251287",
     "exception": false,
     "start_time": "2023-04-13T16:59:05.166004",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t940 obs. of  15 variables:\n",
      " $ Id                      : num  1.5e+09 1.5e+09 1.5e+09 1.5e+09 1.5e+09 ...\n",
      " $ date                    : Date, format: \"2016-04-12\" \"2016-04-13\" ...\n",
      " $ TotalSteps              : int  13162 10735 10460 9762 12669 9705 13019 15506 10544 9819 ...\n",
      " $ TotalDistance           : num  8.5 6.97 6.74 6.28 8.16 ...\n",
      " $ TrackerDistance         : num  8.5 6.97 6.74 6.28 8.16 ...\n",
      " $ LoggedActivitiesDistance: num  0 0 0 0 0 0 0 0 0 0 ...\n",
      " $ VeryActiveDistance      : num  1.88 1.57 2.44 2.14 2.71 ...\n",
      " $ ModeratelyActiveDistance: num  0.55 0.69 0.4 1.26 0.41 ...\n",
      " $ LightActiveDistance     : num  6.06 4.71 3.91 2.83 5.04 ...\n",
      " $ SedentaryActiveDistance : num  0 0 0 0 0 0 0 0 0 0 ...\n",
      " $ VeryActiveMinutes       : int  25 21 30 29 36 38 42 50 28 19 ...\n",
      " $ FairlyActiveMinutes     : int  13 19 11 34 10 20 16 31 12 8 ...\n",
      " $ LightlyActiveMinutes    : int  328 217 181 209 221 164 233 264 205 211 ...\n",
      " $ SedentaryMinutes        : int  728 776 1218 726 773 539 1149 775 818 838 ...\n",
      " $ Calories                : int  1985 1797 1776 1745 1863 1728 1921 2035 1786 1775 ...\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 15</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Id</th><th scope=col>date</th><th scope=col>TotalSteps</th><th scope=col>TotalDistance</th><th scope=col>TrackerDistance</th><th scope=col>LoggedActivitiesDistance</th><th scope=col>VeryActiveDistance</th><th scope=col>ModeratelyActiveDistance</th><th scope=col>LightActiveDistance</th><th scope=col>SedentaryActiveDistance</th><th scope=col>VeryActiveMinutes</th><th scope=col>FairlyActiveMinutes</th><th scope=col>LightlyActiveMinutes</th><th scope=col>SedentaryMinutes</th><th scope=col>Calories</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>2016-04-12</td><td>13162</td><td>8.50</td><td>8.50</td><td>0</td><td>1.88</td><td>0.55</td><td>6.06</td><td>0</td><td>25</td><td>13</td><td>328</td><td> 728</td><td>1985</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>2016-04-13</td><td>10735</td><td>6.97</td><td>6.97</td><td>0</td><td>1.57</td><td>0.69</td><td>4.71</td><td>0</td><td>21</td><td>19</td><td>217</td><td> 776</td><td>1797</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>2016-04-14</td><td>10460</td><td>6.74</td><td>6.74</td><td>0</td><td>2.44</td><td>0.40</td><td>3.91</td><td>0</td><td>30</td><td>11</td><td>181</td><td>1218</td><td>1776</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>2016-04-15</td><td> 9762</td><td>6.28</td><td>6.28</td><td>0</td><td>2.14</td><td>1.26</td><td>2.83</td><td>0</td><td>29</td><td>34</td><td>209</td><td> 726</td><td>1745</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>2016-04-16</td><td>12669</td><td>8.16</td><td>8.16</td><td>0</td><td>2.71</td><td>0.41</td><td>5.04</td><td>0</td><td>36</td><td>10</td><td>221</td><td> 773</td><td>1863</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>2016-04-17</td><td> 9705</td><td>6.48</td><td>6.48</td><td>0</td><td>3.19</td><td>0.78</td><td>2.51</td><td>0</td><td>38</td><td>20</td><td>164</td><td> 539</td><td>1728</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 15\n",
       "\\begin{tabular}{r|lllllllllllllll}\n",
       "  & Id & date & TotalSteps & TotalDistance & TrackerDistance & LoggedActivitiesDistance & VeryActiveDistance & ModeratelyActiveDistance & LightActiveDistance & SedentaryActiveDistance & VeryActiveMinutes & FairlyActiveMinutes & LightlyActiveMinutes & SedentaryMinutes & Calories\\\\\n",
       "  & <dbl> & <date> & <int> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <int> & <int> & <int> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 2016-04-12 & 13162 & 8.50 & 8.50 & 0 & 1.88 & 0.55 & 6.06 & 0 & 25 & 13 & 328 &  728 & 1985\\\\\n",
       "\t2 & 1503960366 & 2016-04-13 & 10735 & 6.97 & 6.97 & 0 & 1.57 & 0.69 & 4.71 & 0 & 21 & 19 & 217 &  776 & 1797\\\\\n",
       "\t3 & 1503960366 & 2016-04-14 & 10460 & 6.74 & 6.74 & 0 & 2.44 & 0.40 & 3.91 & 0 & 30 & 11 & 181 & 1218 & 1776\\\\\n",
       "\t4 & 1503960366 & 2016-04-15 &  9762 & 6.28 & 6.28 & 0 & 2.14 & 1.26 & 2.83 & 0 & 29 & 34 & 209 &  726 & 1745\\\\\n",
       "\t5 & 1503960366 & 2016-04-16 & 12669 & 8.16 & 8.16 & 0 & 2.71 & 0.41 & 5.04 & 0 & 36 & 10 & 221 &  773 & 1863\\\\\n",
       "\t6 & 1503960366 & 2016-04-17 &  9705 & 6.48 & 6.48 & 0 & 3.19 & 0.78 & 2.51 & 0 & 38 & 20 & 164 &  539 & 1728\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 15\n",
       "\n",
       "| <!--/--> | Id &lt;dbl&gt; | date &lt;date&gt; | TotalSteps &lt;int&gt; | TotalDistance &lt;dbl&gt; | TrackerDistance &lt;dbl&gt; | LoggedActivitiesDistance &lt;dbl&gt; | VeryActiveDistance &lt;dbl&gt; | ModeratelyActiveDistance &lt;dbl&gt; | LightActiveDistance &lt;dbl&gt; | SedentaryActiveDistance &lt;dbl&gt; | VeryActiveMinutes &lt;int&gt; | FairlyActiveMinutes &lt;int&gt; | LightlyActiveMinutes &lt;int&gt; | SedentaryMinutes &lt;int&gt; | Calories &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1503960366 | 2016-04-12 | 13162 | 8.50 | 8.50 | 0 | 1.88 | 0.55 | 6.06 | 0 | 25 | 13 | 328 |  728 | 1985 |\n",
       "| 2 | 1503960366 | 2016-04-13 | 10735 | 6.97 | 6.97 | 0 | 1.57 | 0.69 | 4.71 | 0 | 21 | 19 | 217 |  776 | 1797 |\n",
       "| 3 | 1503960366 | 2016-04-14 | 10460 | 6.74 | 6.74 | 0 | 2.44 | 0.40 | 3.91 | 0 | 30 | 11 | 181 | 1218 | 1776 |\n",
       "| 4 | 1503960366 | 2016-04-15 |  9762 | 6.28 | 6.28 | 0 | 2.14 | 1.26 | 2.83 | 0 | 29 | 34 | 209 |  726 | 1745 |\n",
       "| 5 | 1503960366 | 2016-04-16 | 12669 | 8.16 | 8.16 | 0 | 2.71 | 0.41 | 5.04 | 0 | 36 | 10 | 221 |  773 | 1863 |\n",
       "| 6 | 1503960366 | 2016-04-17 |  9705 | 6.48 | 6.48 | 0 | 3.19 | 0.78 | 2.51 | 0 | 38 | 20 | 164 |  539 | 1728 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         date       TotalSteps TotalDistance TrackerDistance\n",
       "1 1503960366 2016-04-12 13162      8.50          8.50           \n",
       "2 1503960366 2016-04-13 10735      6.97          6.97           \n",
       "3 1503960366 2016-04-14 10460      6.74          6.74           \n",
       "4 1503960366 2016-04-15  9762      6.28          6.28           \n",
       "5 1503960366 2016-04-16 12669      8.16          8.16           \n",
       "6 1503960366 2016-04-17  9705      6.48          6.48           \n",
       "  LoggedActivitiesDistance VeryActiveDistance ModeratelyActiveDistance\n",
       "1 0                        1.88               0.55                    \n",
       "2 0                        1.57               0.69                    \n",
       "3 0                        2.44               0.40                    \n",
       "4 0                        2.14               1.26                    \n",
       "5 0                        2.71               0.41                    \n",
       "6 0                        3.19               0.78                    \n",
       "  LightActiveDistance SedentaryActiveDistance VeryActiveMinutes\n",
       "1 6.06                0                       25               \n",
       "2 4.71                0                       21               \n",
       "3 3.91                0                       30               \n",
       "4 2.83                0                       29               \n",
       "5 5.04                0                       36               \n",
       "6 2.51                0                       38               \n",
       "  FairlyActiveMinutes LightlyActiveMinutes SedentaryMinutes Calories\n",
       "1 13                  328                   728             1985    \n",
       "2 19                  217                   776             1797    \n",
       "3 11                  181                  1218             1776    \n",
       "4 34                  209                   726             1745    \n",
       "5 10                  221                   773             1863    \n",
       "6 20                  164                   539             1728    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# check to confirm change\n",
    "str(daily_activity)\n",
    "head(daily_activity)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "33337073",
   "metadata": {
    "collapsed": true,
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:05.291778Z",
     "iopub.status.busy": "2023-04-13T16:59:05.290232Z",
     "iopub.status.idle": "2023-04-13T16:59:05.360916Z",
     "shell.execute_reply": "2023-04-13T16:59:05.359148Z"
    },
    "jupyter": {
     "outputs_hidden": true
    },
    "papermill": {
     "duration": 0.093702,
     "end_time": "2023-04-13T16:59:05.363258",
     "exception": false,
     "start_time": "2023-04-13T16:59:05.269556",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Warning message:\n",
      "“\u001b[1m\u001b[22mExpected 2 pieces. Additional pieces discarded in 413 rows [1, 2, 3, 4, 5, 6,\n",
      "7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, ...].”\n"
     ]
    }
   ],
   "source": [
    "# convert dates from character to date data and then parse date-time to date and time \n",
    "daily_sleep <- daily_sleep %>% separate(date,c(\"date\",\"time\"),sep=' ')\n",
    "daily_sleep$date <- mdy(daily_sleep$date)\n",
    "daily_sleep$time <- hms(daily_sleep$time)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "e8df0a8d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:05.405337Z",
     "iopub.status.busy": "2023-04-13T16:59:05.403559Z",
     "iopub.status.idle": "2023-04-13T16:59:05.452015Z",
     "shell.execute_reply": "2023-04-13T16:59:05.450105Z"
    },
    "papermill": {
     "duration": 0.071552,
     "end_time": "2023-04-13T16:59:05.454614",
     "exception": false,
     "start_time": "2023-04-13T16:59:05.383062",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t413 obs. of  6 variables:\n",
      " $ Id                : num  1.5e+09 1.5e+09 1.5e+09 1.5e+09 1.5e+09 ...\n",
      " $ date              : Date, format: \"2016-04-12\" \"2016-04-13\" ...\n",
      " $ time              :Formal class 'Period' [package \"lubridate\"] with 6 slots\n",
      "  .. ..@ .Data : num  0 0 0 0 0 0 0 0 0 0 ...\n",
      "  .. ..@ year  : num  0 0 0 0 0 0 0 0 0 0 ...\n",
      "  .. ..@ month : num  0 0 0 0 0 0 0 0 0 0 ...\n",
      "  .. ..@ day   : num  0 0 0 0 0 0 0 0 0 0 ...\n",
      "  .. ..@ hour  : num  12 12 12 12 12 12 12 12 12 12 ...\n",
      "  .. ..@ minute: num  0 0 0 0 0 0 0 0 0 0 ...\n",
      " $ TotalSleepRecords : int  1 2 1 2 1 1 1 1 1 1 ...\n",
      " $ TotalMinutesAsleep: int  327 384 412 340 700 304 360 325 361 430 ...\n",
      " $ TotalTimeInBed    : int  346 407 442 367 712 320 377 364 384 449 ...\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 6</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Id</th><th scope=col>date</th><th scope=col>time</th><th scope=col>TotalSleepRecords</th><th scope=col>TotalMinutesAsleep</th><th scope=col>TotalTimeInBed</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;Period&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>2016-04-12</td><td>12H 0M 0S</td><td>1</td><td>327</td><td>346</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>2016-04-13</td><td>12H 0M 0S</td><td>2</td><td>384</td><td>407</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>2016-04-15</td><td>12H 0M 0S</td><td>1</td><td>412</td><td>442</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>2016-04-16</td><td>12H 0M 0S</td><td>2</td><td>340</td><td>367</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>2016-04-17</td><td>12H 0M 0S</td><td>1</td><td>700</td><td>712</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>2016-04-19</td><td>12H 0M 0S</td><td>1</td><td>304</td><td>320</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 6\n",
       "\\begin{tabular}{r|llllll}\n",
       "  & Id & date & time & TotalSleepRecords & TotalMinutesAsleep & TotalTimeInBed\\\\\n",
       "  & <dbl> & <date> & <Period> & <int> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 2016-04-12 & 12H 0M 0S & 1 & 327 & 346\\\\\n",
       "\t2 & 1503960366 & 2016-04-13 & 12H 0M 0S & 2 & 384 & 407\\\\\n",
       "\t3 & 1503960366 & 2016-04-15 & 12H 0M 0S & 1 & 412 & 442\\\\\n",
       "\t4 & 1503960366 & 2016-04-16 & 12H 0M 0S & 2 & 340 & 367\\\\\n",
       "\t5 & 1503960366 & 2016-04-17 & 12H 0M 0S & 1 & 700 & 712\\\\\n",
       "\t6 & 1503960366 & 2016-04-19 & 12H 0M 0S & 1 & 304 & 320\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 6\n",
       "\n",
       "| <!--/--> | Id &lt;dbl&gt; | date &lt;date&gt; | time &lt;Period&gt; | TotalSleepRecords &lt;int&gt; | TotalMinutesAsleep &lt;int&gt; | TotalTimeInBed &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|\n",
       "| 1 | 1503960366 | 2016-04-12 | 12H 0M 0S | 1 | 327 | 346 |\n",
       "| 2 | 1503960366 | 2016-04-13 | 12H 0M 0S | 2 | 384 | 407 |\n",
       "| 3 | 1503960366 | 2016-04-15 | 12H 0M 0S | 1 | 412 | 442 |\n",
       "| 4 | 1503960366 | 2016-04-16 | 12H 0M 0S | 2 | 340 | 367 |\n",
       "| 5 | 1503960366 | 2016-04-17 | 12H 0M 0S | 1 | 700 | 712 |\n",
       "| 6 | 1503960366 | 2016-04-19 | 12H 0M 0S | 1 | 304 | 320 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         date       time      TotalSleepRecords TotalMinutesAsleep\n",
       "1 1503960366 2016-04-12 12H 0M 0S 1                 327               \n",
       "2 1503960366 2016-04-13 12H 0M 0S 2                 384               \n",
       "3 1503960366 2016-04-15 12H 0M 0S 1                 412               \n",
       "4 1503960366 2016-04-16 12H 0M 0S 2                 340               \n",
       "5 1503960366 2016-04-17 12H 0M 0S 1                 700               \n",
       "6 1503960366 2016-04-19 12H 0M 0S 1                 304               \n",
       "  TotalTimeInBed\n",
       "1 346           \n",
       "2 407           \n",
       "3 442           \n",
       "4 367           \n",
       "5 712           \n",
       "6 320           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# check to confirm changes\n",
    "str(daily_sleep)\n",
    "head(daily_sleep)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "160befb1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:05.497964Z",
     "iopub.status.busy": "2023-04-13T16:59:05.496286Z",
     "iopub.status.idle": "2023-04-13T16:59:05.700052Z",
     "shell.execute_reply": "2023-04-13T16:59:05.698315Z"
    },
    "papermill": {
     "duration": 0.228518,
     "end_time": "2023-04-13T16:59:05.702590",
     "exception": false,
     "start_time": "2023-04-13T16:59:05.474072",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0"
      ],
      "text/latex": [
       "0"
      ],
      "text/markdown": [
       "0"
      ],
      "text/plain": [
       "[1] 0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "3"
      ],
      "text/latex": [
       "3"
      ],
      "text/markdown": [
       "3"
      ],
      "text/plain": [
       "[1] 3"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# check for duplicates\n",
    "sum(duplicated(daily_activity)) \n",
    "sum(duplicated(daily_sleep)) "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2d7392f0",
   "metadata": {
    "papermill": {
     "duration": 0.019006,
     "end_time": "2023-04-13T16:59:05.740393",
     "exception": false,
     "start_time": "2023-04-13T16:59:05.721387",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "No duplicates found in daily_activity but three found in daily_sleep. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "28b33535",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:05.783236Z",
     "iopub.status.busy": "2023-04-13T16:59:05.781714Z",
     "iopub.status.idle": "2023-04-13T16:59:05.965351Z",
     "shell.execute_reply": "2023-04-13T16:59:05.963579Z"
    },
    "papermill": {
     "duration": 0.207765,
     "end_time": "2023-04-13T16:59:05.967693",
     "exception": false,
     "start_time": "2023-04-13T16:59:05.759928",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0"
      ],
      "text/latex": [
       "0"
      ],
      "text/markdown": [
       "0"
      ],
      "text/plain": [
       "[1] 0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# remove duplicates and recheck \n",
    "daily_sleep <- daily_sleep %>% distinct()\n",
    "sum(duplicated(daily_sleep)) "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e91274dc",
   "metadata": {
    "papermill": {
     "duration": 0.019299,
     "end_time": "2023-04-13T16:59:06.007727",
     "exception": false,
     "start_time": "2023-04-13T16:59:05.988428",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "All duplicates have been removed so now I'll check for missing values."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "7e1b0b12",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:06.049839Z",
     "iopub.status.busy": "2023-04-13T16:59:06.048369Z",
     "iopub.status.idle": "2023-04-13T16:59:06.072267Z",
     "shell.execute_reply": "2023-04-13T16:59:06.070373Z"
    },
    "papermill": {
     "duration": 0.047625,
     "end_time": "2023-04-13T16:59:06.075220",
     "exception": false,
     "start_time": "2023-04-13T16:59:06.027595",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0"
      ],
      "text/latex": [
       "0"
      ],
      "text/markdown": [
       "0"
      ],
      "text/plain": [
       "[1] 0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0"
      ],
      "text/latex": [
       "0"
      ],
      "text/markdown": [
       "0"
      ],
      "text/plain": [
       "[1] 0"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# check for missing values\n",
    "sum(is.na(daily_activity)) \n",
    "sum(is.na(daily_sleep)) "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "3d0e2722",
   "metadata": {
    "papermill": {
     "duration": 0.020819,
     "end_time": "2023-04-13T16:59:06.115066",
     "exception": false,
     "start_time": "2023-04-13T16:59:06.094247",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Merge into one dataframe before continue cleaning."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "6d03c3d9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:06.160568Z",
     "iopub.status.busy": "2023-04-13T16:59:06.158897Z",
     "iopub.status.idle": "2023-04-13T16:59:06.215169Z",
     "shell.execute_reply": "2023-04-13T16:59:06.213435Z"
    },
    "papermill": {
     "duration": 0.081852,
     "end_time": "2023-04-13T16:59:06.217560",
     "exception": false,
     "start_time": "2023-04-13T16:59:06.135708",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 19</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Id</th><th scope=col>date</th><th scope=col>TotalSteps</th><th scope=col>TotalDistance</th><th scope=col>TrackerDistance</th><th scope=col>LoggedActivitiesDistance</th><th scope=col>VeryActiveDistance</th><th scope=col>ModeratelyActiveDistance</th><th scope=col>LightActiveDistance</th><th scope=col>SedentaryActiveDistance</th><th scope=col>VeryActiveMinutes</th><th scope=col>FairlyActiveMinutes</th><th scope=col>LightlyActiveMinutes</th><th scope=col>SedentaryMinutes</th><th scope=col>Calories</th><th scope=col>time</th><th scope=col>TotalSleepRecords</th><th scope=col>TotalMinutesAsleep</th><th scope=col>TotalTimeInBed</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;Period&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>2016-04-12</td><td>13162</td><td>8.50</td><td>8.50</td><td>0</td><td>1.88</td><td>0.55</td><td>6.06</td><td>0</td><td>25</td><td>13</td><td>328</td><td>728</td><td>1985</td><td>12H 0M 0S</td><td>1</td><td>327</td><td>346</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>2016-04-13</td><td>10735</td><td>6.97</td><td>6.97</td><td>0</td><td>1.57</td><td>0.69</td><td>4.71</td><td>0</td><td>21</td><td>19</td><td>217</td><td>776</td><td>1797</td><td>12H 0M 0S</td><td>2</td><td>384</td><td>407</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>2016-04-15</td><td> 9762</td><td>6.28</td><td>6.28</td><td>0</td><td>2.14</td><td>1.26</td><td>2.83</td><td>0</td><td>29</td><td>34</td><td>209</td><td>726</td><td>1745</td><td>12H 0M 0S</td><td>1</td><td>412</td><td>442</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>2016-04-16</td><td>12669</td><td>8.16</td><td>8.16</td><td>0</td><td>2.71</td><td>0.41</td><td>5.04</td><td>0</td><td>36</td><td>10</td><td>221</td><td>773</td><td>1863</td><td>12H 0M 0S</td><td>2</td><td>340</td><td>367</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>2016-04-17</td><td> 9705</td><td>6.48</td><td>6.48</td><td>0</td><td>3.19</td><td>0.78</td><td>2.51</td><td>0</td><td>38</td><td>20</td><td>164</td><td>539</td><td>1728</td><td>12H 0M 0S</td><td>1</td><td>700</td><td>712</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>2016-04-19</td><td>15506</td><td>9.88</td><td>9.88</td><td>0</td><td>3.53</td><td>1.32</td><td>5.03</td><td>0</td><td>50</td><td>31</td><td>264</td><td>775</td><td>2035</td><td>12H 0M 0S</td><td>1</td><td>304</td><td>320</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 19\n",
       "\\begin{tabular}{r|lllllllllllllllllll}\n",
       "  & Id & date & TotalSteps & TotalDistance & TrackerDistance & LoggedActivitiesDistance & VeryActiveDistance & ModeratelyActiveDistance & LightActiveDistance & SedentaryActiveDistance & VeryActiveMinutes & FairlyActiveMinutes & LightlyActiveMinutes & SedentaryMinutes & Calories & time & TotalSleepRecords & TotalMinutesAsleep & TotalTimeInBed\\\\\n",
       "  & <dbl> & <date> & <int> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <int> & <int> & <int> & <int> & <int> & <Period> & <int> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 2016-04-12 & 13162 & 8.50 & 8.50 & 0 & 1.88 & 0.55 & 6.06 & 0 & 25 & 13 & 328 & 728 & 1985 & 12H 0M 0S & 1 & 327 & 346\\\\\n",
       "\t2 & 1503960366 & 2016-04-13 & 10735 & 6.97 & 6.97 & 0 & 1.57 & 0.69 & 4.71 & 0 & 21 & 19 & 217 & 776 & 1797 & 12H 0M 0S & 2 & 384 & 407\\\\\n",
       "\t3 & 1503960366 & 2016-04-15 &  9762 & 6.28 & 6.28 & 0 & 2.14 & 1.26 & 2.83 & 0 & 29 & 34 & 209 & 726 & 1745 & 12H 0M 0S & 1 & 412 & 442\\\\\n",
       "\t4 & 1503960366 & 2016-04-16 & 12669 & 8.16 & 8.16 & 0 & 2.71 & 0.41 & 5.04 & 0 & 36 & 10 & 221 & 773 & 1863 & 12H 0M 0S & 2 & 340 & 367\\\\\n",
       "\t5 & 1503960366 & 2016-04-17 &  9705 & 6.48 & 6.48 & 0 & 3.19 & 0.78 & 2.51 & 0 & 38 & 20 & 164 & 539 & 1728 & 12H 0M 0S & 1 & 700 & 712\\\\\n",
       "\t6 & 1503960366 & 2016-04-19 & 15506 & 9.88 & 9.88 & 0 & 3.53 & 1.32 & 5.03 & 0 & 50 & 31 & 264 & 775 & 2035 & 12H 0M 0S & 1 & 304 & 320\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 19\n",
       "\n",
       "| <!--/--> | Id &lt;dbl&gt; | date &lt;date&gt; | TotalSteps &lt;int&gt; | TotalDistance &lt;dbl&gt; | TrackerDistance &lt;dbl&gt; | LoggedActivitiesDistance &lt;dbl&gt; | VeryActiveDistance &lt;dbl&gt; | ModeratelyActiveDistance &lt;dbl&gt; | LightActiveDistance &lt;dbl&gt; | SedentaryActiveDistance &lt;dbl&gt; | VeryActiveMinutes &lt;int&gt; | FairlyActiveMinutes &lt;int&gt; | LightlyActiveMinutes &lt;int&gt; | SedentaryMinutes &lt;int&gt; | Calories &lt;int&gt; | time &lt;Period&gt; | TotalSleepRecords &lt;int&gt; | TotalMinutesAsleep &lt;int&gt; | TotalTimeInBed &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1503960366 | 2016-04-12 | 13162 | 8.50 | 8.50 | 0 | 1.88 | 0.55 | 6.06 | 0 | 25 | 13 | 328 | 728 | 1985 | 12H 0M 0S | 1 | 327 | 346 |\n",
       "| 2 | 1503960366 | 2016-04-13 | 10735 | 6.97 | 6.97 | 0 | 1.57 | 0.69 | 4.71 | 0 | 21 | 19 | 217 | 776 | 1797 | 12H 0M 0S | 2 | 384 | 407 |\n",
       "| 3 | 1503960366 | 2016-04-15 |  9762 | 6.28 | 6.28 | 0 | 2.14 | 1.26 | 2.83 | 0 | 29 | 34 | 209 | 726 | 1745 | 12H 0M 0S | 1 | 412 | 442 |\n",
       "| 4 | 1503960366 | 2016-04-16 | 12669 | 8.16 | 8.16 | 0 | 2.71 | 0.41 | 5.04 | 0 | 36 | 10 | 221 | 773 | 1863 | 12H 0M 0S | 2 | 340 | 367 |\n",
       "| 5 | 1503960366 | 2016-04-17 |  9705 | 6.48 | 6.48 | 0 | 3.19 | 0.78 | 2.51 | 0 | 38 | 20 | 164 | 539 | 1728 | 12H 0M 0S | 1 | 700 | 712 |\n",
       "| 6 | 1503960366 | 2016-04-19 | 15506 | 9.88 | 9.88 | 0 | 3.53 | 1.32 | 5.03 | 0 | 50 | 31 | 264 | 775 | 2035 | 12H 0M 0S | 1 | 304 | 320 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         date       TotalSteps TotalDistance TrackerDistance\n",
       "1 1503960366 2016-04-12 13162      8.50          8.50           \n",
       "2 1503960366 2016-04-13 10735      6.97          6.97           \n",
       "3 1503960366 2016-04-15  9762      6.28          6.28           \n",
       "4 1503960366 2016-04-16 12669      8.16          8.16           \n",
       "5 1503960366 2016-04-17  9705      6.48          6.48           \n",
       "6 1503960366 2016-04-19 15506      9.88          9.88           \n",
       "  LoggedActivitiesDistance VeryActiveDistance ModeratelyActiveDistance\n",
       "1 0                        1.88               0.55                    \n",
       "2 0                        1.57               0.69                    \n",
       "3 0                        2.14               1.26                    \n",
       "4 0                        2.71               0.41                    \n",
       "5 0                        3.19               0.78                    \n",
       "6 0                        3.53               1.32                    \n",
       "  LightActiveDistance SedentaryActiveDistance VeryActiveMinutes\n",
       "1 6.06                0                       25               \n",
       "2 4.71                0                       21               \n",
       "3 2.83                0                       29               \n",
       "4 5.04                0                       36               \n",
       "5 2.51                0                       38               \n",
       "6 5.03                0                       50               \n",
       "  FairlyActiveMinutes LightlyActiveMinutes SedentaryMinutes Calories time     \n",
       "1 13                  328                  728              1985     12H 0M 0S\n",
       "2 19                  217                  776              1797     12H 0M 0S\n",
       "3 34                  209                  726              1745     12H 0M 0S\n",
       "4 10                  221                  773              1863     12H 0M 0S\n",
       "5 20                  164                  539              1728     12H 0M 0S\n",
       "6 31                  264                  775              2035     12H 0M 0S\n",
       "  TotalSleepRecords TotalMinutesAsleep TotalTimeInBed\n",
       "1 1                 327                346           \n",
       "2 2                 384                407           \n",
       "3 1                 412                442           \n",
       "4 2                 340                367           \n",
       "5 1                 700                712           \n",
       "6 1                 304                320           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Merge into one df\n",
    "daily_merged <- merge(daily_activity, daily_sleep, by=c('Id', 'date'))\n",
    "head(daily_merged)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "15c2cc14",
   "metadata": {
    "papermill": {
     "duration": 0.019441,
     "end_time": "2023-04-13T16:59:06.256432",
     "exception": false,
     "start_time": "2023-04-13T16:59:06.236991",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Remove columns with null, duplicate and uneccessary values and save as new dataframe."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "id": "994ba36e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:06.300004Z",
     "iopub.status.busy": "2023-04-13T16:59:06.298335Z",
     "iopub.status.idle": "2023-04-13T16:59:06.341203Z",
     "shell.execute_reply": "2023-04-13T16:59:06.339262Z"
    },
    "papermill": {
     "duration": 0.068219,
     "end_time": "2023-04-13T16:59:06.343715",
     "exception": false,
     "start_time": "2023-04-13T16:59:06.275496",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 15</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>Id</th><th scope=col>date</th><th scope=col>TotalSteps</th><th scope=col>TotalDistance</th><th scope=col>VeryActiveDistance</th><th scope=col>ModeratelyActiveDistance</th><th scope=col>LightActiveDistance</th><th scope=col>VeryActiveMinutes</th><th scope=col>FairlyActiveMinutes</th><th scope=col>LightlyActiveMinutes</th><th scope=col>SedentaryMinutes</th><th scope=col>Calories</th><th scope=col>TotalSleepRecords</th><th scope=col>TotalMinutesAsleep</th><th scope=col>TotalTimeInBed</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>2016-04-12</td><td>13162</td><td>8.50</td><td>1.88</td><td>0.55</td><td>6.06</td><td>25</td><td>13</td><td>328</td><td>728</td><td>1985</td><td>1</td><td>327</td><td>346</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>2016-04-13</td><td>10735</td><td>6.97</td><td>1.57</td><td>0.69</td><td>4.71</td><td>21</td><td>19</td><td>217</td><td>776</td><td>1797</td><td>2</td><td>384</td><td>407</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>2016-04-15</td><td> 9762</td><td>6.28</td><td>2.14</td><td>1.26</td><td>2.83</td><td>29</td><td>34</td><td>209</td><td>726</td><td>1745</td><td>1</td><td>412</td><td>442</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>2016-04-16</td><td>12669</td><td>8.16</td><td>2.71</td><td>0.41</td><td>5.04</td><td>36</td><td>10</td><td>221</td><td>773</td><td>1863</td><td>2</td><td>340</td><td>367</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>2016-04-17</td><td> 9705</td><td>6.48</td><td>3.19</td><td>0.78</td><td>2.51</td><td>38</td><td>20</td><td>164</td><td>539</td><td>1728</td><td>1</td><td>700</td><td>712</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>2016-04-19</td><td>15506</td><td>9.88</td><td>3.53</td><td>1.32</td><td>5.03</td><td>50</td><td>31</td><td>264</td><td>775</td><td>2035</td><td>1</td><td>304</td><td>320</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 15\n",
       "\\begin{tabular}{r|lllllllllllllll}\n",
       "  & Id & date & TotalSteps & TotalDistance & VeryActiveDistance & ModeratelyActiveDistance & LightActiveDistance & VeryActiveMinutes & FairlyActiveMinutes & LightlyActiveMinutes & SedentaryMinutes & Calories & TotalSleepRecords & TotalMinutesAsleep & TotalTimeInBed\\\\\n",
       "  & <dbl> & <date> & <int> & <dbl> & <dbl> & <dbl> & <dbl> & <int> & <int> & <int> & <int> & <int> & <int> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 2016-04-12 & 13162 & 8.50 & 1.88 & 0.55 & 6.06 & 25 & 13 & 328 & 728 & 1985 & 1 & 327 & 346\\\\\n",
       "\t2 & 1503960366 & 2016-04-13 & 10735 & 6.97 & 1.57 & 0.69 & 4.71 & 21 & 19 & 217 & 776 & 1797 & 2 & 384 & 407\\\\\n",
       "\t3 & 1503960366 & 2016-04-15 &  9762 & 6.28 & 2.14 & 1.26 & 2.83 & 29 & 34 & 209 & 726 & 1745 & 1 & 412 & 442\\\\\n",
       "\t4 & 1503960366 & 2016-04-16 & 12669 & 8.16 & 2.71 & 0.41 & 5.04 & 36 & 10 & 221 & 773 & 1863 & 2 & 340 & 367\\\\\n",
       "\t5 & 1503960366 & 2016-04-17 &  9705 & 6.48 & 3.19 & 0.78 & 2.51 & 38 & 20 & 164 & 539 & 1728 & 1 & 700 & 712\\\\\n",
       "\t6 & 1503960366 & 2016-04-19 & 15506 & 9.88 & 3.53 & 1.32 & 5.03 & 50 & 31 & 264 & 775 & 2035 & 1 & 304 & 320\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 15\n",
       "\n",
       "| <!--/--> | Id &lt;dbl&gt; | date &lt;date&gt; | TotalSteps &lt;int&gt; | TotalDistance &lt;dbl&gt; | VeryActiveDistance &lt;dbl&gt; | ModeratelyActiveDistance &lt;dbl&gt; | LightActiveDistance &lt;dbl&gt; | VeryActiveMinutes &lt;int&gt; | FairlyActiveMinutes &lt;int&gt; | LightlyActiveMinutes &lt;int&gt; | SedentaryMinutes &lt;int&gt; | Calories &lt;int&gt; | TotalSleepRecords &lt;int&gt; | TotalMinutesAsleep &lt;int&gt; | TotalTimeInBed &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1503960366 | 2016-04-12 | 13162 | 8.50 | 1.88 | 0.55 | 6.06 | 25 | 13 | 328 | 728 | 1985 | 1 | 327 | 346 |\n",
       "| 2 | 1503960366 | 2016-04-13 | 10735 | 6.97 | 1.57 | 0.69 | 4.71 | 21 | 19 | 217 | 776 | 1797 | 2 | 384 | 407 |\n",
       "| 3 | 1503960366 | 2016-04-15 |  9762 | 6.28 | 2.14 | 1.26 | 2.83 | 29 | 34 | 209 | 726 | 1745 | 1 | 412 | 442 |\n",
       "| 4 | 1503960366 | 2016-04-16 | 12669 | 8.16 | 2.71 | 0.41 | 5.04 | 36 | 10 | 221 | 773 | 1863 | 2 | 340 | 367 |\n",
       "| 5 | 1503960366 | 2016-04-17 |  9705 | 6.48 | 3.19 | 0.78 | 2.51 | 38 | 20 | 164 | 539 | 1728 | 1 | 700 | 712 |\n",
       "| 6 | 1503960366 | 2016-04-19 | 15506 | 9.88 | 3.53 | 1.32 | 5.03 | 50 | 31 | 264 | 775 | 2035 | 1 | 304 | 320 |\n",
       "\n"
      ],
      "text/plain": [
       "  Id         date       TotalSteps TotalDistance VeryActiveDistance\n",
       "1 1503960366 2016-04-12 13162      8.50          1.88              \n",
       "2 1503960366 2016-04-13 10735      6.97          1.57              \n",
       "3 1503960366 2016-04-15  9762      6.28          2.14              \n",
       "4 1503960366 2016-04-16 12669      8.16          2.71              \n",
       "5 1503960366 2016-04-17  9705      6.48          3.19              \n",
       "6 1503960366 2016-04-19 15506      9.88          3.53              \n",
       "  ModeratelyActiveDistance LightActiveDistance VeryActiveMinutes\n",
       "1 0.55                     6.06                25               \n",
       "2 0.69                     4.71                21               \n",
       "3 1.26                     2.83                29               \n",
       "4 0.41                     5.04                36               \n",
       "5 0.78                     2.51                38               \n",
       "6 1.32                     5.03                50               \n",
       "  FairlyActiveMinutes LightlyActiveMinutes SedentaryMinutes Calories\n",
       "1 13                  328                  728              1985    \n",
       "2 19                  217                  776              1797    \n",
       "3 34                  209                  726              1745    \n",
       "4 10                  221                  773              1863    \n",
       "5 20                  164                  539              1728    \n",
       "6 31                  264                  775              2035    \n",
       "  TotalSleepRecords TotalMinutesAsleep TotalTimeInBed\n",
       "1 1                 327                346           \n",
       "2 2                 384                407           \n",
       "3 1                 412                442           \n",
       "4 2                 340                367           \n",
       "5 1                 700                712           \n",
       "6 1                 304                320           "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# LoggedActivities(column 6),SedentaryActivities(column 10): null\n",
    "# TrackerDistance(column 5): duplicate\n",
    "# time(column 16): uneccessary\n",
    "daily_merged_trimmed <- daily_merged %>% select(-5,-6,-10,-16) \n",
    "head(daily_merged_trimmed)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "89eaea14",
   "metadata": {
    "papermill": {
     "duration": 0.019652,
     "end_time": "2023-04-13T16:59:06.383829",
     "exception": false,
     "start_time": "2023-04-13T16:59:06.364177",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Clean variable names for consistency and ease of use."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 23,
   "id": "638cf4bf",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:06.427094Z",
     "iopub.status.busy": "2023-04-13T16:59:06.425444Z",
     "iopub.status.idle": "2023-04-13T16:59:06.550707Z",
     "shell.execute_reply": "2023-04-13T16:59:06.548806Z"
    },
    "papermill": {
     "duration": 0.149221,
     "end_time": "2023-04-13T16:59:06.553210",
     "exception": false,
     "start_time": "2023-04-13T16:59:06.403989",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 15</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>id</th><th scope=col>date</th><th scope=col>total_steps</th><th scope=col>total_distance</th><th scope=col>very_active_distance</th><th scope=col>moderately_active_distance</th><th scope=col>light_active_distance</th><th scope=col>very_active_minutes</th><th scope=col>fairly_active_minutes</th><th scope=col>lightly_active_minutes</th><th scope=col>sedentary_minutes</th><th scope=col>calories</th><th scope=col>total_sleep_records</th><th scope=col>total_minutes_asleep</th><th scope=col>total_time_in_bed</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>2016-04-12</td><td>13162</td><td>8.50</td><td>1.88</td><td>0.55</td><td>6.06</td><td>25</td><td>13</td><td>328</td><td>728</td><td>1985</td><td>1</td><td>327</td><td>346</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>2016-04-13</td><td>10735</td><td>6.97</td><td>1.57</td><td>0.69</td><td>4.71</td><td>21</td><td>19</td><td>217</td><td>776</td><td>1797</td><td>2</td><td>384</td><td>407</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>2016-04-15</td><td> 9762</td><td>6.28</td><td>2.14</td><td>1.26</td><td>2.83</td><td>29</td><td>34</td><td>209</td><td>726</td><td>1745</td><td>1</td><td>412</td><td>442</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>2016-04-16</td><td>12669</td><td>8.16</td><td>2.71</td><td>0.41</td><td>5.04</td><td>36</td><td>10</td><td>221</td><td>773</td><td>1863</td><td>2</td><td>340</td><td>367</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>2016-04-17</td><td> 9705</td><td>6.48</td><td>3.19</td><td>0.78</td><td>2.51</td><td>38</td><td>20</td><td>164</td><td>539</td><td>1728</td><td>1</td><td>700</td><td>712</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>2016-04-19</td><td>15506</td><td>9.88</td><td>3.53</td><td>1.32</td><td>5.03</td><td>50</td><td>31</td><td>264</td><td>775</td><td>2035</td><td>1</td><td>304</td><td>320</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 15\n",
       "\\begin{tabular}{r|lllllllllllllll}\n",
       "  & id & date & total\\_steps & total\\_distance & very\\_active\\_distance & moderately\\_active\\_distance & light\\_active\\_distance & very\\_active\\_minutes & fairly\\_active\\_minutes & lightly\\_active\\_minutes & sedentary\\_minutes & calories & total\\_sleep\\_records & total\\_minutes\\_asleep & total\\_time\\_in\\_bed\\\\\n",
       "  & <dbl> & <date> & <int> & <dbl> & <dbl> & <dbl> & <dbl> & <int> & <int> & <int> & <int> & <int> & <int> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 2016-04-12 & 13162 & 8.50 & 1.88 & 0.55 & 6.06 & 25 & 13 & 328 & 728 & 1985 & 1 & 327 & 346\\\\\n",
       "\t2 & 1503960366 & 2016-04-13 & 10735 & 6.97 & 1.57 & 0.69 & 4.71 & 21 & 19 & 217 & 776 & 1797 & 2 & 384 & 407\\\\\n",
       "\t3 & 1503960366 & 2016-04-15 &  9762 & 6.28 & 2.14 & 1.26 & 2.83 & 29 & 34 & 209 & 726 & 1745 & 1 & 412 & 442\\\\\n",
       "\t4 & 1503960366 & 2016-04-16 & 12669 & 8.16 & 2.71 & 0.41 & 5.04 & 36 & 10 & 221 & 773 & 1863 & 2 & 340 & 367\\\\\n",
       "\t5 & 1503960366 & 2016-04-17 &  9705 & 6.48 & 3.19 & 0.78 & 2.51 & 38 & 20 & 164 & 539 & 1728 & 1 & 700 & 712\\\\\n",
       "\t6 & 1503960366 & 2016-04-19 & 15506 & 9.88 & 3.53 & 1.32 & 5.03 & 50 & 31 & 264 & 775 & 2035 & 1 & 304 & 320\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 15\n",
       "\n",
       "| <!--/--> | id &lt;dbl&gt; | date &lt;date&gt; | total_steps &lt;int&gt; | total_distance &lt;dbl&gt; | very_active_distance &lt;dbl&gt; | moderately_active_distance &lt;dbl&gt; | light_active_distance &lt;dbl&gt; | very_active_minutes &lt;int&gt; | fairly_active_minutes &lt;int&gt; | lightly_active_minutes &lt;int&gt; | sedentary_minutes &lt;int&gt; | calories &lt;int&gt; | total_sleep_records &lt;int&gt; | total_minutes_asleep &lt;int&gt; | total_time_in_bed &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1503960366 | 2016-04-12 | 13162 | 8.50 | 1.88 | 0.55 | 6.06 | 25 | 13 | 328 | 728 | 1985 | 1 | 327 | 346 |\n",
       "| 2 | 1503960366 | 2016-04-13 | 10735 | 6.97 | 1.57 | 0.69 | 4.71 | 21 | 19 | 217 | 776 | 1797 | 2 | 384 | 407 |\n",
       "| 3 | 1503960366 | 2016-04-15 |  9762 | 6.28 | 2.14 | 1.26 | 2.83 | 29 | 34 | 209 | 726 | 1745 | 1 | 412 | 442 |\n",
       "| 4 | 1503960366 | 2016-04-16 | 12669 | 8.16 | 2.71 | 0.41 | 5.04 | 36 | 10 | 221 | 773 | 1863 | 2 | 340 | 367 |\n",
       "| 5 | 1503960366 | 2016-04-17 |  9705 | 6.48 | 3.19 | 0.78 | 2.51 | 38 | 20 | 164 | 539 | 1728 | 1 | 700 | 712 |\n",
       "| 6 | 1503960366 | 2016-04-19 | 15506 | 9.88 | 3.53 | 1.32 | 5.03 | 50 | 31 | 264 | 775 | 2035 | 1 | 304 | 320 |\n",
       "\n"
      ],
      "text/plain": [
       "  id         date       total_steps total_distance very_active_distance\n",
       "1 1503960366 2016-04-12 13162       8.50           1.88                \n",
       "2 1503960366 2016-04-13 10735       6.97           1.57                \n",
       "3 1503960366 2016-04-15  9762       6.28           2.14                \n",
       "4 1503960366 2016-04-16 12669       8.16           2.71                \n",
       "5 1503960366 2016-04-17  9705       6.48           3.19                \n",
       "6 1503960366 2016-04-19 15506       9.88           3.53                \n",
       "  moderately_active_distance light_active_distance very_active_minutes\n",
       "1 0.55                       6.06                  25                 \n",
       "2 0.69                       4.71                  21                 \n",
       "3 1.26                       2.83                  29                 \n",
       "4 0.41                       5.04                  36                 \n",
       "5 0.78                       2.51                  38                 \n",
       "6 1.32                       5.03                  50                 \n",
       "  fairly_active_minutes lightly_active_minutes sedentary_minutes calories\n",
       "1 13                    328                    728               1985    \n",
       "2 19                    217                    776               1797    \n",
       "3 34                    209                    726               1745    \n",
       "4 10                    221                    773               1863    \n",
       "5 20                    164                    539               1728    \n",
       "6 31                    264                    775               2035    \n",
       "  total_sleep_records total_minutes_asleep total_time_in_bed\n",
       "1 1                   327                  346              \n",
       "2 2                   384                  407              \n",
       "3 1                   412                  442              \n",
       "4 2                   340                  367              \n",
       "5 1                   700                  712              \n",
       "6 1                   304                  320              "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# clean names\n",
    "daily_activity_sleep <- clean_names(daily_merged_trimmed) \n",
    "head(daily_activity_sleep)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7f74568c",
   "metadata": {
    "papermill": {
     "duration": 0.019623,
     "end_time": "2023-04-13T16:59:06.592735",
     "exception": false,
     "start_time": "2023-04-13T16:59:06.573112",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Analyze"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d9853a5a",
   "metadata": {
    "papermill": {
     "duration": 0.02012,
     "end_time": "2023-04-13T16:59:06.632773",
     "exception": false,
     "start_time": "2023-04-13T16:59:06.612653",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "I want to start with a glance at the statistical summaries. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 24,
   "id": "1d9a3f2c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:06.677233Z",
     "iopub.status.busy": "2023-04-13T16:59:06.675599Z",
     "iopub.status.idle": "2023-04-13T16:59:06.703453Z",
     "shell.execute_reply": "2023-04-13T16:59:06.700279Z"
    },
    "papermill": {
     "duration": 0.05289,
     "end_time": "2023-04-13T16:59:06.705916",
     "exception": false,
     "start_time": "2023-04-13T16:59:06.653026",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "       id                 date             total_steps    total_distance  \n",
       " Min.   :1.504e+09   Min.   :2016-04-12   Min.   :   17   Min.   : 0.010  \n",
       " 1st Qu.:3.977e+09   1st Qu.:2016-04-19   1st Qu.: 5189   1st Qu.: 3.592  \n",
       " Median :4.703e+09   Median :2016-04-27   Median : 8913   Median : 6.270  \n",
       " Mean   :4.995e+09   Mean   :2016-04-26   Mean   : 8515   Mean   : 6.012  \n",
       " 3rd Qu.:6.962e+09   3rd Qu.:2016-05-04   3rd Qu.:11370   3rd Qu.: 8.005  \n",
       " Max.   :8.792e+09   Max.   :2016-05-12   Max.   :22770   Max.   :17.540  \n",
       " very_active_distance moderately_active_distance light_active_distance\n",
       " Min.   : 0.000       Min.   :0.0000             Min.   :0.010        \n",
       " 1st Qu.: 0.000       1st Qu.:0.0000             1st Qu.:2.540        \n",
       " Median : 0.570       Median :0.4200             Median :3.665        \n",
       " Mean   : 1.446       Mean   :0.7439             Mean   :3.791        \n",
       " 3rd Qu.: 2.360       3rd Qu.:1.0375             3rd Qu.:4.918        \n",
       " Max.   :12.540       Max.   :6.4800             Max.   :9.480        \n",
       " very_active_minutes fairly_active_minutes lightly_active_minutes\n",
       " Min.   :  0.00      Min.   :  0.00        Min.   :  2.0         \n",
       " 1st Qu.:  0.00      1st Qu.:  0.00        1st Qu.:158.0         \n",
       " Median :  9.00      Median : 11.00        Median :208.0         \n",
       " Mean   : 25.05      Mean   : 17.92        Mean   :216.5         \n",
       " 3rd Qu.: 38.00      3rd Qu.: 26.75        3rd Qu.:263.0         \n",
       " Max.   :210.00      Max.   :143.00        Max.   :518.0         \n",
       " sedentary_minutes    calories    total_sleep_records total_minutes_asleep\n",
       " Min.   :   0.0    Min.   : 257   Min.   :1.00        Min.   : 58.0       \n",
       " 1st Qu.: 631.2    1st Qu.:1841   1st Qu.:1.00        1st Qu.:361.0       \n",
       " Median : 717.0    Median :2207   Median :1.00        Median :432.5       \n",
       " Mean   : 712.1    Mean   :2389   Mean   :1.12        Mean   :419.2       \n",
       " 3rd Qu.: 782.8    3rd Qu.:2920   3rd Qu.:1.00        3rd Qu.:490.0       \n",
       " Max.   :1265.0    Max.   :4900   Max.   :3.00        Max.   :796.0       \n",
       " total_time_in_bed\n",
       " Min.   : 61.0    \n",
       " 1st Qu.:403.8    \n",
       " Median :463.0    \n",
       " Mean   :458.5    \n",
       " 3rd Qu.:526.0    \n",
       " Max.   :961.0    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# get summary\n",
    "summary(daily_activity_sleep)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b28875c3",
   "metadata": {
    "papermill": {
     "duration": 0.021406,
     "end_time": "2023-04-13T16:59:06.747371",
     "exception": false,
     "start_time": "2023-04-13T16:59:06.725965",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Now I want to narrow it down and explore some initial information. I want to learn more about the average steps, calories, sleep and total time in bed so I'll get those means. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 25,
   "id": "6914d5e9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:06.793918Z",
     "iopub.status.busy": "2023-04-13T16:59:06.792255Z",
     "iopub.status.idle": "2023-04-13T16:59:06.839026Z",
     "shell.execute_reply": "2023-04-13T16:59:06.836856Z"
    },
    "papermill": {
     "duration": 0.073071,
     "end_time": "2023-04-13T16:59:06.842094",
     "exception": false,
     "start_time": "2023-04-13T16:59:06.769023",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "8514.90975609756"
      ],
      "text/latex": [
       "8514.90975609756"
      ],
      "text/markdown": [
       "8514.90975609756"
      ],
      "text/plain": [
       "[1] 8514.91"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "2389.29512195122"
      ],
      "text/latex": [
       "2389.29512195122"
      ],
      "text/markdown": [
       "2389.29512195122"
      ],
      "text/plain": [
       "[1] 2389.295"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "419.173170731707"
      ],
      "text/latex": [
       "419.173170731707"
      ],
      "text/markdown": [
       "419.173170731707"
      ],
      "text/plain": [
       "[1] 419.1732"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "458.482926829268"
      ],
      "text/latex": [
       "458.482926829268"
      ],
      "text/markdown": [
       "458.482926829268"
      ],
      "text/plain": [
       "[1] 458.4829"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# get means\n",
    "mean(daily_activity_sleep$total_steps)\n",
    "mean(daily_activity_sleep$calories)\n",
    "mean(daily_activity_sleep$total_minutes_asleep)\n",
    "mean(daily_activity_sleep$total_time_in_bed)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "6859e84a",
   "metadata": {
    "papermill": {
     "duration": 0.021242,
     "end_time": "2023-04-13T16:59:06.884265",
     "exception": false,
     "start_time": "2023-04-13T16:59:06.863023",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Limitation:** \n",
    "\n",
    "It's unknown if the calorie measurement is calories consumed or calories burned so, I'll disregard this data. "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a5fe98ef",
   "metadata": {
    "papermill": {
     "duration": 0.021017,
     "end_time": "2023-04-13T16:59:06.926053",
     "exception": false,
     "start_time": "2023-04-13T16:59:06.905036",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Next I want to start exploring relationships. First, I'll explore the relationship between sleep and total time in bed. Observing this particular data in hours vs. minutes will make more sense so, I'll convert minutes to hours. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 26,
   "id": "ee03fe6c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:06.972570Z",
     "iopub.status.busy": "2023-04-13T16:59:06.970837Z",
     "iopub.status.idle": "2023-04-13T16:59:06.997142Z",
     "shell.execute_reply": "2023-04-13T16:59:06.995206Z"
    },
    "papermill": {
     "duration": 0.052305,
     "end_time": "2023-04-13T16:59:06.999926",
     "exception": false,
     "start_time": "2023-04-13T16:59:06.947621",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "7.64138211382114"
      ],
      "text/latex": [
       "7.64138211382114"
      ],
      "text/markdown": [
       "7.64138211382114"
      ],
      "text/plain": [
       "[1] 7.641382"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "6.98621951219512"
      ],
      "text/latex": [
       "6.98621951219512"
      ],
      "text/markdown": [
       "6.98621951219512"
      ],
      "text/plain": [
       "[1] 6.98622"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# get means and convert from minutes to hours\n",
    "mean(daily_activity_sleep$total_time_in_bed) / 60\n",
    "mean(daily_activity_sleep$total_minutes_asleep) / 60"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "17f5c7ad",
   "metadata": {
    "papermill": {
     "duration": 0.021507,
     "end_time": "2023-04-13T16:59:07.042396",
     "exception": false,
     "start_time": "2023-04-13T16:59:07.020889",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "I want to see how long the users were in bed awake as compared to sleeping so, I'll subtract total_time_in_bed - total_minutes_asleep to get total time awake. I can tell from the above that it's under an hour so, I'll leave this in minutes. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 27,
   "id": "cdb4b51f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:07.090466Z",
     "iopub.status.busy": "2023-04-13T16:59:07.088761Z",
     "iopub.status.idle": "2023-04-13T16:59:07.108122Z",
     "shell.execute_reply": "2023-04-13T16:59:07.105926Z"
    },
    "papermill": {
     "duration": 0.046224,
     "end_time": "2023-04-13T16:59:07.110609",
     "exception": false,
     "start_time": "2023-04-13T16:59:07.064385",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "39.309756097561"
      ],
      "text/latex": [
       "39.309756097561"
      ],
      "text/markdown": [
       "39.309756097561"
      ],
      "text/plain": [
       "[1] 39.30976"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# get total time awake\n",
    "mean(daily_activity_sleep$total_time_in_bed) - mean(daily_activity_sleep$total_minutes_asleep)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a5fe013e",
   "metadata": {
    "papermill": {
     "duration": 0.020904,
     "end_time": "2023-04-13T16:59:07.152537",
     "exception": false,
     "start_time": "2023-04-13T16:59:07.131633",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Findings:** \n",
    "\n",
    "Users spent an average of 7.6 hours in bed. They slept an average of 7 hours and were awake for an average of 39 minutes. My initial thought was - it takes the user an average of 39 minutes to fall asleep BUT it could be a number of factors: reading, sex, etc. This data is inclusive.\n",
    "\n",
    "**However, we do know they're sleeping an average of 7 hours a night which falls within the recommended amount of 7-9 hours.   **"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4f401026",
   "metadata": {
    "papermill": {
     "duration": 0.020965,
     "end_time": "2023-04-13T16:59:07.194837",
     "exception": false,
     "start_time": "2023-04-13T16:59:07.173872",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "I want to see more averages for further understanding of the data. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 28,
   "id": "255e96ae",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:07.240521Z",
     "iopub.status.busy": "2023-04-13T16:59:07.238725Z",
     "iopub.status.idle": "2023-04-13T16:59:07.279428Z",
     "shell.execute_reply": "2023-04-13T16:59:07.277636Z"
    },
    "papermill": {
     "duration": 0.066062,
     "end_time": "2023-04-13T16:59:07.281782",
     "exception": false,
     "start_time": "2023-04-13T16:59:07.215720",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "8514.90975609756"
      ],
      "text/latex": [
       "8514.90975609756"
      ],
      "text/markdown": [
       "8514.90975609756"
      ],
      "text/plain": [
       "[1] 8514.91"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "216.541463414634"
      ],
      "text/latex": [
       "216.541463414634"
      ],
      "text/markdown": [
       "216.541463414634"
      ],
      "text/plain": [
       "[1] 216.5415"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "17.9243902439024"
      ],
      "text/latex": [
       "17.9243902439024"
      ],
      "text/markdown": [
       "17.9243902439024"
      ],
      "text/plain": [
       "[1] 17.92439"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "25.0463414634146"
      ],
      "text/latex": [
       "25.0463414634146"
      ],
      "text/markdown": [
       "25.0463414634146"
      ],
      "text/plain": [
       "[1] 25.04634"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "712.1"
      ],
      "text/latex": [
       "712.1"
      ],
      "text/markdown": [
       "712.1"
      ],
      "text/plain": [
       "[1] 712.1"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# get means\n",
    "mean(daily_activity_sleep$total_steps)\n",
    "mean(daily_activity_sleep$lightly_active_minutes)\n",
    "mean(daily_activity_sleep$fairly_active_minutes)\n",
    "mean(daily_activity_sleep$very_active_minutes)\n",
    "mean(daily_activity_sleep$sedentary_minutes) \n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7755356e",
   "metadata": {
    "papermill": {
     "duration": 0.022312,
     "end_time": "2023-04-13T16:59:07.327539",
     "exception": false,
     "start_time": "2023-04-13T16:59:07.305227",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Based on the above, lightly_active_minutes and sedentary_minutes will make more sense in hours. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 29,
   "id": "ae0729b6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:07.374960Z",
     "iopub.status.busy": "2023-04-13T16:59:07.373363Z",
     "iopub.status.idle": "2023-04-13T16:59:07.397369Z",
     "shell.execute_reply": "2023-04-13T16:59:07.395267Z"
    },
    "papermill": {
     "duration": 0.05043,
     "end_time": "2023-04-13T16:59:07.399761",
     "exception": false,
     "start_time": "2023-04-13T16:59:07.349331",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "3.6090243902439"
      ],
      "text/latex": [
       "3.6090243902439"
      ],
      "text/markdown": [
       "3.6090243902439"
      ],
      "text/plain": [
       "[1] 3.609024"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "11.8683333333333"
      ],
      "text/latex": [
       "11.8683333333333"
      ],
      "text/markdown": [
       "11.8683333333333"
      ],
      "text/plain": [
       "[1] 11.86833"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# get means and convert to hours\n",
    "mean(daily_activity_sleep$lightly_active_minutes) / 60\n",
    "mean(daily_activity_sleep$sedentary_minutes) /60\n"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 30,
   "id": "2ccb6d50",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:07.447816Z",
     "iopub.status.busy": "2023-04-13T16:59:07.446137Z",
     "iopub.status.idle": "2023-04-13T16:59:07.475774Z",
     "shell.execute_reply": "2023-04-13T16:59:07.473834Z"
    },
    "papermill": {
     "duration": 0.056575,
     "end_time": "2023-04-13T16:59:07.478418",
     "exception": false,
     "start_time": "2023-04-13T16:59:07.421843",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "3.79112195185408"
      ],
      "text/latex": [
       "3.79112195185408"
      ],
      "text/markdown": [
       "3.79112195185408"
      ],
      "text/plain": [
       "[1] 3.791122"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0.743902436839189"
      ],
      "text/latex": [
       "0.743902436839189"
      ],
      "text/markdown": [
       "0.743902436839189"
      ],
      "text/plain": [
       "[1] 0.7439024"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "1.44621951025797"
      ],
      "text/latex": [
       "1.44621951025797"
      ],
      "text/markdown": [
       "1.44621951025797"
      ],
      "text/plain": [
       "[1] 1.44622"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# get remaining means (distance)\n",
    "mean(daily_activity_sleep$light_active_distance)\n",
    "mean(daily_activity_sleep$moderately_active_distance)\n",
    "mean(daily_activity_sleep$very_active_distance)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "39994595",
   "metadata": {
    "papermill": {
     "duration": 0.024286,
     "end_time": "2023-04-13T16:59:07.526337",
     "exception": false,
     "start_time": "2023-04-13T16:59:07.502051",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Limitation:**   \n",
    "\n",
    "The measure of distance is unknown. Is it miles, kilometers, some other measure? Due to this limitation, I'll disregard this data. "
   ]
  },
  {
   "cell_type": "markdown",
   "id": "dbfa9906",
   "metadata": {
    "papermill": {
     "duration": 0.024031,
     "end_time": "2023-04-13T16:59:07.574585",
     "exception": false,
     "start_time": "2023-04-13T16:59:07.550554",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Findings for Further Analyis:** \n",
    "\n",
    "The users take an average of 8515 steps a day and sleep an average of 7 hours a night. \n",
    "Their average activity levels are broken down as follows: \n",
    "* sedentary = 11.9 hours\n",
    "* lightly active = 3.6 hours\n",
    "* fairly active = 17.9 minutes\n",
    "* very active = 25 minutes"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2998f029",
   "metadata": {
    "papermill": {
     "duration": 0.023029,
     "end_time": "2023-04-13T16:59:07.621123",
     "exception": false,
     "start_time": "2023-04-13T16:59:07.598094",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "I want to consolidate time the users are active to compare with time the users are sedentary. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 31,
   "id": "ac216a2b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:07.669861Z",
     "iopub.status.busy": "2023-04-13T16:59:07.668131Z",
     "iopub.status.idle": "2023-04-13T16:59:07.686571Z",
     "shell.execute_reply": "2023-04-13T16:59:07.684676Z"
    },
    "papermill": {
     "duration": 0.051534,
     "end_time": "2023-04-13T16:59:07.695164",
     "exception": false,
     "start_time": "2023-04-13T16:59:07.643630",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "4.32520325203252"
      ],
      "text/latex": [
       "4.32520325203252"
      ],
      "text/markdown": [
       "4.32520325203252"
      ],
      "text/plain": [
       "[1] 4.325203"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "(mean(daily_activity_sleep$lightly_active_minutes) + mean(daily_activity_sleep$fairly_active_minutes) + \n",
    " mean(daily_activity_sleep$very_active_minutes)) /60"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "70eedd63",
   "metadata": {
    "papermill": {
     "duration": 0.022582,
     "end_time": "2023-04-13T16:59:07.740072",
     "exception": false,
     "start_time": "2023-04-13T16:59:07.717490",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "Data shows users are active on some level an average of 4.32 hours a day."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "aa09d8d3",
   "metadata": {
    "papermill": {
     "duration": 0.023012,
     "end_time": "2023-04-13T16:59:07.786037",
     "exception": false,
     "start_time": "2023-04-13T16:59:07.763025",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Analyze for Trends:**\n",
    "\n",
    "I'll add a column to include corresponding days of the week in order to look for trends. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 32,
   "id": "38b7940a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:07.835147Z",
     "iopub.status.busy": "2023-04-13T16:59:07.833472Z",
     "iopub.status.idle": "2023-04-13T16:59:07.871685Z",
     "shell.execute_reply": "2023-04-13T16:59:07.869815Z"
    },
    "papermill": {
     "duration": 0.065845,
     "end_time": "2023-04-13T16:59:07.874370",
     "exception": false,
     "start_time": "2023-04-13T16:59:07.808525",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 16</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>id</th><th scope=col>date</th><th scope=col>total_steps</th><th scope=col>total_distance</th><th scope=col>very_active_distance</th><th scope=col>moderately_active_distance</th><th scope=col>light_active_distance</th><th scope=col>very_active_minutes</th><th scope=col>fairly_active_minutes</th><th scope=col>lightly_active_minutes</th><th scope=col>sedentary_minutes</th><th scope=col>calories</th><th scope=col>total_sleep_records</th><th scope=col>total_minutes_asleep</th><th scope=col>total_time_in_bed</th><th scope=col>day_of_week</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;date&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;ord&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>1503960366</td><td>2016-04-12</td><td>13162</td><td>8.50</td><td>1.88</td><td>0.55</td><td>6.06</td><td>25</td><td>13</td><td>328</td><td>728</td><td>1985</td><td>1</td><td>327</td><td>346</td><td>Tue</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1503960366</td><td>2016-04-13</td><td>10735</td><td>6.97</td><td>1.57</td><td>0.69</td><td>4.71</td><td>21</td><td>19</td><td>217</td><td>776</td><td>1797</td><td>2</td><td>384</td><td>407</td><td>Wed</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>1503960366</td><td>2016-04-15</td><td> 9762</td><td>6.28</td><td>2.14</td><td>1.26</td><td>2.83</td><td>29</td><td>34</td><td>209</td><td>726</td><td>1745</td><td>1</td><td>412</td><td>442</td><td>Fri</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>1503960366</td><td>2016-04-16</td><td>12669</td><td>8.16</td><td>2.71</td><td>0.41</td><td>5.04</td><td>36</td><td>10</td><td>221</td><td>773</td><td>1863</td><td>2</td><td>340</td><td>367</td><td>Sat</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>1503960366</td><td>2016-04-17</td><td> 9705</td><td>6.48</td><td>3.19</td><td>0.78</td><td>2.51</td><td>38</td><td>20</td><td>164</td><td>539</td><td>1728</td><td>1</td><td>700</td><td>712</td><td>Sun</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>1503960366</td><td>2016-04-19</td><td>15506</td><td>9.88</td><td>3.53</td><td>1.32</td><td>5.03</td><td>50</td><td>31</td><td>264</td><td>775</td><td>2035</td><td>1</td><td>304</td><td>320</td><td>Tue</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 16\n",
       "\\begin{tabular}{r|llllllllllllllll}\n",
       "  & id & date & total\\_steps & total\\_distance & very\\_active\\_distance & moderately\\_active\\_distance & light\\_active\\_distance & very\\_active\\_minutes & fairly\\_active\\_minutes & lightly\\_active\\_minutes & sedentary\\_minutes & calories & total\\_sleep\\_records & total\\_minutes\\_asleep & total\\_time\\_in\\_bed & day\\_of\\_week\\\\\n",
       "  & <dbl> & <date> & <int> & <dbl> & <dbl> & <dbl> & <dbl> & <int> & <int> & <int> & <int> & <int> & <int> & <int> & <int> & <ord>\\\\\n",
       "\\hline\n",
       "\t1 & 1503960366 & 2016-04-12 & 13162 & 8.50 & 1.88 & 0.55 & 6.06 & 25 & 13 & 328 & 728 & 1985 & 1 & 327 & 346 & Tue\\\\\n",
       "\t2 & 1503960366 & 2016-04-13 & 10735 & 6.97 & 1.57 & 0.69 & 4.71 & 21 & 19 & 217 & 776 & 1797 & 2 & 384 & 407 & Wed\\\\\n",
       "\t3 & 1503960366 & 2016-04-15 &  9762 & 6.28 & 2.14 & 1.26 & 2.83 & 29 & 34 & 209 & 726 & 1745 & 1 & 412 & 442 & Fri\\\\\n",
       "\t4 & 1503960366 & 2016-04-16 & 12669 & 8.16 & 2.71 & 0.41 & 5.04 & 36 & 10 & 221 & 773 & 1863 & 2 & 340 & 367 & Sat\\\\\n",
       "\t5 & 1503960366 & 2016-04-17 &  9705 & 6.48 & 3.19 & 0.78 & 2.51 & 38 & 20 & 164 & 539 & 1728 & 1 & 700 & 712 & Sun\\\\\n",
       "\t6 & 1503960366 & 2016-04-19 & 15506 & 9.88 & 3.53 & 1.32 & 5.03 & 50 & 31 & 264 & 775 & 2035 & 1 & 304 & 320 & Tue\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 16\n",
       "\n",
       "| <!--/--> | id &lt;dbl&gt; | date &lt;date&gt; | total_steps &lt;int&gt; | total_distance &lt;dbl&gt; | very_active_distance &lt;dbl&gt; | moderately_active_distance &lt;dbl&gt; | light_active_distance &lt;dbl&gt; | very_active_minutes &lt;int&gt; | fairly_active_minutes &lt;int&gt; | lightly_active_minutes &lt;int&gt; | sedentary_minutes &lt;int&gt; | calories &lt;int&gt; | total_sleep_records &lt;int&gt; | total_minutes_asleep &lt;int&gt; | total_time_in_bed &lt;int&gt; | day_of_week &lt;ord&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 1503960366 | 2016-04-12 | 13162 | 8.50 | 1.88 | 0.55 | 6.06 | 25 | 13 | 328 | 728 | 1985 | 1 | 327 | 346 | Tue |\n",
       "| 2 | 1503960366 | 2016-04-13 | 10735 | 6.97 | 1.57 | 0.69 | 4.71 | 21 | 19 | 217 | 776 | 1797 | 2 | 384 | 407 | Wed |\n",
       "| 3 | 1503960366 | 2016-04-15 |  9762 | 6.28 | 2.14 | 1.26 | 2.83 | 29 | 34 | 209 | 726 | 1745 | 1 | 412 | 442 | Fri |\n",
       "| 4 | 1503960366 | 2016-04-16 | 12669 | 8.16 | 2.71 | 0.41 | 5.04 | 36 | 10 | 221 | 773 | 1863 | 2 | 340 | 367 | Sat |\n",
       "| 5 | 1503960366 | 2016-04-17 |  9705 | 6.48 | 3.19 | 0.78 | 2.51 | 38 | 20 | 164 | 539 | 1728 | 1 | 700 | 712 | Sun |\n",
       "| 6 | 1503960366 | 2016-04-19 | 15506 | 9.88 | 3.53 | 1.32 | 5.03 | 50 | 31 | 264 | 775 | 2035 | 1 | 304 | 320 | Tue |\n",
       "\n"
      ],
      "text/plain": [
       "  id         date       total_steps total_distance very_active_distance\n",
       "1 1503960366 2016-04-12 13162       8.50           1.88                \n",
       "2 1503960366 2016-04-13 10735       6.97           1.57                \n",
       "3 1503960366 2016-04-15  9762       6.28           2.14                \n",
       "4 1503960366 2016-04-16 12669       8.16           2.71                \n",
       "5 1503960366 2016-04-17  9705       6.48           3.19                \n",
       "6 1503960366 2016-04-19 15506       9.88           3.53                \n",
       "  moderately_active_distance light_active_distance very_active_minutes\n",
       "1 0.55                       6.06                  25                 \n",
       "2 0.69                       4.71                  21                 \n",
       "3 1.26                       2.83                  29                 \n",
       "4 0.41                       5.04                  36                 \n",
       "5 0.78                       2.51                  38                 \n",
       "6 1.32                       5.03                  50                 \n",
       "  fairly_active_minutes lightly_active_minutes sedentary_minutes calories\n",
       "1 13                    328                    728               1985    \n",
       "2 19                    217                    776               1797    \n",
       "3 34                    209                    726               1745    \n",
       "4 10                    221                    773               1863    \n",
       "5 20                    164                    539               1728    \n",
       "6 31                    264                    775               2035    \n",
       "  total_sleep_records total_minutes_asleep total_time_in_bed day_of_week\n",
       "1 1                   327                  346               Tue        \n",
       "2 2                   384                  407               Wed        \n",
       "3 1                   412                  442               Fri        \n",
       "4 2                   340                  367               Sat        \n",
       "5 1                   700                  712               Sun        \n",
       "6 1                   304                  320               Tue        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "daily_activity_sleep$day_of_week <- wday(daily_activity_sleep$date, label=TRUE)\n",
    "head(daily_activity_sleep)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4d7871d7",
   "metadata": {
    "papermill": {
     "duration": 0.024393,
     "end_time": "2023-04-13T16:59:07.922255",
     "exception": false,
     "start_time": "2023-04-13T16:59:07.897862",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Share"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f5377d7f",
   "metadata": {
    "papermill": {
     "duration": 0.022868,
     "end_time": "2023-04-13T16:59:07.968204",
     "exception": false,
     "start_time": "2023-04-13T16:59:07.945336",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Findings:**\n",
    "\n",
    "The users take an average of 8515 steps a day (which is more than the recommended daily amount) and sleep an average of 7 hours a night (which falls within the recommended amount). They're active on some level for an average of 4.3 hours a day and are sedentary 11.9 hours a day. This data indicates the target market to be those that work at a sedentary jobs possibly with commute time but make an effort to stay active. \n",
    "\n",
    "\n",
    "Recommended daily amount of steps (revised from 10,000 to 7000-8000)| Reference: [JAMA Intern Med. 2019;179(8):1105-1112. doi:10.1001/jamainternmed.2019.0899](https://jamanetwork.com/journals/jamainternalmedicine/fullarticle/2734709/)\n",
    "\n",
    "Recommended daily amount of sleep (7-9 hours) | Reference: https://www.nhlbi.nih.gov/health/sleep/how-much-sleep \n"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "aa67c2f4",
   "metadata": {
    "papermill": {
     "duration": 0.022785,
     "end_time": "2023-04-13T16:59:08.013821",
     "exception": false,
     "start_time": "2023-04-13T16:59:07.991036",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Visualizations to help show the relationships between the data.**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 33,
   "id": "641fe4c4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:08.063403Z",
     "iopub.status.busy": "2023-04-13T16:59:08.061748Z",
     "iopub.status.idle": "2023-04-13T16:59:08.709462Z",
     "shell.execute_reply": "2023-04-13T16:59:08.706612Z"
    },
    "papermill": {
     "duration": 0.676118,
     "end_time": "2023-04-13T16:59:08.712667",
     "exception": false,
     "start_time": "2023-04-13T16:59:08.036549",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nVVXV1NRkepbMy8vL899LnUQiUfvtsXTpUgsSQkgmk6lUKp1OW41ahYWFqVSqsrLSgrBCHooF\nAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISw\nAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiE\nsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiEQq0wMA\nmdTq6kszdery2gEydPaSsy/K0JkB1iBX7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh\n7AAAIiHsAAAiIewAACLhnSdY62TqvRZq32ihMCPn9kYLAGsHV+wAACIh7AAAIiHsAAAiIewA\nACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAi4Z0nAL6R2TcmyQkhJxNn98YkEA1X7AAAIiHs\nAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh\n7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAi\nIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAA\nIiHsAAAikWqyM33w/EN/mPzCW+/MLF534wOP+8Vu/duGEEKoeWbSjU88O+2TkuTG/bc96rSj\nN8xPNtlIAAAxaaIrdnNeveP0X97bfuufXHj5RXtsXHr9xWe+VVoVQpjx8IXX3P/ioAOOv/j0\nEQXvPz36zFvTTTMQAEB0muiK3Y0TJq/303EnDe0XQtikz5Uffn7xizNKNulXOOH+t3sNnzBs\ntw1DCL2uCgeNvPq+z4cf3qWwaaYCAIhJU1yxqyh58ZWSir0P7Fl30tPHjju2f9vyhc9+XFa9\n1y5da/fmth08sCjn5amzmmAkAID4NMUVu4pFL4cQOr355Ln3/en9L5Z2Wr/nPiN+vtdmnSuW\nvB5C2KTgmxn6FaT++sbCus3PP//8oYceqtscMmRIz549Q3OVSqVCCIlEorDQFccQQsjKygoh\n5OTkJBKJTM9C8G3ZgAWpr7mthh+nDdT+OM3Ozm7OC1JdXZ3pEQihacKuunxRCOGXNz538Akn\n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\nDz/+4qtu+2BpdRPPAwAQjSYNu3RN2c3nXrOwuqZuz4yHL7zm/hcHHXD8xaePKHj/6dFn3upS\nHgDAqmnSsHvtrtGvtt75m+10xYT73+41/LJhuw3qt+Xg0686ZfHMyfd9vqQpRwIAiEbThd2i\n/z1y2VNLx1x8YN2e8oXPflxWvdcuXWs3c9sOHliU8/LUWU02EgBATFJNc5qaii/Gj/n9nufe\n0rsgWbezYsnrIYRNCr6ZoV9B6q9vLKzb/PLLL5966qm6zW233bZ79+5NMm+LlJ+fn+kRmhcL\nUp/VaMCC1Gc1GrAgDTRmQWpqalZ4DE2gicLuz1dfOG+LU47bskO6en7dzpryJSGEDtnfpF6H\n7GTlosq6zS+++GLixIl1mx07duzbt+8Kz1W+ekZueQoLC5e534I0sHYuiNVowILUZzUasCAN\nLG9B6qusrFzhMTSBpgi7L/91wx1vdb75zp0b7M/KLQghzKus6Zzz1SPCcyqrU22/GSmZTLZu\n3bpuMzs7O5325IrlsjgNWJD6rEYDFqQ+q9GABWmgMQti0ZqJpgi72c+9XlHy+TEHDq3b8+QJ\nh/2tcODvbxwcwtTpSys75+TW7n93aVVxv+K6w/r16zdlypS6zZKSkrlz567wdK1W3+Qty/IW\nx4I0sHYuiNVowILUZzUasCANNOaXbwihQ4cOa3oSVqgpwq7niAsm7P/VFdp0zaJRZ43dfvTl\nB3Vsn9dmnW45N01+YfbOe60bQqhcPO2VkophQzo3wUgAAPFpirDL67R+r05f/bv2b+zarN+j\nR+fCEMKoYX3Pvn3slE7n9G1T/tjECYXddh/edcUP5AMA8F1N9OSJ5el1yGUnl19774Qxc8sS\nPQfuNG7U8YnMDgQA0GI1ddglkm0ff/zx+tu7jxy1+8gmngIAIEJN/V6xAACsIcIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOAGi+7r/wsO7rFHXodUwI4aL1i1t1Ob7uQ9f0\n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\nCWEHABAJYQcAEAlhBwAQCWEHABCJVKYHWAlZWVmpVEsauIlZnAYsSH1WowELUp/VaMCCNNCY\nBUmn000wCSvUkr53c3JyCgoKVnhYRROM0iwVFxcvc78FaWDtXBCr0YAFqc9qNGBBGljegtRX\nWVnZBJOwQi0p7MrKysrLy1d4WKsmGKVZmjt37jL3W5AG1s4FsRoNWJD6rEYDFqSB5S1IAx06\ndFjTk7BC/sYOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBKpTA9Q\n88ykG594dtonJcmN+2971GlHb5ifzPRIAAAtUoav2M14+MJr7n9x0AHHX3z6iIL3nx595q3p\nzA4EANBiZTTs0hUT7n+71/DLhu02qN+Wg0+/6pTFMyff9/mSTI4EANBiZTLsyhc++3FZ9V67\ndK3dzG07eGBRzstTZ2VwJACAliuTf2NXseT1EMImBd/M0K8g9dc3FtZtLl68+K233qrb7Nq1\na6tWrZpywpYlOzs70yM0LxakPqvRgAWpz2o0YEEaaMyCpNP+lqpZyGTY1ZQvCSF0yP7m2RId\nspOViyrrNmfMmHHyySfXbY4bN26vvfZa4c2Wr9YhW5Di4uJl7rcgDaydC2I1GrAg9VmNBixI\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "ggplot(data = daily_activity_sleep) +\n",
    "  geom_bar(mapping = aes(x = day_of_week, fill = 'orange')) +\n",
    "  labs(title = \"Daily Device Usage\", x = \"Day of the Week\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b6f18cf3",
   "metadata": {
    "papermill": {
     "duration": 0.024762,
     "end_time": "2023-04-13T16:59:08.762652",
     "exception": false,
     "start_time": "2023-04-13T16:59:08.737890",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Findings:**\n",
    "\n",
    "Device usage is fairly consistent throughout the week dipping on Mondays and peaking midweek. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 34,
   "id": "937e4b26",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:08.814785Z",
     "iopub.status.busy": "2023-04-13T16:59:08.813026Z",
     "iopub.status.idle": "2023-04-13T16:59:09.099707Z",
     "shell.execute_reply": "2023-04-13T16:59:09.097934Z"
    },
    "papermill": {
     "duration": 0.316298,
     "end_time": "2023-04-13T16:59:09.103272",
     "exception": false,
     "start_time": "2023-04-13T16:59:08.786974",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "ggplot(data = daily_activity_sleep) +\n",
    "  geom_line(mapping = aes(x = day_of_week, y = very_active_minutes)) +\n",
    "  labs(title = \"Very Active Minutes Per Day\", x = \"Day of the Week\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "7c40c784",
   "metadata": {
    "papermill": {
     "duration": 0.027369,
     "end_time": "2023-04-13T16:59:09.161218",
     "exception": false,
     "start_time": "2023-04-13T16:59:09.133849",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Findings:**\n",
    "\n",
    "Users are \"very active\" more on weekends. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 35,
   "id": "80cbf533",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:09.214527Z",
     "iopub.status.busy": "2023-04-13T16:59:09.212810Z",
     "iopub.status.idle": "2023-04-13T16:59:09.495533Z",
     "shell.execute_reply": "2023-04-13T16:59:09.493606Z"
    },
    "papermill": {
     "duration": 0.312595,
     "end_time": "2023-04-13T16:59:09.498145",
     "exception": false,
     "start_time": "2023-04-13T16:59:09.185550",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nkRB2AACRKMj3AJ2jsLAw3yPkKJlMZv7bfW9CHmX2XujOB0Aete69goJI7gdWsUQiEUJIpVIO\nvxxkDr9EImHv5SCVSmUW/PLmIPObG+L95Y3hmEgkEhUVFfmeIkeZe7dUKtV9b0Ietd6p2Xsd\nUVpamk6n8z1F95P55S0qKvLHNQfu+jqiNU3svY7ovnd9LS0tbVwaw/1ROp2eN29evqfIUY8e\nPYqLixsbGxcsWJDvWbqfhoaGzMInn3yS30m6o1QqVVVVFUJYuHBhY2NjvsfpfqqqqlKpVF1d\nXW1tbb5n6X4qKipKSkqamprmz5+f71m6n+Li4h49eoQQ5s2b103TJI8SiUSfPn1CCDU1Na1/\nRLqd6urqFV3kOXYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACR\nEHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAA\nkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYA\nAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHZ51tjY+Pjjjzc0\nNOR7EACg2xN2eXbmmWeOGTPm5JNPzvcgAEC3J+zy7O233w4hzJw5M9+DAADdnrADAIiEsAMA\niERBvgcA8ubmm29euHDh/vvvn+9BAOgcwg7+R82ePfvAAw9Mp9PDhw8fNmxYvscBoBN4KBb+\nRy1atCidTmcW8j0LAJ1D2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBE\nQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEA\nRELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgB\nAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELY\nAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC\n2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBE\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "ggplot(data = daily_activity_sleep) +\n",
    "  geom_line(mapping = aes(x = day_of_week, y = fairly_active_minutes)) +\n",
    "  labs(title = \"Fairly Active Minutes Per Day\", x = \"Day of the Week\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "dcff5e47",
   "metadata": {
    "papermill": {
     "duration": 0.025604,
     "end_time": "2023-04-13T16:59:09.548203",
     "exception": false,
     "start_time": "2023-04-13T16:59:09.522599",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Findings:**\n",
    "\n",
    "Users peak as \"fairly active\" at the beginning of the week and trend down by Friday with some uptick over the weekend. "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 36,
   "id": "43f478f8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-04-13T16:59:09.601152Z",
     "iopub.status.busy": "2023-04-13T16:59:09.599599Z",
     "iopub.status.idle": "2023-04-13T16:59:11.295027Z",
     "shell.execute_reply": "2023-04-13T16:59:11.293229Z"
    },
    "papermill": {
     "duration": 1.726167,
     "end_time": "2023-04-13T16:59:11.298654",
     "exception": false,
     "start_time": "2023-04-13T16:59:09.572487",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`geom_smooth()` using method = 'loess' and formula = 'y ~ x'\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "ggplot(data = daily_activity_sleep) +\n",
    "    geom_point(mapping = aes(x = total_steps, y = total_minutes_asleep, color = \"darkblue\")) +\n",
    "    geom_smooth(mapping = aes(x = total_steps, y = total_minutes_asleep)) +\n",
    "    labs(title = \"Relationship Between Number of Steps and Sleep\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "8c93c9b2",
   "metadata": {
    "papermill": {
     "duration": 0.033303,
     "end_time": "2023-04-13T16:59:11.359548",
     "exception": false,
     "start_time": "2023-04-13T16:59:11.326245",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "There doesn't appear to be a relationship between total steps and total minutes asleep."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9384864f",
   "metadata": {
    "papermill": {
     "duration": 0.039102,
     "end_time": "2023-04-13T16:59:11.434647",
     "exception": false,
     "start_time": "2023-04-13T16:59:11.395545",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Indications:**\n",
    "\n",
    "1. The data indicates the devices are mainly used to track activity levels and sleep. \n",
    "\n",
    "2. The trends indicate users to be consistent with device usage throughout the week."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f65c467e",
   "metadata": {
    "papermill": {
     "duration": 0.026612,
     "end_time": "2023-04-13T16:59:11.489055",
     "exception": false,
     "start_time": "2023-04-13T16:59:11.462443",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Act: Marketing Strategy Recommendations"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "6f028e8d",
   "metadata": {
    "papermill": {
     "duration": 0.027363,
     "end_time": "2023-04-13T16:59:11.544567",
     "exception": false,
     "start_time": "2023-04-13T16:59:11.517204",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Chosen Product: Bellebeat's Leaf: Bellabeat’s Classic Wellness Tracker** \n",
    "\n",
    "Because of it's simplicity and versatility (it can be worn as a bracelet, necklace, or clip), it's probably the easiest to wear throughout the workday and weekend as well as during activity and during sleep. \n",
    "\n",
    "The Leaf tracker connects to the Bellabeat app to track activity, sleep, and stress. As previously mentioned, according to the data analyzed, activity and sleep are what's tracked most consistently throughout the week."
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b58f8cda",
   "metadata": {
    "papermill": {
     "duration": 0.02661,
     "end_time": "2023-04-13T16:59:11.598347",
     "exception": false,
     "start_time": "2023-04-13T16:59:11.571737",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Marketing Strategy:**\n",
    "\n",
    "A/B test the Bellebeat Leaf's aesthetic vs. its functionality. Which KPIs show higher click-through and conversion rates. \n",
    "Is it favored as jewelry first and a wellness tracker second or vice versa. \n",
    "\n",
    "IF:\n",
    "\n",
    "1. Jewelry/Aesthetic has stronger KPIs: expand the line to include additional designs (i.e. flower, butterfly, etc) and maximize influencer relationships to drive promotion and sales. \n",
    "\n",
    "2. Wellness Tracker has stronger KPIs: expand the line to include additional technological features (i.e. notifications and/or targeted marketing messages/blog posts based on how individuals are using their devices. The goal would be to promote adherence in order to keep their subscriptions ongoing.  "
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 133.160334,
   "end_time": "2023-04-13T16:59:11.747845",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-04-13T16:56:58.587511",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
