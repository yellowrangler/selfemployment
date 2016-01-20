// define controllers for app
var controllers = {};

controllers.dashboardController = function ($scope, $http, $location) {

    init();
    function init() {
      
    };
}

controllers.administrationController = function ($scope, $http, $location, clientServices, clientFactory) {
    $scope.clients = "";
    $scope.currentClient = "";

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
            $scope.currentClient = clientObj.id;
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
    $scope.clients = "";
    $scope.currentClient = "";
    $scope.projects = "";
    $scope.currentProject = "";   
    $scope.timeDailyEntries = "";
    $scope.timeDailyEntryTotal = "0.00";
        
    function getClientProjectList(id) 
    {
        $scope.currentClient = id;
        clientServices.addCurrentClient($scope.currentClient,"Clientid");
        var clientidStr = "clientid="+$scope.currentClient;    
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
    function setCurrentProject(id) 
    {
        $scope.currentProject = id;
        projectServices.addCurrentProject($scope.currentProject,"Projectid");
    }

    // add new time entry
    function insertDailyEntry()
    {
        var clientid = $scope.currentClient;
        var projectid = $scope.currentProject;
        var entrydate = $("#datepicker").val();
        var starttime = $("#starttime").val();
        var stoptime = $("#stoptime").val();
        var interval = $("#timeIterval").val();
        var comment = $("#intervaldescription").val();

        var data = "clientid="+clientid+"&projectid="+projectid+"&entrydate="+entrydate+"&starttime="+starttime+"&stoptime="+stoptime+"&interval="+interval+"&comment="+comment;

        timeDailyEntryFactory.addDailyTime(data)
                .success( function(sdata) {
                    $("#starttime").val("");
                    $("#stoptime").val("");
                    $("#timeIterval").val("");
                    $("#intervaldescription").val("");
                    
                    getDailyEntryHistory();
                })
                .error( function(edata) {
                    alert("Failed ajax to add time entry");
                });
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
        var clientid = $scope.currentClient;
        var projectid = $scope.currentProject;
        var entrydate = $("#datepicker").val();

        var data = "clientid="+clientid+"&projectid="+projectid+"&entrydate="+entrydate;

        timeDailyEntryFactory.getDailyTime(data)
            .success( function(JSONstr) {
                $scope.timeDailyEntries = JSONstr;

                var nbr = 0;
                $.each(JSONstr, function () {
                     nbr = nbr + parseFloat(this.finterval);
                });

                nbr = nbr.toFixed(2);
                $scope.timeDailyEntryTotal = nbr.toString();
            })
            .error( function(edata) {
                alert("Failed ajax to get time entry history");
            });
    }
    
    init();
    function init() {
        // date stuff
        $( "#datepicker" ).datepicker();

        $( "#datepicker" ).change(function() {
            if ($("#datepicker").val() == "")
            {
                $("#datepicker").val(dateServices.getCurrentDateForDisplay());
            }
            
            $("#starttime").val("");
            $("#stoptime").val("");
            $("#timeIterval").val("");
            $("#intervaldescription").val("");

            getDailyEntryHistory();
        });

        if ($("#datepicker").val() == "")
        {
            $("#datepicker").val(dateServices.getCurrentDateForDisplay());

            getDailyEntryHistory();
        }

        // time stuff
        $("#timeIterval").focus(function() {
            var starttime = $("#starttime").val();
            var stoptime = $("#stoptime").val();
            if (starttime != "" && stoptime != "")
            {
                var tdiff = dateServices.getTimeDifference(starttime, stoptime);
                $("#timeIterval").val(tdiff);

                return false;
            }
        });

        // client process
        var clientObj = clientServices.getCurrentClient();
        if (clientObj != "")
        {
            $scope.currentClient = clientObj.id;
            getClientProjectList($scope.currentClient);
        }

        // get client list
        getClientList();

        // project process
        var projectObj = projectServices.getCurrentProject();
        if (projectObj != "")
        {
            $scope.currentProject = projectObj.id;
            getDailyEntryHistory();
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

    // add new time entry
    $scope.insertDailyEntry = function ()
    {
        insertDailyEntry();
    }

    // delete the time entry daily
    $scope.deleteTimeEntryDaily = function (id)
    {
        deleteTimeEntryDaily(id);
    }
}

controllers.timeentryreviewController = function ($scope, $http, $location, clientServices, projectServices, dateServices, clientFactory, projectFactory, timeDailyEntryFactory) {

    $scope.clients = "";
    $scope.currentClient = "";
    $scope.projects = "";
    $scope.currentProject = "";   
    $scope.timeDailyEntriesReview = "";
    $scope.timeDailyEntryReviewTotal = "0.00";

        
    function getClientProjectList(id) 
    {
        $scope.currentClient = id;
        clientServices.addCurrentClient($scope.currentClient,"Clientid");
        var clientidStr = "clientid="+$scope.currentClient;    
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
    function setCurrentProject(id) 
    {
        $scope.currentProject = id;
        projectServices.addCurrentProject($scope.currentProject,"Projectid");
    }

        
    // get time entries for today
    // add new time entry
    function getDailyEntryHistoryReview()
    {
        var clientid = $scope.currentClient;
        var projectid = $scope.currentProject;
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
            $scope.currentClient = clientObj.id;
            getClientProjectList($scope.currentClient);
        }

        // get client list
        getClientList();

        // project process
        var projectObj = projectServices.getCurrentProject();
        if (projectObj != "")
        {
            $scope.currentProject = projectObj.id;
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
    $scope.currentClient = "";
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
            $scope.currentClient  = id;
        }

        var clientid = $scope.currentClient ;
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
            $scope.currentClient = clientObj.id;
        }
        getClientList();
    }

    // client project time list for dates
    $scope.getTimeEntriesForClient = function (id) {
        getTimeEntriesForClient(id);
    }
}

controllers.adminclientsController = function ($scope, $http, $location, clientServices, clientFactory, stateService, clientStatusService) {
    $scope.clients = "";
    $scope.currentClient = "";
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
        $scope.currentClient = clientid;
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
        $scope.currentClient = 0;
        clientServices.addCurrentClient($scope.currentClient,"Clientid");
        $("#clientid").val("0");
    }

    function addNewClient()
    {
        var err = validateClientForm();
        if (err)
            return false;

        var data = $("#adminClientForm").serialize();
        
        clientFactory.addUpdateClient(data)
                .success( function(data) {
                    getClientDetails(data); 
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
            $scope.currentClient = clientObj.id;

            getClientDetails($scope.currentClient);
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
