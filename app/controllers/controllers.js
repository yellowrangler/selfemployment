// define controllers for app
var controllers = {};

controllers.dashboardController = function ($scope, $http, $location) {

    init();
    function init() {
      
    };
}

controllers.administrationController = function ($scope, $http, $location, clientServices, clientFactory) {
    $scope.clients = "";
    $scope.current.client = "";

    function getClientList() 
    {
        // get client list
        clientFactory.getClients()
            .success( function(JSONstr) {
                $scope.clients = JSONstr;
            })
            .error( function (data) {
                alert("Error "+data);
            });
    }
    init();
    function init() {
        // client process
        var clientObj = clientServices.getCurrentClient();
        if (clientObj != "")
        {
            $scope.current.client = clientObj.id;
        }

        // get client list
        getClientList();   
    }

    //set current project
    $scope.setCurrentProject = function (id) {
        setCurrentProject(id);
    }
}

controllers.timeentrydailyController = function ($scope, clientServices, projectServices, dateServices, clientFactory, projectFactory, timeDailyEntryFactory) {
    $scope.current = {};
    $scope.newDailyEntry = {};
    $scope.newDailyEntry.projectdailytimeid = "";
    $scope.current.timeEntryDate = "";
    $scope.current.timeEntryActionButton = "";    
    $scope.clients = "";
    $scope.current.client = "";
    $scope.current.contactname = "NA";
    $scope.current.contactdeskphone = "NA";
    $scope.current.contactemail = "NA";        
    $scope.projects = "";
    $scope.current.project = "";   
    $scope.timeDailyEntries = "";
    $scope.timeDailyEntryTotal = "0.00";


    //
    // get project lists that are active. But start with last one used
    //    
    function getClientProjectList(id) 
    {
        $scope.current.client = id;
        $scope.current.project = 0;
        clientServices.addCurrentClient($scope.current.client,"Clientid");
        var clientidStr = "clientid="+$scope.current.client;    
        projectFactory.getClientProjects(clientidStr)
            .success( function(JSONstr) {
                $scope.projects = JSONstr;

                getDailyEntryHistory();
            })
            .error( function (data) {
                alert("Error "+data);
            });
    }

    //
    // get client lists that are active. But start with last one used
    // 
    function getClientList() 
    {
        // get client list
        clientFactory.getClients()
            .success( function(JSONstr) {
                $scope.clients = JSONstr;

                $scope.current.contactname = "NA";
                $scope.current.contactdeskphone = "NA";
                $scope.current.contactemail = "NA";  

                getDailyEntryHistory();
            })
            .error( function (data) {
                alert("Error "+data);
            });
    }

    //set current project
    function setCurrentProject(projectid) 
    {
        $scope.current.project = projectid;
        $.each($scope.projects, function (idx, project) {
            if (project.projectid == projectid)
            {
                $scope.current.contactname = project.contactname;
                $scope.current.contactdeskphone = project.contactdeskphone;
                $scope.current.contactemail = project.contactemail; 

                return false;
            }
        });

        projectServices.addCurrentProject($scope.current.project,"Projectid");
    }

    // add new time entry
    function insertUpdateDailyEntry(projectdailytimeid)
    {
        var clientid = $scope.current.client;
        var projectid = $scope.current.project;
        var entrydate = $scope.current.timeEntryDate;
        var starttime = $scope.newDailyEntry.startTime;
        var stoptime = $scope.newDailyEntry.stopTime;
        var interval = $scope.newDailyEntry.timeInterval;
        var comment = $scope.newDailyEntry.intervalDescription;

        if ($scope.current.timeEntryActionButton == "Add")
        {
            if (interval == "")
            {
                interval = 0; 
            }

            var data = "projectid="+projectid+"&entrydate="+entrydate+"&starttime="+starttime+"&stoptime="+stoptime+"&interval="+interval+"&comment="+comment;


            timeDailyEntryFactory.addDailyTime(data)
                .success( function(sdata) {
                    clearDailyEntry();
                    
                    getDailyEntryHistory();
                })
                .error( function(edata) {
                    alert("Failed ajax to add time entry");
                });
        } 
        else
        {
            var data = "projectdailytimeid="+projectdailytimeid+"&projectid="+projectid+"&entrydate="+entrydate+"&starttime="+starttime+"&stoptime="+stoptime+"&interval="+interval+"&comment="+comment;


            timeDailyEntryFactory.updateDailyTime(data)
                .success( function(sdata) {
                    clearDailyEntry();
                    
                    getDailyEntryHistory();
                })
                .error( function(edata) {
                    alert("Failed ajax to update time entry");
                });
        }
            
    }

    function clearDailyEntry ()
    {
        $scope.current.timeEntryActionButton = "Add";

        $scope.newDailyEntry.startTime = "";
        $scope.newDailyEntry.stopTime = "";
        $scope.newDailyEntry.timeInterval = "";
        $scope.newDailyEntry.intervalDescription = "";
        $scope.newDailyEntry.projectdailytimeid = "";
    }

    // set input fields for edit of time entry line item
    function editTimeEntryDaily(projectdailytimeid)
    {
        $.each($scope.timeDailyEntries, function (idx, timeentries) {
            if (timeentries.projectdailytimeid == projectdailytimeid)
            {
                $scope.newDailyEntry.startTime = simpleTimeFormat(timeentries.fstarttime);
                $scope.newDailyEntry.stopTime = simpleTimeFormat(timeentries.fstoptime);
                $scope.newDailyEntry.timeInterval = timeentries.finterval;
                $scope.newDailyEntry.intervalDescription = timeentries.intervaldescription;
                $scope.newDailyEntry.projectdailytimeid = timeentries.projectdailytimeid;

                return false;
            }
        });

        $scope.current.timeEntryActionButton = "Update";
                
    }

    // delete time entry line item
    function deleteTimeEntryDaily(projectdailytimeid)
    {

        var data = "projectdailytimeid="+projectdailytimeid;

        timeDailyEntryFactory.deleteDailyTime(data)
            .success( function(sdata) {
                getDailyEntryHistory();
            })
            .error( function(edata) {
                alert("Failed ajax to delete time entry");
            });
    }
        
    // get time entries for today
    // add new time entry
    function getDailyEntryHistory()
    {
        var clientid = $scope.current.client;
        var projectid = $scope.current.project;
        var entrydate = $scope.current.timeEntryDate;

        var data = "clientid="+clientid+"&projectid="+projectid+"&entrydate="+entrydate;

        timeDailyEntryFactory.getActiveDailyTime(data)
            .success( function(JSONstr) {
                $scope.timeDailyEntries = JSONstr;

                var nbr = 0;
                $.each(JSONstr, function () {
                     nbr = nbr + parseFloat(this.finterval);
                });

                nbr = nbr.toFixed(2);
                $scope.timeDailyEntryTotal = nbr.toString();

                //
                // now get full project list 
                //
                var data = "clientid="+clientid+"&projectid="+projectid+"&entrydate=";

                timeDailyEntryFactory.getActiveDailyTime(data)
                    .success( function(JSONstr) {
                        $scope.fullTimeDailyEntries = JSONstr;

                        var nbr = 0;
                        $.each(JSONstr, function () {
                             nbr = nbr + parseFloat(this.finterval);
                        });

                        nbr = nbr.toFixed(2);
                        $scope.fullTimeDailyEntryTotal = nbr.toString();
                    })
                    .error( function(edata) {
                        alert("Failed ajax to get full time entry history");
                    });

            })
            .error( function(edata) {
                alert("Failed ajax to get time entry history");
            });
    }
    
    init();
    function init() {
        // some initial clean up and set up
        clearDailyEntry();

        // date stuff
        $( "#datepicker" ).datepicker();

        $( "#datepicker" ).change(function() {
            $scope.current.timeEntryDate = $("#datepicker").val();
            if ($scope.current.timeEntryDate == "")
            {
                $scope.current.timeEntryDate = dateServices.getCurrentDateForDisplay();
                $("#datepicker").val($scope.current.timeEntryDate);
            }
            
            clearDailyEntry();

            getDailyEntryHistory();
        });

        if ($scope.current.timeEntryDate == "")
        {
            $scope.current.timeEntryDate = dateServices.getCurrentDateForDisplay();
            $("#datepicker").val($scope.current.timeEntryDate);

            // getDailyEntryHistory();
        }

        // time stuff
        $("#timeIterval").focus(function() {
            var starttime = $scope.newDailyEntry.startTime;
            var stoptime = $scope.newDailyEntry.stopTime;
            if (starttime != "" && stoptime != "")
            {
                var tdiff = dateServices.getTimeDifference(starttime, stoptime);
                $scope.newDailyEntry.timeInterval = tdiff;

                $scope.$digest();

                return false;
            }
        });

        // client process
        var clientObj = clientServices.getCurrentClient();
        if (clientObj != "")
        {
            $scope.current.client = clientObj.id;

            getClientProjectList($scope.current.client);
        }

        // get client list
        getClientList();

        // project process
        var projectObj = projectServices.getCurrentProject();
        if (projectObj != "")
        {
            $scope.current.project = projectObj.id;
            var data = "projectid="+$scope.current.project;    
            projectFactory.getClientProject(data)
                .success( function(JSONstr) {
                    var project = JSONstr;

                    $scope.current.contactname = project.contactname;
                    $scope.current.contactdeskphone = project.contactdeskphone;
                    $scope.current.contactemail = project.contactemail; 
                })
                .error( function (data) {
                    alert("Error "+data);
                });
        }

        //
        // redo list
        //
        getDailyEntryHistory();
        
    };

    // project list
    $scope.getClientProjectList = function (id) {
        getClientProjectList(id);

        getDailyEntryHistory();
    }

    //set current project
    $scope.setCurrentProject = function (id) {
        setCurrentProject(id);

        getDailyEntryHistory();
    }

    // clear daily entry
    $scope.clearDailyEntry = function () {
        clearDailyEntry();
    }

    // edit timedailyentry
    $scope.editTimeEntryDaily = function (projectdailytimeid)
    {
        editTimeEntryDaily(projectdailytimeid);
    }

    // add new time entry
    $scope.insertUpdateDailyEntry = function (id)
    {
        insertUpdateDailyEntry(id);
    }

    // delete the time entry daily
    $scope.deleteTimeEntryDaily = function (id)
    {
        deleteTimeEntryDaily(id);
    }
}

