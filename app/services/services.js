seApp.service('clientServices', function () {
    this.getCurrentClient = function () {
        var currentClient = "";
        var currentClientStr = this.retreiveCurrentClient();
        if (currentClientStr != ""  && currentClientStr != null)
        {
            currentClient = JSON.parse(currentClientStr);
        }

        return currentClient;
    }

    this.addCurrentClient = function (id, name) {
        var msg ="";
 
        var currentClient = "{\"id\":\""+id;
        currentClient = currentClient+"\",\"name\":\""+name;
        currentClient = currentClient+"\"}";

        this.saveCurrentClient(currentClient);

        return msg;
    }

    this.removeCurrentClient = function () {
        localStorage.removeItem("currentClient");
    }

    this.saveCurrentClient = function (jsonStr) {
        localStorage.removeItem("currentClient");
        localStorage.setItem("currentClient", jsonStr);
    }

    this.retreiveCurrentClient = function () {
        var currentClientStr = localStorage.getItem("currentClient");

        return currentClientStr;
    }

});

seApp.service('projectServices', function () {
    this.getCurrentProject = function () {
        var currentProject = "";
        var currentProjectStr = this.retreiveCurrentProject();
        if (currentProjectStr != ""  && currentProjectStr != null)
        {
            currentProject = JSON.parse(currentProjectStr);
        }

        return currentProject;
    }

    this.addCurrentProject = function (id, name) {
        var msg ="";

        var currentProject = "{\"id\":\""+id;
        currentProject = currentProject+"\",\"name\":\""+name;
        currentProject = currentProject+"\"}";

        this.saveCurrentProject(currentProject);

        return msg;
    }

    this.removeCurrentProject = function () {
        localStorage.removeItem("currentProject");
    }

    this.saveCurrentProject = function (jsonStr) {
        localStorage.removeItem("currentProject");
        localStorage.setItem("currentProject", jsonStr);
    }

    this.retreiveCurrentProject = function () {
        var currentProjectStr = localStorage.getItem("currentProject");

        return currentProjectStr;
    }

});

seApp.service('dateServices', function () {
    this.createDateForDisplay = function(date)
    {
        var dd = date.getDate();
        var mm = date.getMonth()+1; //January is 0!
        var yyyy = date.getFullYear();

        if(dd<10) {
            dd='0'+dd
        } 

        if(mm<10) {
            mm='0'+mm
        } 

        date = mm+'/'+dd+'/'+yyyy;

        return date;
    }
    this.getCurrentDateForDisplay = function()
    {
        var today = new Date();

        today = this.createDateForDisplay(today);

        return today;
    }

    this.getTimeDifference = function(valuestart, valuestop) {
        var second = 1000;
        var minute = 60 * second;
        var hour = 60 * minute;

        //create date format          
        var timeStart = new Date("01/01/2007 " + valuestart).getTime();
        var timeEnd = new Date("01/01/2007 " + valuestop).getTime();;

        var millisecndsDiff = timeEnd - timeStart;  
        var hoursMinutesDiff = millisecndsDiff / hour;
        var roundedValue = Math.round(hoursMinutesDiff * 100)/100;

        return roundedValue.toFixed(2);
    }

    this.getDateforNextWeek = function(datestart) {
        var firstDay = new Date(datestart);
        var nextWeek = new Date(firstDay.getTime() + 7 * 24 * 60 * 60 * 1000);
        
        nextWeek = this.createDateForDisplay(nextWeek);
        
        return nextWeek;
    }

    this.getWeekEndingDate = function(datestart) {
        var firstDay = new Date(datestart);
        var we = new Date(firstDay.getTime() + 7 * 24 * 60 * 60 * 1000);

        we.setDate(we.getDate()-1);
        
        weekEnding = this.createDateForDisplay(we);
        
        return weekEnding;
    }

});

seApp.service('stateService', function () {

    this.getStateList = function() {
        return states;
    }

    var states = [
        { value: "AL", name: "Alabama" },
        { value: "AK", name: "Alaska" },
        { value: "AZ", name: "Arizona" },
        { value: "AR", name: "Arkansas" },
        { value: "CA", name: "California" },
        { value: "CO", name: "Colorado" },
        { value: "CT", name: "Connecticut" },
        { value: "DE", name: "Delaware" },
        { value: "DC", name: "District of Columbia" },
        { value: "FL", name: "Florida" },
        { value: "GA", name: "Georgia" },
        { value: "HI", name: "Hawaii" },
        { value: "ID", name: "Idaho" },
        { value: "IL", name: "Illinois" },
        { value: "IN", name: "Indiana" },
        { value: "IA", name: "Iowa" },
        { value: "KS", name: "Kansas" },
        { value: "KY", name: "Kentucky" },
        { value: "LA", name: "Louisiana" },
        { value: "ME", name: "Maine" },
        { value: "MD", name: "Maryland" },
        { value: "MA", name: "Massachusetts" },
        { value: "MI", name: "Michigan" },
        { value: "MN", name: "Minnesota" },
        { value: "MS", name: "Mississippi" },
        { value: "MO", name: "Missouri" },
        { value: "MT", name: "Montana" },
        { value: "NE", name: "Nebraska" },
        { value: "NV", name: "Nevada" },
        { value: "NH", name: "New Hampshire" },
        { value: "NJ", name: "New Jersey" },
        { value: "NM", name: "New Mexico" },
        { value: "NY", name: "New York" },
        { value: "NC", name: "North Carolina" },
        { value: "ND", name: "North Dakota" },
        { value: "OH", name: "Ohio" },
        { value: "OK", name: "Oklahoma" },
        { value: "OR", name: "Oregon" },
        { value: "PA", name: "Pennsylvania" },
        { value: "RI", name: "Rhode Island" },
        { value: "SC", name: "South Carolina" },
        { value: "SD", name: "South Dakota" },
        { value: "TN", name: "Tennessee" },
        { value: "TX", name: "Texas" },
        { value: "UT", name: "Utah" },
        { value: "VT", name: "Vermont" },
        { value: "VA", name: "Virginia" },
        { value: "WA", name: "Washington" },
        { value: "WV", name: "West Virginia" },
        { value: "WI", name: "Wisconsin" },
        { value: "WY", name: "Wyoming" }
    ];

});

seApp.service('clientStatusService', function () {

    this.getStatusList = function() {
        return status;
    }

    var status = [
        { value: "1", name: "Active" },  
        { value: "0", name: "In-Active" }
    ];

});