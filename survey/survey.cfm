<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="favicon.ico" rel="icon">

    <title>W&M Senior Survey 2015 | Employment Information</title>

    <!-- CSS -->
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <!-- <link href="css/bootstrap-theme.css" rel="stylesheet"> -->
    
    <!-- Selectize CSS
        * required for comboboxes -->
    <link rel="stylesheet" type="text/css" href="css/selectize.css" />
    
    <!-- Bootstrap theme
        * theme.css contains CSS specific to the page -->
    <link href="css/theme.css" rel="stylesheet"><!-- /css -->

    <!-- JavaScript -->
    <!-- JQuery Library -->        
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>

    <!-- Selectize
        * enables combobox functionality -->
    <script src="js/standalone/selectize.min.js"></script>

    <!-- Initializes page with hidden divs. -->
    <script language="JavaScript" type="text/javascript">
    $(document).ready(function(){
        $("#offer2").hide();
        $("#offer3").hide();
        $("#offer4").hide();
        $("#offer5").hide();
        $("#school2").hide();
        $("#school3").hide();
        $("#school4").hide();

        $("#btn1").click(function(){
            $("#offer2").show();
            $("#btn1").hide();
        }); 

        $("#btn2").click(function(){
            $("#offer3").show();
            $("#btn2").hide();
        }); 

        $("#btn3").click(function(){
            $("#offer4").show();
            $("#btn3").hide();
        }); 

        $("#btn4").click(function(){
            $("#offer5").show();
            $("#btn4").hide();
        }); 
        
        $("#sbtn1").click(function(){
            $("#school2").show();
            $("#sbtn1").hide();
        }); 

        $("#sbtn2").click(function(){
            $("#school3").show();
            $("#sbtn2").hide();
        }); 

        $("#sbtn3").click(function(){
            $("#school4").show();
            $("#sbtn3").hide();
        }); 

        $("[name=status]").click(function(){
            $(".toggleChkbox").show();
            <!-- EDIT starting here: -->

            $(".salaryAnnual").hide();
            $(".salaryWage").hide();
            $(".corporate").hide();

            // Default state of fieldsets
            // if you add anything that you want to initially hide copy/paste this: 
            // $("#class_id_here").hide(); 
            $("#employed").hide();
            $("#wage").hide();
            $("#corporate").hide();
            $("#gradschool").hide();
            $("#seekinginfo").hide();
            $("#companyMission").hide();
            $("#salaryAnnual").hide();
            $("#salaryPartTime").hide();
            $(".salaryblock").hide();
            $("#salaryPartTime1").hide();
            $("#seekinggradinfo").hide();
            $("#military").hide();
            $("#influence").hide();
            // if you have a label that you want to change the text for copy/paste this: 
            // $("label[for=YOUR_ID_HERE]").hide();
            // Note: this changes ALL the html between the two label tags
            $("label[for=applications]").html("I was accepted to or wait-listed for a graduate school");
            $("label[for=offers]").html("I have received job offers");
            $("#employment legend").html("Employment/Year of Service/Post-graduate Internship info");
            $("label[for=workdate]").html("Approximate date you accepted this position");

            // Change state depending on what was selected
            // don't change the if/else statements
            // If you change a radio button's value (example: value="Employed" to value="Full-Time Job") you have to change it here in the if statement also
            if(this.value == "Employed Full Time"){
                $("#employed").show();
                $(".salaryAnnual").show();
                $(".corporate").show();
                $("#salaryAnnual").show();
                $("#employedspecific").show();
                $("#employedspecific2").show();
                $("#employedspecific3").show();
                $("#employedspecific4").show();
                $("#employedspecific5").show();
                $("#employedspecific6").show();
                $("label[for=offers]").html("I have received other job offers");
                $("#influence").show();
            }
            else if(this.value == "Employed Part Time"){
                $("#employed").show();
                $(".salaryWage").show();
                $(".salaryblock").show();
                $("#salaryPartTime").show();
                $("#salaryPartTime1").show();
                $("#employedspecific").show();
                $("#employedspecific2").show();
                $("#employedspecific3").show();
                $("#employedspecific4").show();
                $("#employedspecific5").show();
                $("#employedspecific6").show();
                $("label[for=offers]").html("I have received other job offers");
                $("#influence").show();
            }
            else if(this.value == "Volunteer Service"){
                $("#employed").show();
                $("#salaryPartTime").show();
                $("#salaryFreq").show();
                $("#employedspecific").show();
                $("#employedspecific2").show();
                $("#employedspecific3").show();
                $("#employedspecific4").show();
                $("#employedspecific5").show();
                $("#employedspecific6").show();
                $("label[for=offers]").html("I have received other job offers");
                $("#influence").show();
            }
            else if(this.value == "Military Service"){
                $("#military").show();
                $("#influence").show();
            }
            else if(this.value == "Continuing Education"){
                $("#gradschool").show();
                $("#seekinggradinfo").hide();
                $("label[for=applications]").html("I was accepted to/wait-listed for another graduate school");
                $("#influence").show();
            }
            else if(this.value == "Starting own business"){
                $("#employed").show();
                $("#companyMission").show();
                $("#employment legend").html("Tell us about your company");
                $("label[for=workdate]").html("Approximate date you started this company");
                $("#influence").show();
            }
            else if(this.value == "Seeking Employment"){
                $("#seekinginfo").show();
                $("#influence").show();
            }
            else if(this.value == "Seeking Continuing Education"){
                $("#seekinggradinfo").show();
                $("#influence").show();
            }
            else if(this.value == "Other") {
                $("#influence").show();
            }
            else{
            }
            <!-- DONT EDIT starting here -->
            $("[name=submit]").show();
        });
        $("[name=status]:checked").click();

        });
    </script>      
</head>

