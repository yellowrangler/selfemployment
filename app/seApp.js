var seApp = angular.module ('seApp', ['ngRoute']);


// define routes for app
seApp.config(function ($routeProvider) {
    $routeProvider
        .when('/dashboard',
            {
                controller: 'dashboardController',
                templateUrl: 'app/partials/dashboard.html'
            })  
        .when('/adminclients',
            {
                controller: 'adminclientsController',
                templateUrl: 'app/partials/adminclients.html'
            })     
        .when('/timeentrydaily',
            {
                controller: 'timeentrydailyController',
                templateUrl: 'app/partials/timeentrydaily.html'
            })
        .when('/timeentryreview',
            {
                controller: 'timeentryreviewController',
                templateUrl: 'app/partials/timeentryreview.html'
            }) 
        .when('/invoicecreate',
            {
                controller: 'invoicesController',
                templateUrl: 'app/partials/invoicescreate.html'
            })  
        .when('/taxes',
            {
                controller: 'taxesController',
                templateUrl: 'app/partials/taxes.html'
            })  
        .when('/reports',
            {
                controller: 'reportsController',
                templateUrl: 'app/partials/reports.html'
            })  
        .when('/other',
            {
                controller: 'd3Controller',
                templateUrl: 'app/partials/home.html'
            })     
        .otherwise({redirectTo: '/home' });
});