---
title       : PACE App
subtitle    : Real Statistical Process Control
author      : FC
job         : Data Scientist
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [bootstrap, quiz]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
transition  : rotate
ext_widgets : {rCharts: [libraries/nvd3]}
--- 

## PACE

_What if you were able to predict the number of employees you will need to do a particular job?_

_What if you had the insight to know which business processes were under-performing?_

In the never ending struggle to make better business decisions, the PACE app has been developed for everyone involved in a business setting to observe historical trends and calculate staffing needs based on current performance.

As a manager for Los Angeles County, you will be able to predict staffing needs based on trends and sophisticated algorithms. Even front line staff will be empowered to see their impact on the performance of processes. The openness of this data will bring to light which operations require a "tune-up", or process improvement. The PACE app is __business__ __intelligence__ customized for you.

--- 

## How It Works

The app relies on the following set of R packages:
* data.table
* ggplot2
  
  
It uses a dataset that includes information on individual employee performance. The data is aggregated to show overall trends and patterns, but still uses individual data points to inform the predictive algorithms.

No knowledge of programming or ability to code is necessary in order to use this app. All the data and packages are already loaded onto the app. Datasets are updated on a nightly basis to provide up to date information. 

---

## How It Works

Start by simply clicking the link below.  

http://fulbright.shinyapps.io/pace/
  
Then choose either the Recorder or Elections operation to view data on their specific tasks. The primary Recorder task is "indexing", which is the act of an employee entering information found in property documents into a database. The primary Elections task is "voter registration", which is the act of an employee entering information found on a voter registration form into a database. 

You can then select a date range to explore general data patterns using the widget found on the left sidebar panel. You can also enter the number of expected documents that need processing in the "predict staff" widget to estimate the number of staff needed to complete that many documents. 

---

## Return on Investment

Invest in the right things at the right time. The chart below shows the percentage gained in dollars for the type of business activity investment.


<div id = 'chart1' class = 'rChart nvd3'></div>
<script type='text/javascript'>
 $(document).ready(function(){
      drawchart1()
    });
    function drawchart1(){  
      var opts = {
 "dom": "chart1",
"width":    800,
"height":    400,
"x": "activity",
"y": "roi",
"group": "type",
"type": "multiBarChart",
"id": "chart1" 
},
        data = [
 {
 "activity": "Business Intelligence",
"roi": 400,
"type": "Government" 
},
{
 "activity": "Business Intelligence",
"roi": 360,
"type": "Private" 
},
{
 "activity": "Business Intelligence",
"roi": 385,
"type": "Non-Profit" 
},
{
 "activity": "IT Hardware Upgrades",
"roi": 87,
"type": "Government" 
},
{
 "activity": "IT Hardware Upgrades",
"roi": 67,
"type": "Private" 
},
{
 "activity": "IT Hardware Upgrades",
"roi": 95,
"type": "Non-Profit" 
},
{
 "activity": "IT Software Upgrades",
"roi": 92,
"type": "Government" 
},
{
 "activity": "IT Software Upgrades",
"roi": 87,
"type": "Private" 
},
{
 "activity": "IT Software Upgrades",
"roi": 73,
"type": "Non-Profit" 
},
{
 "activity": "Process Improvement",
"roi": 257,
"type": "Government" 
},
{
 "activity": "Process Improvement",
"roi": 306,
"type": "Private" 
},
{
 "activity": "Process Improvement",
"roi": 215,
"type": "Non-Profit" 
},
{
 "activity": "Strategic Planning",
"roi": 54,
"type": "Government" 
},
{
 "activity": "Strategic Planning",
"roi": 24,
"type": "Private" 
},
{
 "activity": "Strategic Planning",
"roi": 68,
"type": "Non-Profit" 
} 
]
  
      if(!(opts.type==="pieChart" || opts.type==="sparklinePlus" || opts.type==="bulletChart")) {
        var data = d3.nest()
          .key(function(d){
            //return opts.group === undefined ? 'main' : d[opts.group]
            //instead of main would think a better default is opts.x
            return opts.group === undefined ? opts.y : d[opts.group];
          })
          .entries(data);
      }
      
      if (opts.disabled != undefined){
        data.map(function(d, i){
          d.disabled = opts.disabled[i]
        })
      }
      
      nv.addGraph(function() {
        var chart = nv.models[opts.type]()
          .width(opts.width)
          .height(opts.height)
          
        if (opts.type != "bulletChart"){
          chart
            .x(function(d) { return d[opts.x] })
            .y(function(d) { return d[opts.y] })
        }
          
         
        
          
        

        
        
        
      
       d3.select("#" + opts.id)
        .append('svg')
        .datum(data)
        .transition().duration(500)
        .call(chart);

       nv.utils.windowResize(chart.update);
       return chart;
      });
    };
</script>


--- &radio
  
## Hard Choices

What will you choose to do with the volumes of data at your disposal?

1. Dispose of it

2. Flip through it every once in a while

3. Have somebody else analyze it and trust their interpretations 

4. _Use it as a guide to do the right things_

*** .hint 
Hint: It's not useful if it just sits there.

*** .explanation 
Answer: The best answer is to use it as a guide toward doing the right things. The PACE app will allow you to manipulate data and answer questions you never thought would be this easy to answer.