<!-- Body -->
<body role="document">

	<!-- CF Queries -->
    <!-- Student ID -->
    <cfquery datasource="career" name="student">
    	Select * from SrSurvey2015 where studentid = '#form.studentid#'
    </cfquery>
    
    <!-- State Dropdown -->
    <cfquery datasource="career" name="states">
    	Select States from StatesTable order by thisid
    </cfquery><!-- /states -->
    
    <!-- Functional Areas -->
    <cfquery datasource="career" name="functionalq">
    	Select LTRIM(RTRIM(Functional)) as Functional from FunctionalAreas order by Functional
    </cfquery>
    
    <cfquery datasource="career" name="functionalq_bschool">
    	Select LTRIM(RTRIM(Functional)) as Functional from BSchoolFunctional order by Functional
    </cfquery><!-- /functional -->
    
    <!-- Industry -->
    <cfquery datasource="career" name="industries_bschool">
    	Select LTRIM(RTRIM(Industry)) as Industry from  BSchoolIndustries order by Industry
    </cfquery>
    
    <cfquery datasource="career" name="industries">
    	Select LTRIM(RTRIM(Industry)) as Industry from Industries order by Industry
    </cfquery><!-- /industry -->
    
    <!-- Employers -->
    <cfquery datasource="career" name="employers">
    	Select EmployerName from TopEmployers order by EmployerName
    </cfquery><!-- /employers -->
    
    <!-- Grad Schools -->
    <cfquery datasource="career" name="gradschools">
    	Select GradSchoolName from TopGradSchools order by keyid
    </cfquery><!-- /grad schools -->
    
    <!-- Degrees -->
    <cfquery datasource="career" name="degrees">
    	Select GradDegree from TopDegrees order by sortid
    </cfquery><!-- /degrees --><!-- /cf queries -->

	<!-- Inner Container
		* .container enters main content
		* specifies flexible layout -->
	<div id="inner" class="container" role="main">

		<!-- Banner
			* Displays the W&M logo. -->
		<div id="banner" class="col-md-12">
            <img src="images/wm.png" class="img-responsive center-block">
        </div><!-- /banner -->

        <!-- Row
        	* .row denotes a section of the grid to space columns -->
        <div class="row">

        	<!-- Column
        		* col-md-* denotes a column of * size.
        		* col-md-12 is the max size of a column and spans grid's 
        		  entire width. -->
        	<div class="col-md-12">

        		<h1>Class of 2015 Survey</h1>

        		<!-- Progress Bar
        			* emphasizes where the student is in the survey
        			* wrap progress bar sections in .progress div
        			* to add moving stripes for active page, add .active
        			* to get rid of stripes, change .progress-bar-striped to .progress-bar
        			* to change color of section, change .progress-bar-*
        				- .progress-bar-success is green
        				- .progress-bar-warning is yellow
        				- .progress-bar-info is blue
        				- .progress-bar-danger is red -->
        		<div class="progress">
                    <div class="progress-bar progress-bar-success progress-bar-striped" style="width: 25%">
                        Login
                    </div>
                    
                    <div class="progress-bar progress-bar-success progress-bar-striped active" style="width: 25%">
                        Employment & Grad School
                    </div>
                    
                    <div class="progress-bar progress-bar-warning progress-bar-striped" style="width: 25%">
                        Intern/Extern/Research
                    </div>
                    
                    <div class="progress-bar progress-bar-warning progress-bar-striped" style="width: 25%">
                        Final Thoughts
                    </div> 
                </div><!-- /progress bar -->
        	</div><!-- col-md-12 -->
        </div><!-- /row -->

        <!-- Student Query -->
        <cfoutput query="student">
        <cfif #degreestatistics# IS '' OR #degreestatistics# IS 'BBA'>
            
         	<cfform method="post" action="pg3.cfm" id="pg2Form" onsubmit="return validForm('pg2Form')">

        <!-- Post-Graduation Plans -->
        <div class="row">
        	<div class="col-md-12" id="plans">
        		<h2 class="question">What are your plans for after graduation?</h2>
        	</div>
        </div>

        <div class="row">
        	<div class="col-md-6" id="post-grad">

                 <!-- Employed Full Time
                    * Wrap form controls in .label to allow clicking on text to select radio button
                    * make sure input id matches the id in the JavaScript in <head>  -->
                <div class="form-group">
                    <label>
                        <input type="radio" class="fulltime" name="status" value="Employed Full Time" id="fulltime" <cfif #status# IS "Employed Full Time">checked</cfif> />
                            Employed Full-time
                    </label>
                </div><!-- /form-group -->

                <!-- Employed Part Time -->
                <div class="form-group">
                    <label>
                        <input type="radio" class="parttime" name="status" value="Employed Part Time" 
                        id="parttime" <cfif #status# IS "Employed Part Time">checked</cfif> />
                            Employed Part-time
                    </label>
                </div><!-- /form-group -->

                <!-- Full Time Volunteer -->
                <div class="form-group">
                    <label>
                        <input type="radio" class="volunteer" name="status" value="Volunteer Service" 
                        id="volunteer" <cfif #status# IS "Volunteer Service">checked</cfif> />
                            Full-time Volunteer
                    </label>
                </div><!-- /form-group -->

                <!-- Military Service -->
                <div class="form-group">
                    <label>
                        <input type="radio" class="military" name="status" value="Military Service" 
                        id="militaryservice" <cfif #status# IS "Military Service">checked</cfif> />
                            Military Service
                    </label>
                </div><!-- /form-group -->
        	</div><!-- /col-md-6 -->

        	<div class="col-md-6">
                <!-- Continuing Education -->
                <div class="form-group">
                    <label>
                        <input type="radio" class="education" name="status" value="Continuing Education" 
                        id="education" <cfif #status# IS "Continuing Education">checked</cfif> />
                            Continuing Education
                    </label>
                </div><!-- /form-group -->

                <!-- Seeking Continued Education -->
                <div class="form-group">
                    <label>
                        <input type="radio" class="seekingeducation" name="status" value="Seeking Continuing Education" 
                        id="seekingeducation" <cfif #status# IS "Seeking Continuing Education">checked</cfif> />
                            Seeking Continued Education
                    </label>
                </div><!-- /form-group -->

                <!-- Seeking Employment -->
                <div class="form-group">
                    <label>
                        <input type="radio" class="seekingemployment" name="status" value="Seeking Employment" 
                        id="seekingemployment" <cfif #status# IS "Seeking Employment">checked</cfif> />
                            Seeking Employment
                    </label>
                </div><!-- /form-group -->

                <!-- None of the Above -->
                <div class="form-group">
                    <label>
                        <input type="radio" name="status" value="Other" 
                        id="noneabove" <cfif #status# IS "Other">checked</cfif> />
                            None of the Above
                    </label>
                </div><!-- /form-group -->
        	</div><!-- /col-md-6 -->
        </div><!-- /row -->


        <div id="employed">

            <!-- Job Category: Question -->
        	<div class="row">
	        	<div class="col-md-12">
	        		<h2 class="legend">Employed or Volunteer</h2>

                    <hr>

                    <h2 class="question">Does your job fall into one of the following categories?</h2>
	        	</div> <!-- /col-md-12 -->
        	</div> <!-- /row -->

            <!-- Job Category: Options 1-3 -->
            <div class="row">
                <div class="col-md-6">

                    <!-- Entrepeuneur -->
                    <div class="form-group">
                        <label>
                            <input type="radio" name="statisticswork" value="Entrepeuneur" id="entrepeuneur" class="fulltime" <cfif #statisticswork# IS "Entrepeuneur">checked</cfif> />
                            Entrepeuneur
                        </label>
                    </div>

                    <!-- Temporary or Contract Work -->
                    <div class="form-group">
                        <label>
                            <input type="radio" name="statisticswork" value="Temp/Contract Work" id="temporary" class="fulltime" <cfif #statisticswork# IS "Temp/Contract Work">checked</cfif> />
                            Temporary or contract work assignment
                        </label>
                    </div>

                    <!-- Freelance -->
                    <div class="form-group">
                        <label>
                            <input type="radio" name="statisticswork" value="Freelance" id="freelance" class="fulltime" <cfif #statisticswork# IS "Freelance">checked</cfif> />
                            Freelance
                        </label>
                    </div>
                </div> <!-- /col-md-6 -->

                <!-- Job Category: Options 4-6-->
                <div class="col-md-6">
                    <!-- Postgraduate Internship or Fellowship -->
                    <div class="form-group">
                        <label>
                            <input type="radio" name="statisticswork" value="Postgraduate internship or fellowship" class="fulltime" id="internship" <cfif #statisticswork# IS "Postgraduate internship or fellowship">checked</cfif> />
                            Postgraduate Internship or Fellowship
                        </label>
                    </div>

                    <!-- Standard Job -->
                    <div class="form-group">
                        <label>
                            <input type="radio" name="statisticswork" value="Standard" id="standard" class="fulltime" <cfif #statisticswork# IS "Standard">checked</cfif> />
                            Standard Job
                        </label>
                    </div>

                    <!-- Other -->
                    <div class="form-group">
                        <label>
                            <label>
                            <input type="radio" name="statisticswork" value="Other" id="other" class="fulltime" <cfif #statisticswork# IS "Other">checked</cfif> />
                            Other
                        </label>
                    </div>
                </div> <!-- /col-md-6 -->
            </div> <!-- /row -->

            <!-- Organization: Question -->
            <div class="row">
                <div class="col-md-12">
                    <h2 class="question">Organization</h2>
                </div> <!-- col-md-12 -->
            </div> <!-- /row -->

            <!-- Organization: Combobox -->
            <div class="row">
                <div class="col-md-6">
                    <cfselect query="employers" id="select-organization" class="demo-default" 
                    name="employer" value="employername" 
                    selected="#employer#" placeholder="Select an organization...">
                    </cfselect>

                    <!-- Insert employerid -->
                    <cfif #employer# IS NOT ''>
                        <cfquery name="getEmployerID" datasource="career">
                            SELECT EmployerID FROM TopEmployers WHERE (EmployerName = '#employer#')
                        </cfquery>
                       
                        <cfif ISDEFINED('getEmployerID.EmployerName')>
                            <input name="EmployerID" type="text" id="EmployerID" value="#getEmployerID.EmployerID#"/>
                        </cfif>
                    </cfif><!-- /insert employerid -->
                </div> <!-- col-md-6 -->
            </div> <!-- /row -->

            <!-- State or Region: Question -->
            <div class="row">
                <div class="col-md-12">
                    <h2 class="question">State or International Region</h2>
                </div> <!-- col-md-12 -->
            </div> <!-- /row -->

            <!-- State or Region: Combobox -->
            <div class="row">
                <div class="col-md-6">
                    <cfselect query="states" id="select-state" class="demo-default" 
                    name="employer" value="states" 
                    selected="#busstate#" placeholder="Select a state...">
                    </cfselect>
                </div> <!-- col-md-6 -->

                <div class="col-md-6">
                    <cfselect id="select-region" class="demo-default" 
                    name="worldregion" 
                    selected="#worldregion#" placeholder="Select a world region...">
                        <option value="">Select a world region...</option>
                            <option value="Canada" <cfif #worldregion# IS "Canada">selected</cfif>>Canada</option>
                            <option value="CentralAmerica" <cfif #worldregion# IS "CentralAmerica">selected</cfif>>Central America and Mexico</option>
                            <option value="SouthAmerica" <cfif #worldregion# IS "SouthAmerica">selected</cfif>>South America</option>
                            <option value="Europe" <cfif #worldregion# IS "Europe">selected</cfif>>Europe</option>
                            <option value="MiddleEast" <cfif #worldregion# IS "MiddleEast">selected</cfif>>Middle East</option>
                            <option value="Africa" <cfif #worldregion# IS "Africa">selected</cfif>>Africa</option>
                            <option value="Asia" <cfif #worldregion# IS "Asia">selected</cfif>>Asia</option>
                            <option value="Australia" <cfif #worldregion# IS "Australia">selected</cfif>>Australia</option>
                    </cfselect>
                </div> <!-- col-md-6 -->
            </div> <!-- /row -->

            <!-- City: Question -->
            <div class="row">
                <div class="col-md-12">
                    <h2 class="question">City</h2>
                </div> <!-- /col-md-12 -->
            </div> <!-- /row -->

            <!-- City: Answer -->
            <div class="row">
                <div class="col-md-6">
                    <input name="buscity" id="buscity" type="text" value="#buscity#" class="required form-control" />
                </div> <!-- /col-md-6 -->
            </div> <!-- /row -->

            <!-- Position Title: Question -->
            <div class="row">
                <div class="col-md-12">
                    <h2 class="question">Position Title</h2>
                </div> <!-- /col-md-12 -->
            </div> <!-- /row -->

            <!-- Position Title: Answer -->
            <div class="row">
                <div class="col-md-6">
                    <cfinput name="title" type="text" id="title" value="#title#" size="40" class="required form-control" />
                </div> <!-- /col-md-6 -->
            </div> <!-- /row -->

            <!-- Industry: Question -->
            <div class="row">
                <div class="col-md-12">
                    <h2 class="question">Industry</h2>
                </div> <!-- /col-md-12 -->
            </div> <!-- /row -->

            <!-- Industry: Answer -->
            <div class="row">
                <div class="col-md-6">
                    <cfselect query="industries" name="industry" id="select-industry" value="Industry" selected="#industry#" class="required demo-default" placeholder="Select an industry..."> </cfselect>
                </div> <!-- /col-md-6 -->
            </div> <!-- /row -->

            <!-- Functional Area: Question -->
            <div class="row">
                <div class="col-md-12">
                    <h2 class="question">Functional Area</h2>
                </div> <!-- /col-md-12 -->
            </div> <!-- /row -->

            <!-- Functional Area: Answer -->
            <div class="row">
                <div class="col-md-6">
                    <cfselect query="functionalq" name="functional" id="select-functional" value="functional" selected="#functional#" class="required demo-default" placeholder="Select a functional area..."></cfselect>
                </div> <!-- /col-md-6 -->
            </div> <!-- /row -->

            <!-- Annual Salary: Question -->
            <div class="row salaryAnnual">
                <div class="col-md-12">
                    <h2 class="question">Annual Salary</h2>
                </div> <!-- /col-md-12 -->
            </div> <!-- /row -->

            <!-- Annual Salary: Answer -->
            <div class="row salaryAnnual">
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon">$</span>
                            <cfinput name="salary" id="salary" type="text" class="form-control" value="#salary#" preservedata=true/>
                        <span class="input-group-addon">.00</span>
                    </div><!-- /input group -->
                </div> <!-- /col-md-3 -->
            </div> <!-- /row -->

            <!-- Wage or Stipend: Question -->
            <div class="row salaryWage">
                <div class="col-md-12">
                    <h2 class="question">Wage or Stipend</h2>
                </div> <!-- /col-md-12 -->
            </div>

            <!-- Wage or Stipend: Answer -->
            <div class="row salaryWage">
                <div class="col-md-3">
                    <div class="input-group">
                        <span class="input-group-addon">$</span>
                            <cfinput name="salary" id="salary" type="text" class="form-control" value="#salary#" preservedata=true/>
                    </div><!-- /input group -->
                </div> <!-- /col-md-3 -->

                <div class="col-md-1">
                    <span class="star">*</span>per</span>
                </div>
                
                <div class="col-md-2">
                    
                        <cfselect name="permoyr" id="permoyr" selected="#permoyr#" class="required form-control">
                            <option value="">Select one...</option>
                            <option value="hour" <cfif #permoyr# IS "hour">selected</cfif>>hour</option>
                            <option value="week" <cfif #permoyr# IS "week">selected</cfif>>week</option>
                            <option value="month" <cfif #permoyr# IS "month">selected</cfif>>month</option>
                        </cfselect>
                </div>
            </div> <!-- /row -->

            <!-- Monetary Bonus: Question -->
            <div class="row">
                <div class="col-md-12">
                    <h2 class="question">What is your guaranteed monetary bonus?</h2>
                </div> <!-- /col-md-12 -->
            </div> <!-- /row -->

            <!-- Monetary Bonus: Answer -->
            <div class="row">
                <div class="col-md-3">
                        <div class="input-group">
                            <span class="input-group-addon">$</span>
                            <input name="bonus" type="text" id="bonus" value="#bonus#" class="form-control"/>
                                
                            <span class="input-group-addon">.00</span>
                    </div> <!-- /input-group -->
                </div> <!-- /col-md-3 -->
            </div> <!-- /row -->

            <!-- Other Compensation: Question -->
            <div class="row">
                <div class="col-md-12">
                    <h2 class="question">What other compensation or contingent monetary bonus do you receive?</h2>
                </div> <!-- /col-md-12 -->
            </div> <!-- /row -->

            <!-- Other Compensation: Answer -->
            <div class="row">
                <div class="col-md-6">
                    <input name="bonusother" type="text" id="bonusother" tabindex="8" value="#bonusother#" class="form-control" />
                </div> <!-- /col-md-6 -->
            </div> <!-- /row -->

            <!-- Career Alignment: Question -->
            <div class="row">
                <div class="col-md-12">
                    <h2 class="question">How closely aligned with your career interests is this job?</h2>
                </div> <!-- /col-md-12 -->
            </div> <!-- /row -->

            <!-- Career Alignment: Choices 1 -->
            <div class="row">
                <div class="col-md-6">

                    <!-- Very well -->
                    <div class="form-group">
                        <label>
                            <input type="radio" name="careeralignment" value="Very well" id="careeralignment verywell" <cfif trim(#careeralignment#) IS "Very well">checked</cfif> />
                            Very well
                        </label>
                    </div><!-- /form-group -->

                    <!-- Somewhat Well -->
                    <div class="form-group">
                        <label>
                            <input type="radio" name="careeralignment" value="Somewhat well" id="careeralignment somewhatwell" 
                            <cfif trim(#careeralignment#) IS "Somewhat well">checked</cfif> />
                            Somewhat well
                        </label>
                    </div><!-- /form-group -->

                    <!-- Not very well -->
                    <div class="form-group">
                        <label>
                            <input type="radio" name="careeralignment" value="Not very well" id="careeralignment notvery" <cfif trim(#careeralignment#) IS "Not very well">
                            checked</cfif> />
                            Not very well
                        </label>
                    </div><!-- /form-group -->
                </div> <!-- /col-md-6 -->

                <!-- Career Alignment: Choices 2 -->
                <div class="col-md-6">

                    <!-- Not At All -->
                    <div class="form-group">
                        <label>
                            <input type="radio" name="careeralignment" value="Not at all" id="careeralignment notall" <cfif trim(#careeralignment#) IS "Not at all">checked</cfif> />
                            Not at all
                        </label>
                    </div><!-- /form-group -->

                    <!-- I Don't Know -->
                    <div class="form-group">
                        <label>
                            <input type="radio" name="careeralignment" value="I don't know my career interests" id="careeralignment dontknow"
                            <cfif trim(#careeralignment#) IS "I don't know my career interests">checked</cfif> />
                            I don't know my career interests
                        </label>
                    </div><!-- /form-group -->
                </div> <!-- /col-md-6 -->
            </div> <!-- /row -->

            <!-- Approximate Date: Question -->
            <div class="row">
                <div class="col-md-12">
                    <h2 class="question">What is the approximate date you accepted this position?</h2>
                </div> <!-- /col-md-12 -->
            </div> <!-- /row -->

            <!-- Approximate Date: Answer -->
            <div class="row">
                <div class="col-md-6">
                    <cfselect name="workdate" id="workdate" selected="#workdate#" class="required form-control" placeholder="Select a date...">
                        <option value="">Select a date...</option>
                        <option value="Before" <cfif #workdate# IS "before">selected</cfif>>Before graduation </option>
                        <option value="within3" <cfif #workdate# IS "within3">selected</cfif>>After graduation, but within 3 months </option>
                        <option value="after3" <cfif #workdate# IS "after3">selected</cfif>>3 months or more after graduating</option>
                    </cfselect>
                </div> <!-- /col-md-6 -->
            </div> <!-- /row -->

            <cfif degreestatistics IS 'BBA'>
                <!-- Corporate Sector: Question -->
                <div class="row corporate">
                    <div class="col-md-12">
                        <h2 class="question">Is this full-time professional work in the corporate sector?</h2>
                    </div> <!-- /col-md-12 -->
                </div> <!-- /row -->

                <!-- Corporate Sector: Answer -->
                <div class="row corporate">
                    <!-- Yes -->
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>
                                <input type="radio" name="otherstatus" value="WorkBusiness" id="bus" <cfif #otherstatus# IS "WorkBusiness">checked</cfif> />
                                Yes
                            </label>
                        </div><!-- /form-group -->
                    </div> <!-- /col-md-3 -->

                    <!-- No -->
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>
                                <input type="radio" name="otherstatus" value="WorkNonBusiness" id="nonbus" <cfif #otherstatus# IS "WorkNonBusiness">checked</cfif> />
                                No
                            </label>
                        </div><!-- /form-group -->
                    </div> <!-- /col-md-3 -->
                </div> <!-- /row -->
            </cfif>
        </div> <!-- fulltime employment -->

        <!-- Military Service -->
        <div id="military">

            <!-- Service Branch: Question -->
            <div class="row">
                <div class="col-md-12">
                    <h2 class="question">Military Service</h2>

                    <hr> 

                    <h2 class="question">Which branch of service are you in?</h2>
                </div>
            </div> <!-- /row -->

            <!-- Service Branch: Options -->
            <div class="row">
                <div class="col-md-6">
                    <cfselect name="employer" selected="#employer#" class="demo-default" id="select-branch" placeholder="Select a branch...">
                        <option value="">Select a branch...</option>
                        <option value="Army" <cfif #employer# IS "Army">selected</cfif>>Army</option>
                        <option value="Marine Corps" <cfif #employer# IS "Marine Corps">selected</cfif>>Marine Corps</option>
                        <option value="Navy" <cfif #employer# IS "Navy">selected</cfif>>Navy</option>
                        <option value="Air Force" <cfif #employer# IS "Air Force">selected</cfif>>Air Force</option>
                        <option value="Coast Guard" <cfif #employer# IS "Coast Guard">selected</cfif>>Coast Guard</option>
                    </cfselect>
                </div>
            </div> <!-- /row -->

            <!-- Rank: Question -->
            <div class="row">
                <div class="col-md-12">
                    <h2 class="question">What is your rank?</h2>
                </div>
            </div> <!-- /row -->

            <!-- Rank: Options -->
            <div class="row">
                <div class="col-md-6">
                    <cfinput name="title" type="text" id="title" value="#title#" class="required form-control" placeholder="Private"/>
                </div>
            </div> <!-- /row -->

            <!-- Duties: Question -->
            <div class="row">
                <div class="col-md-12">
                    <h2 class="question">How would your duties be best characterized?</h2>
                </div>
            </div> <!-- /row -->

            <!-- Duties: Options -->
            <div class="row">
                <div class="col-md-6">
                    <cfselect query="functionalq" name="functional" id="select-duties" value="functional" selected="#functional#" class="required demo-default" placeholder="Select a functional area..."></cfselect>
                </div>
            </div> <!-- /row -->

            <!-- Compensation: Question -->
            <div class="row">
                <div class="col-md-12">
                    <h2 class="question">What is your total annual compensation?</h2>
                    <span class="hint">Including housing allowance and other allowances.</span>
                </div>
            </div> <!-- /row -->

            <!-- Compensation: Options -->
            <div class="row">
                <div class="col-md-6">
                    <cfinput name="bonusother" id="bonusother" class="form-control" type="text" value="#bonusother#" preservedata=true/>
                </div>
            </div> <!-- /row -->
        </div> <!-- /military -->

        <!-- Continuing Education -->
        <div id="gradschool">

            <!-- University: Question -->
            <div class="row">
                <div class="col-md-12">
                    <h2 class="legend">Continuing Education</h2>

                    <hr>

                    <h2 class="question">What university are you attending?</h2>
                </div>
            </div> <!-- /row -->

            <!-- University: Options -->
            <div class="row">
                <div class="col-md-6">
                    <cfselect query="gradschools" name="schattnd" id="select-school" value="GradSchoolName" selected="#schattnd#" class="demo-default" placeholder="Select a school..."></cfselect>
                </div>
            </div> <!-- /row -->

            <!-- Department: Question -->
            <div class="row">
                <div class="col-md-6">
                    <h2 class="question">What department are you in?</h2>
                </div>
            </div> <!-- /row -->

            <!-- Department: Options -->
            <div class="row">
                <div class="col-md-6">
                    <input name="GRADDEPART" type="text" value="#GRADDEPART#" maxlength="40" class="form-control" placeholder="e.g. Chemistry, Game Design, Acoustic Engineering"/>
                </div>
            </div> <!-- /row -->

            <cfquery datasource="career" name="finddegree">
                Select GradDegree from TopDegrees order by GradDegree ASC
            </cfquery>

            <!-- Degree: Question -->
            <div class="row">
                <div class="col-md-6">
                    <h2 class="question">What degree are you pursuing?</h2>
                </div>
            </div> <!-- /row -->

            <!-- Degree: Options -->
            <div class="row">
                <div class="col-md-6">
                    <cfselect query="finddegree" name="GRADDEGREE" id="select-degree" value="GradDegree" selected="#GRADDEGREE#" class="demo-default" placeholder="Select a degree..."></cfselect>
                </div>
            </div> <!-- /row -->
        </div> <!-- /continuing education -->

        <!-- Seeking Work -->
        <div id="seekinginfo">

            <div class="row">
                <div class="col-md-12">
                    <h2 class="question">Seeking Employment</h2>

                    <hr>
                </div>
            </div>

            <cfif #degreestatistics# IS 'BBA'>
                <!-- Corporate Sector: Question -->
                <div class="row">
                    <div class="col-md-12">
                        <h2 class="question">Are you seeking full-time professional work in the corporate sector?</h2>
                    </div>
                </div> <!-- /row -->

                <!-- Corporate Sector: Options -->
                <div class="row">

                    <!-- Yes -->
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>
                                <input type="radio" name="otherstatus" value="LookBusiness" id="bus" <cfif #otherstatus# IS "LookBusiness">checked</cfif> />
                                Yes
                            </label>
                        </div><!-- /form-group -->
                    </div> <!-- /col-md-3 -->

                    <!-- No -->
                    <div class="col-md-3">
                        <div class="form-group">
                            <label>
                                <input type="radio" name="otherstatus" value="LookNonBusiness" id="nonbus" <cfif #otherstatus# IS "LookNonBusiness">checked</cfif> />
                                No
                            </label>
                        </div><!-- /form-group -->
                    </div> <!-- /col-md-3 -->
                </div> <!-- /row -->
            </cfif>

            <!-- Preferred Work: Question -->
            <div class="row">
                <div class="col-md-6">
                    <h2 class="question">What kind of work would you like to do?</h2>
                </div>
            </div> <!-- /row -->

            <!-- Preferred Work: Options -->
            <div class="row">
                <div class="col-md-6">
                    <cfif #degreestatistics# IS NOT "BBA">
                        <cfselect query="functionalq" name="jobsearchfield" display="Functional" value="Functional" selected="#trim(jobsearchfield)#" id="select-work" class="form-control" placeholder="Select a functional area...">
                        </cfselect>
                            
                    <cfelse>
                        <cfselect query="functionalq_bschool" name="jobsearchfield" display="Functional" value="Functional" selected="#trim(jobsearchfield)#" id="select-workBA" class="demo-default" placeholder="Select a functional area...">
                        </cfselect>
                    </cfif>
                </div>
            </div> <!-- /row -->

            <!-- Preferred Industry: Question -->
            <div class="row">
                <div class="col-md-6">
                    <h2 class="question">What industry are you interested in entering?</h2>
                </div>
            </div> <!-- /row -->

            <!-- Preferred Work: Options -->
            <div class="row">
                <div class="col-md-6">
                    <cfif #degreestatistics# IS NOT "BBA">
                        <cfselect query="industries" name="jobsearchindustry" display="Industry" value="Industry" selected="#trim(jobsearchindustry)#" id="select-preferred" class="demo-default" placeholder="Select an industry..."></cfselect>
                            
                    <cfelse>
                        <cfselect query="industries_bschool" name="jobsearchindustry" display="Industry" value="Industry" selected="#trim(jobsearchindustry)#" id="select-preferredBA" class="demo-default" placeholder="Select an industry..."></cfselect>
                    </cfif>
                </div>
            </div> <!-- /row -->

            <!-- Geographic Region: Question -->
            <div class="row">
                <div class="col-md-6">
                    <h2 class="question">What geographic region are you seeking work?</h2>
                </div>
            </div> <!-- /row -->

            <!-- Geographic Region: Options -->
            <div class="row">
                <div class="col-md-6">
                    <cfselect name="SeekRegion" selected="#SeekRegion#" class="form-control">
                        <option value="">Select a region...</option>
                        <option value="United States" <cfif #SeekRegion# IS "United States">selected</cfif>>United States</option>
                        <option value="Canada" <cfif #SeekRegion# IS "Canada">selected</cfif>>Canada</option>
                        <option value="Central America" <cfif #SeekRegion# IS "Central America">selected</cfif>>Central America or Mexico</option>
                        <option value="South America" <cfif #SeekRegion# IS "South America">selected</cfif>>South America</option>
                        <option value="Europe" <cfif #SeekRegion# IS "Europe">selected</cfif>>Europe</option>
                        <option value="Middle East" <cfif #SeekRegion# IS "Middle East">selected</cfif>> Middle East</option>
                        <option value="Africa" <cfif #SeekRegion# IS "Africa">selected</cfif>> Africa</option>
                        <option value="Asia" <cfif #SeekRegion# IS "Asia">selected</cfif>> Asia</option>
                        <option value="Australia" <cfif #SeekRegion# IS "Australia">selected</cfif>> Australia</option>
                        </cfselect>
                </div>
            </div> <!-- /row -->
        </div> <!-- /seeking work -->

        <!-- Seeking Continued Education -->
        <div id="seekinggradinfo">

            <!-- Department: Question -->
            <div class="row">
                <div class="col-md-12">
                    <h2 class="question">Seeking Continued Education</h2>

                    <hr>

                    <h2 class="question">What department do you wish to be in?</h2>
                </div>
            </div> <!-- /row -->

            <!-- Department: Options -->
            <div class="row">
                <div class="col-md-6">
                    <input name="GRADDEPARTSEEKING" type="text" value="#GRADDEPARTSEEKING#" maxlength="40" class="form-control" placeholder="e.g. Chemistry, Game Design, Acoustic Engineering"/>
                </div>
            </div> <!-- /row -->

            <!-- Degree: Question -->
            <div class="row">
                <div class="col-md-12">
                    <h2 class="question">What degree are you pursuing?</h2>
                </div>
            </div> <!-- /row -->

            <!-- Degree: Options -->
            <div class="row">
                <div class="col-md-6">
                    <cfselect query="degrees" name="GRADDEGREESEEKING" id="select-seeking" value="GradDegree" selected="#GRADDEGREESEEKING#" class="demo-default" placeholder="Select a degree..."></cfselect>
                </div>
            </div> <!-- /row -->
        </div> <!-- /seeking continued education --> 

        <!-- Influence -->
        <div id="influence">
            <!-- Influence: Question -->
            <div class="row">
                <div class="col-md-12">
                    <h2 class="question">Which W&M faculty or staff member had the greatest influence on your career development?</h2>
                </div>
            </div>

            <!-- Influence: Answer -->
            <div class="row">
                <div class="col-md-6">
                    <input name="influencer" id="influencer" type="text" class="form-control" value="#influencer#" placeholder="Professor John Smith">
                </div>
            </div>
        </div> <!-- /influence -->

        <!-- Checkboxes --> 
        <div class="row" id="checkboxes">
            <div class="col-md-12">
                <h2 class="question">Please check all that apply.</h2>
                
                <!-- Job Offers: Checkbox -->
                <div class="toggleChkbox checkbox" id="joboffers" style="display:none;">
                    <label>
                        <input type="checkbox" id="jobcheck" onClick="$('##offers').toggle()" />
                        I received job offers
                    </label>
                </div><!-- /job offers -->
                
                <!-- Grad School Offers: Checkbox -->
                <div class="toggleChkbox checkbox" id="gradschooloffers" style="display:none;">
                    <label>
                        <input type="checkbox" id="gradaccepted" onClick="$('##applications').toggle()" />
                        I was accepted or wait-listed for a graduate school
                    </label>
                </div><!-- /grad school offers -->
                
                <!-- Standardized Tests: Checkbox -->
                <div class="toggleChkbox checkbox" id="gradschooloffers" style="display:none;">
                    <label>
                        <input type="checkbox" id="gradaccepted" onClick="$('##applications').toggle()" />
                        I took one or more standardized admissions tests
                    </label>
                </div><!-- /standardized tests offers -->
            </div>
        </div> <!-- /row -->

        <div id="offers" style="display:none;">

            <h2 class="legend2">Job Offers</h2>

            <!-- Offer 1 -->
            <div class="row" id="offer1">
                <!-- Offer Date -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="firstofferdate"><b>Date of Offer</b></label>
                        <select name="firstofferdate" class="form-control" id="firstofferdate" placeholder="Select a date...">
                            <option value="">Select a date...</option>
                            <option value="before"  <cfif trim(#firstofferdate#) IS "before">selected</cfif>> Before graduation </option>
                            <option value="within3" <cfif trim(#firstofferdate#) IS "within3">selected</cfif>> After graduation, but within 3 months </option>
                            <option value="after3"  <cfif trim(#firstofferdate#) IS "after3">selected</cfif>> 3 months or longer after graduation</option>
                        </select>
                    </div>
                </div> <!-- /offer date -->

                <!-- Employer -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="offer1employer"><b>Employer</b></label>
                        <cfselect query="employers" name="offer1employer" id="offer1employer" value="employername" class="demo-default" placeholder="Select an employer..."></cfselect>
                    </div>
                </div> <!-- /employer -->

                <!-- Add another employer -->
                <div class="col-md-2">
                    <br>
                    <button type="button" class="btn btn-default btn-block btn1" id="btn1">Add another job offer</button>
                </div>
            </div> <!-- /row -->

            <!-- Offer 2 -->
            <div class="row" id="offer2">
                <!-- Offer Date -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="offer2date"><b>Date of Offer</b></label>
                        <select name="offer2date" class="form-control" id="offer2date" placeholder="Select a date...">
                            <option value="">Select a date...</option>
                            <option value="before"  <cfif trim(#firstofferdate#) IS "before">selected</cfif>> Before graduation </option>
                            <option value="within3" <cfif trim(#firstofferdate#) IS "within3">selected</cfif>> After graduation, but within 3 months </option>
                            <option value="after3"  <cfif trim(#firstofferdate#) IS "after3">selected</cfif>> 3 months or longer after graduation</option>
                        </select>
                    </div>
                </div> <!-- /offer date -->

                <!-- Employer -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="offer2employer"><b>Employer</b></label>
                        <cfselect query="employers" name="offer2employer" id="offer2employer" value="employername" class="demo-default" placeholder="Select an employer..."></cfselect>
                    </div>
                </div> <!-- /employer -->

                <!-- Add another employer -->
                <div class="col-md-2">
                    <br>
                    <button type="button" class="btn btn-default btn-block" id="btn2"> Add another job offer </button>
                </div>
            </div> <!-- /row -->

            <!-- Offer 3 -->
            <div class="row" id="offer3">
                <!-- Offer Date -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="offer3date"><b>Date of Offer</b></label>
                        <select name="offer3date" class="form-control" id="offer3date" placeholder="Select a date...">
                            <option value="">Select a date...</option>
                            <option value="before"  <cfif trim(#firstofferdate#) IS "before">selected</cfif>> Before graduation </option>
                            <option value="within3" <cfif trim(#firstofferdate#) IS "within3">selected</cfif>> After graduation, but within 3 months </option>
                            <option value="after3"  <cfif trim(#firstofferdate#) IS "after3">selected</cfif>> 3 months or longer after graduation</option>
                        </select>
                    </div>
                </div> <!-- /offer date -->

                <!-- Employer -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="offer3employer"><b>Employer</b></label>
                        <cfselect query="employers" name="offer3employer" id="offer3employer" value="employername" class="demo-default" placeholder="Select an employer..."></cfselect>
                    </div>
                </div> <!-- /employer -->

                <!-- Add another employer -->
                <div class="col-md-2">
                    <br>
                    <button type="button" class="btn btn-default btn-block" id="btn3"> Add another job offer </button>
                </div>
            </div> <!-- /row -->

            <!-- Offer 4 -->
            <div class="row" id="offer4">
                <!-- Offer Date -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="offer4date"><b>Date of Offer</b></label>
                        <select name="offer4date" class="form-control" id="offer4date" placeholder="Select a date...">
                            <option value="">Select a date...</option>
                            <option value="before"  <cfif trim(#firstofferdate#) IS "before">selected</cfif>> Before graduation </option>
                            <option value="within3" <cfif trim(#firstofferdate#) IS "within3">selected</cfif>> After graduation, but within 3 months </option>
                            <option value="after3"  <cfif trim(#firstofferdate#) IS "after3">selected</cfif>> 3 months or longer after graduation</option>
                        </select>
                    </div>
                </div> <!-- /offer date -->

                <!-- Employer -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="offer4employer"><b>Employer</b></label>
                        <cfselect query="employers" name="offer4employer" id="offer4employer" value="employername" class="demo-default" placeholder="Select an employer..."></cfselect>
                    </div>
                </div> <!-- /employer -->

                <!-- Add another employer -->
                <div class="col-md-2">
                    <br>
                    <button type="button" class="btn btn-default btn-block" id="btn4"> Add another job offer </button>
                </div>
            </div> <!-- /row -->

            <!-- Offer 5 -->
            <div class="row" id="offer5">
                <!-- Offer Date -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="offer5date"><b>Date of Offer</b></label>
                        <select name="offer5date" class="form-control" id="offer5date" placeholder="Select a date...">
                            <option value="">Select a date...</option>
                            <option value="before"  <cfif trim(#firstofferdate#) IS "before">selected</cfif>> Before graduation </option>
                            <option value="within3" <cfif trim(#firstofferdate#) IS "within3">selected</cfif>> After graduation, but within 3 months </option>
                            <option value="after3"  <cfif trim(#firstofferdate#) IS "after3">selected</cfif>> 3 months or longer after graduation</option>
                        </select>
                    </div>
                </div> <!-- /offer date -->

                <!-- Employer -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="offer5employer"><b>Employer</b></label>
                        <cfselect query="employers" name="offer5employer" id="offer5employer" value="employername" class="demo-default" placeholder="Select an employer..."></cfselect>
                    </div>
                </div> <!-- /employer -->
            </div> <!-- /row -->
        </div> <!-- /job offers -->

        <!-- Grad Schools -->
        <div id="applications" style="display:none;">

            <h2 class="legend2">Graduate Schools</h2>

            <!-- School 1 -->
            <div class="row" id="sch1">

                <!-- School Name -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="school1name"><b>School</b></label>
                        <cfselect query="gradschools" name="SCHNAME1" id="school1name" value="GradSchoolName" class="demo-default" placeholder="Select an school..."></cfselect>
                    </div>
                </div> <!-- /school name -->

                <!-- Department -->
                <div class="col-lg-3">
                    <div class="form-group">
                        <label for="school1department"><b>Department</b></label>
                        <input name="DEPT1" type="text" value="#DEPT1#" class="form-control" placeholder="Department" id="school1department"/>
                    </div>
                </div> <!-- /department -->

                <!-- Degree -->
                <div class="col-lg-2">
                    <div class="form-group">
                        <label for="school1degree"><b>Degree</b></label>
                        <cfselect query="degrees" name="DEGREE1" value="GradDegree" class="demo-default" id="school1degree" placeholder="Select a degree..."></cfselect>
                    </div>
                </div> <!-- /department -->

                <!-- Add another school -->
                <div class="col-md-2">
                    <br>
                    <button type="button" class="btn btn-default btn-block" id="sbtn1"> Add another school </button>
                </div>
            </row> <!-- /school1 -->

            <!-- School 2 -->
            <div class="row" id="sch2">

                <!-- School Name -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="school2name"><b>School</b></label>
                        <cfselect query="gradschools" name="SCHNAME2" id="school2name" value="GradSchoolName" class="demo-default" placeholder="Select an school..."></cfselect>
                    </div>
                </div> <!-- /school name -->

                <!-- Department -->
                <div class="col-lg-3">
                    <div class="form-group">
                        <label for="school2department"><b>Department</b></label>
                        <input name="DEPT2" type="text" value="#DEPT2#" class="form-control" placeholder="Department" id="school2department"/>
                    </div>
                </div> <!-- /department -->

                <!-- Degree -->
                <div class="col-lg-2">
                    <div class="form-group">
                        <label for="school2degree"><b>Degree</b></label>
                        <cfselect query="degrees" name="DEGREE2" value="GradDegree" class="demo-default" id="school2degree" placeholder="Select a degree..."></cfselect>
                    </div>
                </div> <!-- /department -->

                <!-- Add another school -->
                <div class="col-md-2">
                    <br>
                    <button type="button" class="btn btn-default btn-block" id="sbtn2"> Add another school </button>
                </div>
            </row> <!-- /school2 -->

            <!-- School 3 -->
            <div class="row" id="sch3">

                <!-- School Name -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="school3name"><b>School</b></label>
                        <cfselect query="gradschools" name="SCHNAME3" id="school3name" value="GradSchoolName" class="demo-default" placeholder="Select an school..."></cfselect>
                    </div>
                </div> <!-- /school name -->

                <!-- Department -->
                <div class="col-lg-3">
                    <div class="form-group">
                        <label for="school3department"><b>Department</b></label>
                        <input name="DEPT3" type="text" value="#DEPT3#" class="form-control" placeholder="Department" id="school3department"/>
                    </div>
                </div> <!-- /department -->

                <!-- Degree -->
                <div class="col-lg-2">
                    <div class="form-group">
                        <label for="school3degree"><b>Degree</b></label>
                        <cfselect query="degrees" name="DEGREE3" value="GradDegree" class="demo-default" id="school3degree" placeholder="Select a degree..."></cfselect>
                    </div>
                </div> <!-- /department -->

                <!-- Add another school -->
                <div class="col-md-2">
                    <br>
                    <button type="button" class="btn btn-default btn-block" id="sbtn3"> Add another school </button>
                </div>
            </row> <!-- /school3 -->

            <!-- School 4 -->
            <div class="row" id="sch4">

                <!-- School Name -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="school4name"><b>School</b></label>
                        <cfselect query="gradschools" name="SCHNAME4" id="school4name" value="GradSchoolName" class="demo-default" placeholder="Select an school..."></cfselect>
                    </div>
                </div> <!-- /school name -->

                <!-- Department -->
                <div class="col-lg-3">
                    <div class="form-group">
                        <label for="school4department"><b>Department</b></label>
                        <input name="DEPT4" type="text" value="#DEPT4#" class="form-control" placeholder="Department" id="school4department"/>
                    </div>
                </div> <!-- /department -->

                <!-- Degree -->
                <div class="col-lg-2">
                    <div class="form-group">
                        <label for="school4degree"><b>Degree</b></label>
                        <cfselect query="degrees" name="DEGREE4" value="GradDegree" class="demo-default" id="school4degree" placeholder="Select a degree..."></cfselect>
                    </div>
                </div> <!-- /degree -->
            </div> <!-- /row -->
        </div> <!-- /grad schools -->

        <!-- Standardized Tests -->
        <div id="tests" style="display:none;">

            <h2 class="legend">Standardized Test Schools</h2>

            <!-- GMAT -->
            <div class="row">
                <div class="col-md-1">
                    <h3>GMAT</h3>
                </div>

                <!-- Quantitative -->
                <div class="col-md-3">
                    <label for="GMATQUAN"><b>Quantitative</b></label>
                    <input name="GMATQUAN" id="GMATQUAN" type="text" class="form-control" value="#GMATQUAN#"  placeholder="Quantitative" data-toggle="tooltip" data-placement="top" title="Quantitative"/>
                </div>

                <!-- Verbal -->
                <div class="col-md-3">
                    <label for="GMATVERB"><b>Verbal</b></label>
                    <input name="GMATVERB" id="GMATVERB" type="text" class="form-control" value="#GMATVERB#"  placeholder="Verbal" data-toggle="tooltip" data-placement="top" title="Verbal"/>
                </div>

                <!-- Total -->
                <div class="col-md-3">
                    <label for="GMATSCOR"><b>Total</b></label>
                    <input name="GMATSCOR" id="GMATSCOR" type="text" class="form-control" value="#GMATSCOR#" placeholder="Total" data-toggle="tooltip" data-placement="top" title="Total"/>
                </div>
            </div> <!-- /gmat -->

            <!-- GRE -->
            <div class="row">
                <div class="col-md-1">
                    <h3>GRE</h3>
                </div>

                <!-- Analytical -->
                <div class="col-md-3">
                    <label for="GREANLYT"><b>Analytical</b></label>
                    <input name="GREANLYT" id="GREANLYT" type="text" class="form-control" value="#GREANLYT#" placeholder="Analytical" data-toggle="tooltip" data-placement="top" title="Analytical" />
                </div>

                <!-- Quantitative -->
                <div class="col-md-3">
                    <label for="GREQUAN"><b>Quantitative</b></label>
                    <input name="GREQUAN" id="GREQUAN" type="text" class="form-control" value="#GREQUAN#" placeholder="Quantitative" data-toggle="tooltip" data-placement="top" title="Quantitative"/>
                </div>

                <!-- Subject -->
                <div class="col-md-3">
                    <label for="GRESUBJT"><b>Subject</b></label>
                    <input name="GRESUBJT" id="GRESUBJT" type="text" class="form-control" value="#GRESUBJT#" placeholder="Subject" data-toggle="tooltip" data-placement="top" title="Subject"/>
                </div>

                <!-- Verbal -->
                <div class="col-md-2">
                    <label for="GREVERB"><b>Verbal</b></label>
                    <input name="GREVERB" id="GREVERB" type="text" class="form-control" value="#GREVERB#" placeholder="Verbal" data-toggle="tooltip" data-placement="top" title="Verbal"/>
                </div>
            </div> <!-- /gre -->

            <!-- MCAT -->
            <div class="row">
                <div class="col-md-1">
                    <h3>MCAT</h3>
                </div>

                <!-- Analytical -->
                <div class="col-md-3">
                    <label for="MCATBIO"><b>Biological</b></label>
                    <input name="MCATBIO" id="MCATBIO" type="text" class="form-control" value="#MCATBIO#" placeholder="Biological" data-toggle="tooltip" data-placement="top" title="Biological" />
                </div>

                <!-- Physical -->
                <div class="col-md-3">
                    <label for="MCATPHYS"><b>Physical Science</b></label>
                    <input name="MCATPHYS" id="MCATPHYS" type="text" class="form-control" value="#MCATPHYS#" placeholder="Physical Science" data-toggle="tooltip" data-placement="top" title="Physical Science"/>
                </div>

                <!-- Verbal -->
                <div class="col-md-3">
                    <label for="MCATVERB"><b>Verbal</b></label>
                    <input name="MCATVERB" id="MCATVERB" type="text" class="form-control" value="#MCATVERB#" placeholder="Verbal" data-toggle="tooltip" data-placement="top" title="Verbal"/>
                </div>

                <!-- Writing -->
                <div class="col-md-2">
                    <label for="MCATWRIT"><b>Writing</b></label>
                    <input name="MCATWRIT" id="MCATWRIT" type="text" class="form-control" value="#MCATWRIT#" placeholder="Writing" data-toggle="tooltip" data-placement="top" title="Writing"/>
                </div>
            </div> <!-- /mcat -->

            <!-- LSAT -->
            <div class="row">
                <div class="col-md-1">
                    <h3>LSAT</h3>
                </div>

                <!-- Total -->
                <div class="col-md-3">
                    <label for="LSATSCOR"><b>Total</b></label>
                    <input name="LSATSCOR" id="LSATSCOR" type="text" class="form-control" value="#LSATSCOR#" size="15"  placeholder="Total" data-toggle="tooltip" data-placement="top" title="Total" />
                </div> <!-- /total -->
            </div> <!-- /lsat -->

            <!-- Other -->
            <div class="row">
                <div class="col-md-1">
                    <h3>LSAT</h3>
                </div>

                <!-- Name -->
                <div class="col-md-3">
                    <label for="EXAMOTHR"><b>Name</b></label>
                    <input name="EXAMOTHR" id="EXAMOTHR" type="text" class="form-control" value="#EXAMOTHR#" placeholder="Exam Name" data-toggle="tooltip" data-placement="top" title="Exam Name"/>
                </div> <!-- /name -->

                <!-- Total -->
                <div class="col-md-3">
                    <label for="EXAMSCOR"><b>Total</b></label>
                    <input name="EXAMSCOR" id="EXAMSCOR" type="text" class="form-control" value="#EXAMSCOR#" placeholder="Total" data-toggle="tooltip" data-placement="top" title="Total"/>
                </div> <!-- /name -->
            </div> <!-- /other -->
        </div> <!-- /standardized tests -->

        <br><br><Br><Br><br>
    </div> <!-- /inner -->

    </cfform>
</cfif>
</cfoutput>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster 
    <script src="js/jquery.min.js"></script>-->
    <script src="js/bootstrap.js"></script>
    <script src="js/docs.js"></script>
    <script src="js/offcanvas.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>

    <!-- Combobox Script -->
    <script language="JavaScript" type="text/javascript">
        // Initialize variables
        var select_state, $select_state;
        var select_region, $select_region;

        var select_organization, $select_organization;

        var select_offer1employer, $select_offer1employer;
        var select_offer2employer, $select_offer2employer;
        var select_offer3employer, $select_offer3employer;
        var select_offer4employer, $select_offer4employer;
        var select_offer5employer, $select_offer5employer;

        var select_school1name, $select_school1name;
        var select_school2name, $select_school2name;
        var select_school3name, $select_school3name;
        var select_school4name, $select_school4name;


        var select_school1degree, $select_school1degree;
        var select_school2degree, $select_school2degree;
        var select_school3degree, $select_school3degree;
        var select_school4degree, $select_school4degree;

        var select_industry, $select_industry;
        var select_functional, $select_functional;
        var select_duties, $select_duties;
        var select_branch, $select_branch;
        var select_workBA, $select_workBA;
        var select_work, $select_work;
        var select_preferredBA, $select_preferredBA;
        var select_preferred, $select_preferred;

        // Initialize Selectize functionality
        $(function() {
            $('select').selectize(options);
        });

        // Initialize Organizaton combobox.
        select_organization = $('#select-organization').selectize({
                    create: true,
                    sortField: {
                        field: 'text',
                        direction: 'asc'
                    },
                    dropdownParent: 'body'
                });

        // Initialize Organizaton combobox.
        select_offer1employer = $('#offer1employer').selectize({
                    create: true,
                    sortField: {
                        field: 'text',
                        direction: 'asc'
                    },
                    dropdownParent: 'body'
                });

        // Initialize Organizaton combobox.
        select_offer2employer = $('#offer2employer').selectize({
                    create: true,
                    sortField: {
                        field: 'text',
                        direction: 'asc'
                    },
                    dropdownParent: 'body'
                });

        // Initialize Organizaton combobox.
        select_offer3employer = $('#offer3employer').selectize({
                    create: true,
                    sortField: {
                        field: 'text',
                        direction: 'asc'
                    },
                    dropdownParent: 'body'
                });

        // Initialize Organizaton combobox.
        select_offer4employer = $('#offer4employer').selectize({
                    create: true,
                    sortField: {
                        field: 'text',
                        direction: 'asc'
                    },
                    dropdownParent: 'body'
                });

        // Initialize Organizaton combobox.
        select_offer5employer = $('#offer5employer').selectize({
                    create: true,
                    sortField: {
                        field: 'text',
                        direction: 'asc'
                    },
                    dropdownParent: 'body'
                });

        // Initialize Organizaton combobox.
        select_school1name = $('#school1name').selectize({
                    create: true,
                    sortField: {
                        field: 'text',
                        direction: 'asc'
                    },
                    dropdownParent: 'body'
                });

        // Initialize Organizaton combobox.
        select_school2name = $('#school2name').selectize({
                    create: true,
                    sortField: {
                        field: 'text',
                        direction: 'asc'
                    },
                    dropdownParent: 'body'
                });

        // Initialize Organizaton combobox.
        select_school3name = $('#school3name').selectize({
                    create: true,
                    sortField: {
                        field: 'text',
                        direction: 'asc'
                    },
                    dropdownParent: 'body'
                });

        // Initialize Organizaton combobox.
        select_school4name = $('#school4name').selectize({
                    create: true,
                    sortField: {
                        field: 'text',
                        direction: 'asc'
                    },
                    dropdownParent: 'body'
                });

        // Initialize Organizaton combobox.
        select_school1degree = $('#school1degree').selectize({
                    create: true,
                    sortField: {
                        field: 'text',
                        direction: 'asc'
                    },
                    dropdownParent: 'body'
                });

        // Initialize Organizaton combobox.
        select_school2degree = $('#school2degree').selectize({
                    create: true,
                    sortField: {
                        field: 'text',
                        direction: 'asc'
                    },
                    dropdownParent: 'body'
                });

        // Initialize Organizaton combobox.
        select_school3degree = $('#school3degree').selectize({
                    create: true,
                    sortField: {
                        field: 'text',
                        direction: 'asc'
                    },
                    dropdownParent: 'body'
                });

        // Initialize Organizaton combobox.
        select_school4degree = $('#school4degree').selectize({
                    create: true,
                    sortField: {
                        field: 'text',
                        direction: 'asc'
                    },
                    dropdownParent: 'body'
                });

        // Initialize Organizaton combobox.
        select_industry = $('#select-industry').selectize({
                    create: true,
                    sortField: {
                        field: 'text',
                        direction: 'asc'
                    },
                    dropdownParent: 'body'
                });

        // Initialize Industry combobox.
        select_functional = $('#select-functional').selectize({
                    sortField: {
                        field: 'text',
                        direction: 'asc'
                    },
                        dropdownParent: 'body'
                });

        // Initialize Industry combobox.
        select_duties = $('#select-duties').selectize({
                    sortField: {
                        field: 'text',
                        direction: 'asc'
                    },
                        dropdownParent: 'body'
                });

        // Initialize Industry combobox.
        select_branch = $('#select-branch').selectize({
                    sortField: {
                        field: 'text',
                        direction: 'asc'
                    },
                        dropdownParent: 'body'
                });

        // Initialize Industry combobox.
        select_school = $('#select-school').selectize({
                    create: true,
                    sortField: {
                        field: 'text',
                        direction: 'asc'
                    },
                        dropdownParent: 'body'
                });

        // Initialize Industry combobox.
        select_degree = $('#select-degree').selectize({
                    sortField: {
                        field: 'text',
                        direction: 'asc'
                    },
                        dropdownParent: 'body'
                });

        // Initialize Industry combobox.
        select_seeking = $('#select-seeking').selectize({
                    sortField: {
                        field: 'text',
                        direction: 'asc'
                    },
                        dropdownParent: 'body'
                });

        // Initialize Industry combobox.
        select_workBA = $('#select-workBA').selectize({
                    sortField: {
                        field: 'text',
                        direction: 'asc'
                    },
                        dropdownParent: 'body'
                });

        // Initialize Industry combobox.
        select_work = $('#select-work').selectize({
                    sortField: {
                        field: 'text',
                        direction: 'asc'
                    },
                        dropdownParent: 'body'
                });

        // Initialize Industry combobox.
        select_preferredBA = $('#select-preferredBA').selectize({
                    sortField: {
                        field: 'text',
                        direction: 'asc'
                    },
                        dropdownParent: 'body'
                });

        // Initialize Industry combobox.
        select_preferred = $('#select-preferred').selectize({
                    sortField: {
                        field: 'text',
                        direction: 'asc'
                    },
                        dropdownParent: 'body'
                });

        // Initialize State combobox.
        // If a value is selected in the State combobox,
        // clear the World Region combobox's value.
        $select_state = $('#select-state').selectize({
                    sortField: {
                        field: 'text',
                        direction: 'asc'
                    },
                    dropdownParent: 'body',

                    // If an item is selected
                    onChange: function(value) {
                        if (!value.length) return;
                        // Clear Regiom's value
                        select_region.clear(true);
                    }
                });

        // Initialize World Region combobox.
        // If a value is selected in the Region combobox,
        // clear the State combobox's value.
        $select_region = $('#select-region').selectize({
                    sortField: {
                        field: 'text',
                        direction: 'asc'
                    },
                    dropdownParent: 'body',

                    // If an item is selected
                    onChange: function(value) {
                        if (!value.length) return;
                        // Clear State's value
                        select_state.clear(true);
                    }
                });


        // Instantiate comboboxes.
        select_region  = $select_region[0].selectize;
        select_state = $select_state[0].selectize;

        select_organization = $select_organization[0].selectize;

        select_offer1employer = $select_offer1employer[0].selectize;
        select_offer2employer = $select_offer2employer[0].selectize;
        select_offer3employer = $select_offer3employer[0].selectize;
        select_offer4employer = $select_offer4employer[0].selectize;
        select_offer5employer = $select_offer5employer[0].selectize;

        select_school1name = $select_school1name[0].selectize;
        select_school2name = $select_school2name[0].selectize;
        select_school3name = $select_school3name[0].selectize;
        select_school4name = $select_school4name[0].selectize;


        select_school1degree = $select_school1degree[0].selectize;
        select_school2degree = $select_school2degree[0].selectize;
        select_school3degree = $select_school3degree[0].selectize;
        select_school4degree = $select_school4degree[0].selectize;

        select_industry = $select_industry[0].selectize;
        select_functional = $select_functional[0].selectize;
        select_duties = $select_duties[0].selectize;
        select_branch = $select_branch[0].selectize;
        select_workBA = $select_workBA[0].selectize;
        select_work = $select_work[0].selectize;
        select_preferredBA = $select_preferredBA[0].selectize;
        select_preferred = $select_preferred[0].selectize;

        select_organization.setValue("#employer#");

        // Set selected values for comboboxes
        select_offer1employer.setValue("#employername#");
        select_offer2employer.setValue("#offer2employer#");
        select_offer3employer.setValue("#offer3employer#");
        select_offer4employer.setValue("#offer4employer#");
        select_offer5employer.setValue("#offer5employer#");

        select_school1name.setValue("#SCHNAME1#");
        select_school2name.setValue("#SCHNAME2#");
        select_school3name.setValue("#SCHNAME3#");
        select_school4name.setValue("#SCHNAME4#");

        select_school1degree.setValue("#DEGREE1#");
        select_school2degree.setValue("#DEGREE2#");
        select_school3degree.setValue("#DEGREE3#");
        select_school4degree.setValue("#DEGREE4#");

        select_industry.setValue("#industry#");
        select_functional.setValue("#functional#");
        select_duties.setValue("#functional#");
        select_branch.setValue("#employer#");
        select_workBA.setValue("#jobsearchfield#");
        select_work.setValue("#jobsearchfield#");
        select_preferredBA.setValue("#jobsearchindustry#");
        select_preferred.setValue("#jobsearchindustry#");
    </script>
</body>