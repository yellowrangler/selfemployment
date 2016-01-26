// define factories
seApp.factory('clientFactory', function($q, $http) {
    var factory = {};

    factory.getClients = function (data) {
        return $http({ 
            method: 'POST', 
            url: "app/ajax/getclients.php",
            data: data,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        })
    }

    factory.getClientDetails = function (data) {
        return $http({ 
            method: 'POST', 
            url: "app/ajax/getclientdetails.php",
            data: data,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        })
    }

    factory.addUpdateClient = function (data) {
        return $http({ 
            method: 'POST', 
            url: "app/ajax/addupdateclient.php",
            data: data,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        })
    }

    return factory;

});

seApp.factory('projectFactory', function($q, $http) {
    var factory = {};

    factory.getClientProjects = function (data) {
        return $http({ 
            method: 'POST', 
            url: "app/ajax/getclientprojects.php",
            data: data,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        })
    }

    factory.getClientProject = function (data) {
        return $http({ 
            method: 'POST', 
            url: "app/ajax/getclientproject.php",
            data: data,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        })
    }

    return factory;

});

seApp.factory('timeDailyEntryFactory', function($q, $http) {
    var factory = {};

    factory.addDailyTime = function (data) {
        return $http({ 
            method: 'POST', 
            url: "app/ajax/addtimedailyentry.php",
            data: data,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        })
    }

    factory.updateDailyTime = function (data) {
        return $http({ 
            method: 'POST', 
            url: "app/ajax/updatetimedailyentry.php",
            data: data,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        })
    }

    factory.getDailyTime = function (data) {
        return $http({ 
            method: 'POST', 
            url: "app/ajax/gettimedailyentry.php",
            data: data,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        })
    }

    factory.deleteDailyTime = function (data) {
        return $http({ 
            method: 'POST', 
            url: "app/ajax/deletetimedailyentry.php",
            data: data,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        })
    }

    factory.getDailyTimeReview = function (data) {
        return $http({ 
            method: 'POST', 
            url: "app/ajax/gettimedailyentryreview.php",
            data: data,
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        })
    }

    return factory;

});