controllers.timeentryreviewController = function ($scope, $http, $location, clientServices, projectServices, dateServices, clientFactory, projectFactory, timeDailyEntryFactory) {
    $scope.current = {};

    $scope.clients = "";
    $scope.current.client = "";
    $scope.projects = "";
    $scope.current.project = "";   
    $scope.timeDailyEntriesReview = "";
    $scope.timeDailyEntryReviewTotal = "0.00";

        
    function getClientProjectList(id) 
    {
        $scope.current.client = id;
        clientServices.addCurrentClient($scope.current.client,"Clientid");
        var clientidStr = "clientid="+$scope.current.client;    
        projectFactory.getClientProjects(clientidStr)
            .success( function(JSONstr) {
                $scope.projects = JSONstr;
            })
            .error( function (data) {
                alert("Error "+data);
            });
    }

    function getClientList() 
    {
        // get client list
        clientFactory.getClients()
            .success( function(JSONstr) {
                $scope.clients = JSONstr;
            })
            .error( function (data) {
                alert("Error "+data);
            });
    }

    //set current project
    function setCurrentProject(projectid) 
    {
        $scope.current.project = projectid;
        
        projectServices.addCurrentProject($scope.current.project,"Projectid");
    }

        
    // get time entries for today
    // add new time entry
    function getDailyEntryHistoryReview()
    {
        var clientid = $scope.current.client;
        var projectid = $scope.current.project;
        var fromdate = $("#datepickerfrom").val();
        var todate = $("#datepickerto").val();

        var data = "clientid="+clientid+"&projectid="+projectid+"&fromdate="+fromdate+"&todate="+todate;

        timeDailyEntryFactory.getDailyTimeReview(data)
            .success( function(JSONstr) {
                $scope.timeDailyEntriesReview = JSONstr;

                var nbr = 0;
                $.each(JSONstr, function () {
                     nbr = nbr + parseFloat(this.finterval);
                });

                nbr = nbr.toFixed(2);
                $scope.timeDailyEntryReviewTotal = nbr.toString();
            })
            .error( function(edata) {
                alert("Failed ajax to get time entry review history");
            });
    }
    
    init();
    function init() {
        // from and to date stuff
        $( "#datepickerfrom" ).datepicker();

        $( "#datepickerfrom" ).change(function() {
            if ($("#datepickerfrom").val() == "")
            {
                $("#datepickerfrom").val(dateServices.getCurrentDateForDisplay());
            }

            var date = $("#datepickerfrom").val();
            $("#datepickerto").val(dateServices.getDateforNextWeek(date));
        });

        if ($("#datepickerfrom").val() == "")
        {
            var currentDate = dateServices.getCurrentDateForDisplay();
            $("#datepickerfrom").val(dateServices.getCurrentDateForDisplay());
        }

        $( "#datepickerto" ).datepicker();
        if ($("#datepickerto").val() == "")
        {
            var currentDate = dateServices.getCurrentDateForDisplay();
            $("#datepickerto").val(dateServices.getDateforNextWeek(currentDate));
        }

        // client process
        var clientObj = clientServices.getCurrentClient();
        if (clientObj != "")
        {
            $scope.current.client = clientObj.id;
            getClientProjectList($scope.current.client);
        }

        // get client list
        getClientList();

        // project process
        var projectObj = projectServices.getCurrentProject();
        if (projectObj != "")
        {
            $scope.current.project = projectObj.id;
        }
    };

    // project list
    $scope.getClientProjectList = function (id) {
        getClientProjectList(id);
    }

    //set current project
    $scope.setCurrentProject = function (id) {
        setCurrentProject(id);
    }

    // get review list
    $scope.getDailyEntryReviewList = function ()
    {
        getDailyEntryHistoryReview();
    }
}

controllers.invoicesController = function ($scope, $http, $location, clientServices, projectServices, dateServices, clientFactory, projectFactory, timeDailyEntryFactory) {
    $scope.clients = "";
    $scope.current.client = "";
    $scope.timeDailyEntriesReview = "";
    $scope.timeDailyEntryReviewTotal = "0.00";

    // functions to call in controller
    function getClientList() 
    {
        // get client list
        clientFactory.getClients()
            .success( function(JSONstr) {
                $scope.clients = JSONstr;
            })
            .error( function (data) {
                alert("Error "+data);
            });
    }

    function getTimeEntriesForClient(id) 
    {
        if (id != "")
        {
            $scope.current.client  = id;
        }

        var clientid = $scope.current.client ;
        var projectid = 0;
        var fromdate = $("#datepickerfrom").val();
        var todate = $("#datepickerto").val();

        var data = "clientid="+clientid+"&projectid="+projectid+"&fromdate="+fromdate+"&todate="+todate;

        timeDailyEntryFactory.getDailyTimeReview(data)
            .success( function(JSONstr) {
                $scope.timeDailyEntriesReview = JSONstr;

                var nbr = 0;
                $.each(JSONstr, function () {
                     nbr = nbr + parseFloat(this.finterval);
                });

                nbr = nbr.toFixed(2);
                $scope.timeDailyEntryReviewTotal = nbr.toString();
            })
            .error( function(edata) {
                alert("Failed ajax to get time entry review history");
            });
    }

    init();
    function init() {
        // from and to date stuff
        $( "#datepickerfrom" ).datepicker();

        $( "#datepickerfrom" ).change(function() {
            if ($("#datepickerfrom").val() == "")
            {
                $("#datepickerfrom").val(dateServices.getCurrentDateForDisplay());
            }

            var date = $("#datepickerfrom").val();
            $("#datepickerto").val(dateServices.getWeekEndingDate(date));
        });

        if ($("#datepickerfrom").val() == "")
        {
            var currentDate = dateServices.getCurrentDateForDisplay();
            $("#datepickerfrom").val(dateServices.getCurrentDateForDisplay());
        }

        $( "#datepickerto" ).datepicker();
        if ($("#datepickerto").val() == "")
        {
            var currentDate = dateServices.getCurrentDateForDisplay();
            $("#datepickerto").val(dateServices.getWeekEndingDate(currentDate));
        }

        // client process
        var clientObj = clientServices.getCurrentClient();
        if (clientObj != "")
        {
            $scope.current.client = clientObj.id;
        }
        getClientList();
    }

    // client project time list for dates
    $scope.getTimeEntriesForClient = function (id) {
        getTimeEntriesForClient(id);
    }
}

controllers.adminclientsController = function ($scope, $http, $location, clientServices, clientFactory, stateService, clientStatusService) {
    $scope.current = {};
    $scope.current.client = "";
    $scope.clientdetails = "";

    // functions to call in controller
    function getClientList() 
    {
        // get client list
        clientFactory.getClients()
            .success( function(JSONstr) {
                $scope.clients = JSONstr;
            })
            .error( function (data) {
                alert("Error "+data);
            });
    }

    // functions to call in controller
    function getClientDetails(clientid) 
    {
        $scope.current.client = clientid;
        clientServices.addCurrentClient(clientid,"Clientid");

        var data = "clientid="+clientid;

        // get client list
        clientFactory.getClientDetails(data)
            .success( function(JSONstr) {
                $scope.clientdetails = JSONstr;
            })
            .error( function (data) {
                alert("Error "+data);
            });
    }

    function clearClientDetails()
    {
        $scope.clientdetails = "";
        $scope.current.client = "";
        clientServices.addCurrentClient($scope.current.client,"Clientid");
    }

    function addNewClient()
    {
        var err = validateClientForm();
        if (err)
            return false;

        var data = $("#adminClientForm").serialize();
        
        clientFactory.addUpdateClient(data)
            .success( function(data) {
                getClientList();

                getClientDetails(data); 

                alert("Succesfully addUpdate client");
            })
            .error( function(edata) {
                alert("Failed addUpdate client");
            });
        
    }

    init();
    function init() {
        // client process
        var clientObj = clientServices.getCurrentClient();
        if (clientObj != "")
        {
            $scope.current.client = clientObj.id;

            getClientDetails($scope.current.client);
        }

        getClientList();

        $scope.states = stateService.getStateList();
        $scope.statuses = clientStatusService.getStatusList();
    };

    // get client details
    $scope.showClientInformation = function (id) {
        getClientDetails(id);
    }

    // clear client details
    $scope.clearClientDetails = function () {
        clearClientDetails();
    }

    // add new client 
    $scope.addNewClient = function () {
        addNewClient();
    }

    
}

controllers.taxesController = function ($scope, $http, $location) {

    init();
    function init() {
      
    };
}

controllers.reports = function ($scope, $http, $location) {

    init();
    function init() {
      
    };
}


seApp.controller(controllers); 
